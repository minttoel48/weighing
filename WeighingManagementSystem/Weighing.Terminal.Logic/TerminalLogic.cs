using OanTech.Common;
using OanTech.Framework.OanTechHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Weighing.Common.Logic;
using Weighing.Entities;
using Weighing.Terminal.Models;

namespace Weighing.Terminal.Logic
{
    public class TerminalLogic
    {
        OanTechHelper entTerminal = new OanTechHelper(MyEntities.Terminal);
        public void TerminalLogin(string TerminalId, int UserId, string password)
        {

        }
        public void ChangePassword(string TerminalId, int UserId, string oldPassword, string newPassword)
        {

        }
        public void RequestTask(string TerminalId, int UserId)
        {
            Int64 MOQueueId = 0;
            string MONumber = "";
            //BELUM!! Seharusnya digrouping terlebih dahulu terhadap Nomor MO, dengan default by : First In First Out DAN Skala Prioritas MO, tetapi harus selesai per TASK
            //Ketika Processed jadi TaskTimbang, masukin table QueueMO isinya: MONumber, IsPriority, Sequence, status.

            //1. Pertama cari yang on progress (status = "EXE")
            MOQueue moOnProgress = entTerminal.Resolve<MOQueue>().Get(x => x.Status == "EXE");

            //2. Jika ada yg on Progress maka selesaikan
            if (moOnProgress != null)
            {
                MOQueueId = moOnProgress.MOQueueId;
                MONumber = moOnProgress.MoNumber;
            }
            else
            {
                //3. Jika ga ada yang sedang dikerjakan, ambil yang prioritas utama, urutan berdasarkan MOQueueId
                MOQueue moPriority = entTerminal.Resolve<MOQueue>().GetAll(x => x.Status == "NEW" && x.IsPriority == true).OrderBy(x => x.MOQueueId).FirstOrDefault();

                if (moPriority != null)
                {
                    MOQueueId = moPriority.MOQueueId;
                    MONumber = moPriority.MoNumber;
                }
                else
                {
                    //4. Jika ga ada yang prioritas, ambil MO paling pertama masuk FIFO, berdasarkan urutan Execute Date & MOQueueId
                    MOQueue moFifo = entTerminal.Resolve<MOQueue>().GetAll(x => x.Status == "NEW").OrderBy(x => x.ExecuteDate).ThenBy(x => x.MOQueueId).FirstOrDefault();
                    if (moFifo != null)
                    {
                        MOQueueId = moFifo.MOQueueId;
                        MONumber = moFifo.MoNumber;
                    }
                    else
                    {
                        //Tidak ada MO yang harus dikerjakan
                    }
                }
            }

            if (MONumber != "")
            {
                //IsProcessed True artinya sudah dibentuk TaskTimbang
                List<Int64> listOracleHId = entTerminal.Resolve<OracleHeader>().GetAll(x => x.MoNumber == MONumber && x.IsProcessed == true).Select(x => x.OracleHeaderId).ToList();

                //Cek dulu apakah semua Task Timbang untuk MO Number ini sudah diproses semua atau belum, jika sudah semua TMB atau COM, update MOQueue status jadi COM
                int taskPending = entTerminal.Resolve<TaskTimbang>().GetAll(x => listOracleHId.Contains(x.OracleHeaderId) && x.Status.Contains("PREP")).Count();

                if (taskPending > 0)
                {
                    //Get Semua Data Terminal Configuration Terlebih dahulu
                    List<TerminalConfiguration> listAllTerminal = entTerminal.Resolve<TerminalConfiguration>().GetAll();

                    //Terminal Requester
                    TerminalConfiguration terminal = listAllTerminal.Where(x => x.TerminalId == TerminalId).FirstOrDefault();

                    if (terminal.IsActive)
                    {
                        //Get (Task Allergen / Non Allergen) & sesuai dengan type timbangan (B / K)
                        var listItemPeMO = (from a in entTerminal.Resolve<TaskTimbang>().AsQueryable()
                                     .Where(x => listOracleHId.Contains(x.OracleHeaderId) && x.IsAllergen == terminal.IsAllergen && x.Type == terminal.TerminalCategory)
                                     group a by new { a.ItemCode } into g
                                     orderby g.Count(x => x.ItemCode != null) descending
                                     select new
                                     {
                                         ItemCode = g.Key.ItemCode,
                                         Qty = g.Count(x=> x.ItemCode != null),
                                         TerminalAssign = g.Count(x=> x.TerminalId != null)
                                     }).ToList();


                        //var listItemPeMO = (from a in entTerminal.Resolve<TaskTimbang>().AsQueryable()
                        //                .Where(x => listOracleHId.Contains(x.OracleHeaderId) && x.Status == "PREP" && x.IsAllergen == terminal.IsAllergen && x.Type == terminal.TerminalCategory)
                        //                    group a by a.ItemCode into g
                        //                    let qty = g.Count()
                        //                    orderby qty descending
                        //                    select new { ItemCode = g.Key, Qty = qty }).ToList();

                        //jika sudah tidak ada Item lain yang kosong, maka boleh cross Item
                        bool allowCrossItem = listItemPeMO.Where(x => x.TerminalAssign == 0).Count() > 0 ? false : true;

                        
                        //Bagi Task
                        foreach (var item in listItemPeMO)
                        {
                            //Daftar Terminal yang sedang Execute Item Code ini
                            List<TaskTimbang> listTaskTimbangPerItem = entTerminal.Resolve<TaskTimbang>().GetAll(x => x.ItemCode == item.ItemCode.ToString() && x.Type == terminal.TerminalCategory);
                            List<string> listTerminalActive = listTaskTimbangPerItem.Where(x => x.ItemCode == item.ItemCode.ToString() && x.TerminalId != null && x.Type == terminal.TerminalCategory && x.Status == "TMB").Select(x => x.TerminalId).Distinct().ToList();
                            List<int?> terminalGroupActive = listAllTerminal.Where(x => listTerminalActive.Contains(x.TerminalId)).Select(x => x.TerminalGroup).Distinct().ToList();
                            int taskLeft = listTaskTimbangPerItem.Where(x => x.ItemCode == item.ItemCode.ToString() && x.TerminalId == null && x.Type == terminal.TerminalCategory && x.Status == "PREP").Count();

                            if (taskLeft > 0 && (terminalGroupActive.Contains(terminal.TerminalGroup) || listTerminalActive.Count == 0 || allowCrossItem))
                            {
                                //Masih ada Item tersebut yang belum ditimbang, kasi task yang sama karena 1 group
                                //kasi task sejumlah settingan, perhitungkan juga sisa tasknya jika < n%, kasi semua langsung
                                int taskTimbangCount = int.Parse(GS.GetValue("TASK_TIMBANG_COUNT"));

                                decimal percentage = ((Convert.ToDecimal(taskLeft) - Convert.ToDecimal(taskTimbangCount)) / Convert.ToDecimal(taskTimbangCount) * 100);

                                List<Int64> taskIdToAssign = new List<Int64>();

                                if (percentage < decimal.Parse(GS.GetValue("TASK_LEFT_PERCENTAGE")))
                                {
                                    //Set semua TASK sesuai taskLeft
                                    taskIdToAssign = listTaskTimbangPerItem.Where(x => x.ItemCode == item.ItemCode.ToString() && x.TerminalId == null && x.Status == "PREP").Select(x => x.TaskTimbangId).ToList();
                                }
                                else
                                {
                                    //Set jumlah TASK sesuai taskTimbangCount
                                    taskIdToAssign = listTaskTimbangPerItem.Where(x => x.ItemCode == item.ItemCode.ToString() && x.TerminalId == null && x.Status == "PREP").OrderBy(x => x.Seq).Take(taskTimbangCount).Select(x => x.TaskTimbangId).ToList();
                                }

                                //Update TaskTimbang, assign to Terminal
                                entTerminal.StartTransaction();

                                //update Status MOQueue jadi EXEcute
                                MOQueue queue = entTerminal.Resolve<MOQueue>().Get(x => x.MOQueueId == MOQueueId);
                                queue.Status = "EXE";

                                //Assign Task to Terminal Timbang
                                List<TaskTimbang> taskTimbangToAssign = entTerminal.Resolve<TaskTimbang>().GetAll(x => taskIdToAssign.Contains(x.TaskTimbangId));
                                DateTime executeDate = DateTime.Now;

                                taskTimbangToAssign.ForEach(x =>
                                {
                                    x.TerminalId = terminal.TerminalId;
                                    x.UserId = UserId;
                                    x.ExecuteDate = executeDate;
                                    x.Status = "TMB";
                                });

                                entTerminal.Save(TransactionAttribute.Commit);
                                break;
                            }
                        }
                    }
                    else
                    {
                        //ERROR : Terminal Tidak Active
                    }
                }
                else
                {
                    entTerminal.StartTransaction();
                    //update Status MOQueue jadi EXEcute
                    MOQueue queue = entTerminal.Resolve<MOQueue>().Get(x => x.MOQueueId == MOQueueId);
                    queue.Status = "COM";
                    entTerminal.Save(TransactionAttribute.Commit);
                }
            }
        }
    }
}

