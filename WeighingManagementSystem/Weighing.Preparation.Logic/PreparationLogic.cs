using OanTech.Framework.OanTechHelper;
using OanTech.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using Weighing.Entities;
using Weighing.Preparation.Models;
using Weighing.Common.Logic;

namespace Weighing.Preparation.Logic
{
    public class PreparationLogic
    {
        OanTechHelper entPreparation = new OanTechHelper(MyEntities.Preparation);

        //View untuk melihat Daftar MO, bisa pilih set prioritas
        public List<string> GetListMO()
        {
            //bisa dimodifikasi kebutuhan view nya di depan hanya lihat MO atau yg lain
            return entPreparation.Resolve<OracleHeader>().GetAll(x => x.IsProcessed == false).Select(x => x.MoNumber).Distinct().ToList();
        }

        //Bikin function untuk View Detail MO

        public void GenerateTaskTimbang(string MONumber, DateTime? ExecuteDate, bool IsPriority)
        {
            entPreparation.StartTransaction();

            //disini proses MO yang akan dikerjakan. Save ke QueueMO table dengan detail urutan by ID Sequence dan jika ada prioritas
            //Table ini untuk nanti menentukan MO mana yang dikerjain dulu, ketika terminal Request Task
            MOQueue queue = new MOQueue();
            queue.MoNumber = MONumber;
            queue.ExecuteDate = ExecuteDate.HasValue ? ExecuteDate.Value : DateTime.Now.Date;
            queue.IsPriority = IsPriority;
            queue.Status = "NEW";
            entPreparation.Resolve<MOQueue>().Add(queue);

            List<OracleHeader> oracleH = entPreparation.Resolve<OracleHeader>().GetAll(x => x.MoNumber == MONumber && x.IsProcessed == false);
            int seqCounter = 1;

            foreach (OracleHeader dataOracleH in oracleH)
            {
                //Kondisi jika TIMBANG --//MUNGKIN KAH DIBUAT GET ALL DENGAN KONDISI ORDER ASC / DESC
                List<OracleDetail> oracleD = entPreparation.Resolve<OracleDetail>().GetAll(x => x.MOLineId == dataOracleH.MOLineId).OrderByDescending(x => x.LotQty).ToList();

                decimal? totalQty = oracleD.Select(x => x.LotQty).Sum();
                if (totalQty != null && totalQty >= dataOracleH.Qty)
                {
                    //Hitung jumlah BAG dari --> TIMBANG : TotalQty / QtyPerCharges || NON_TIMBANG : TotalQty / PackingSize
                    int nBag = dataOracleH.IsTimbang == true ? (int)Math.Ceiling(dataOracleH.Qty / dataOracleH.QtyPerCharge ?? 1) : (int)Math.Ceiling(dataOracleH.Qty / dataOracleH.PackingSize ?? 1);

                    int bagCounter = 1;
                    decimal qtyPerBag = 0;
                    decimal remainsQty = 0;

                    foreach (OracleDetail dataOracleD in oracleD)
                    {
                        remainsQty = remainsQty + dataOracleD.LotQty;

                        qtyPerBag = dataOracleH.IsTimbang == true ? dataOracleH.QtyPerCharge ?? 0 : dataOracleH.PackingSize ?? 0;

                        while (remainsQty >= qtyPerBag)
                        {
                            //Get New ED
                            DateTime newED = DateTime.Today.AddDays(Convert.ToDouble(dataOracleH.SelfLife));
                            
                            //Create Task Timbang
                            TaskTimbang taskTimbang = new TaskTimbang();
                            taskTimbang.Barcode = GenerateBarcodeNo(); //Generate Barcode No
                            taskTimbang.OracleHeaderId = dataOracleH.OracleHeaderId;
                            taskTimbang.Seq = seqCounter;
                            taskTimbang.BagNo = bagCounter.ToString() + " of " + nBag.ToString();
                            taskTimbang.ItemCode = dataOracleH.ItemCode;
                            taskTimbang.Weight = qtyPerBag;
                            taskTimbang.LotNo = dataOracleD.LotNo;
                            taskTimbang.ExpirationDate = dataOracleD.ExpirationDate;
                            taskTimbang.NewLotNo = dataOracleD.LotNo.ToString() + GenerateNewLotNo(dataOracleD.ItemCode, dataOracleD.LotNo, dataOracleH.DateRequired);
                            taskTimbang.NewExpirationDate = dataOracleD.ExpirationDate < newED ? dataOracleD.ExpirationDate : newED;
                            taskTimbang.Type = qtyPerBag > 5.00M ? "B" : "K";
                            taskTimbang.IsAllergen = dataOracleH.IsAllergen;
                            taskTimbang.IsTimbang = dataOracleH.IsTimbang;
                            taskTimbang.Status = "PREP";

                            remainsQty = remainsQty - qtyPerBag;
                            seqCounter += 1;
                            if (remainsQty >= qtyPerBag)
                            {
                                bagCounter += 1;
                            }
                            entPreparation.Resolve<TaskTimbang>().Add(taskTimbang);
                        }
                        dataOracleD.IsProcessed = true;
                    }
                }
                dataOracleH.IsProcessed = true;
            }
            entPreparation.Save(TransactionAttribute.Commit);
        }
        private string GenerateNewLotNo(string itemCode, string lotNo, DateTime executeDate)
        {
            string result = "";

            List<ItemLotMasterSequence> testing = entPreparation.Resolve<ItemLotMasterSequence>().GetAll();
            ItemLotMasterSequence itemLotSeq = entPreparation.Resolve<ItemLotMasterSequence>().Get(x => x.ItemCode == itemCode && x.LotNo == lotNo);

            if (itemLotSeq != null)
            {
                if (itemLotSeq.ExecutionDate < executeDate)
                {
                    //update +1 sequence, update tanggal sesuai execute date
                    itemLotSeq.ExecutionDate = executeDate;
                    itemLotSeq.Seq = itemLotSeq.Seq + 1;
                    entPreparation.Save();
                }

                result = itemLotSeq.Seq.ToString().PadLeft(itemLotSeq.Length, '0');
            }
            else
            {
                //Insert Item Lot Sequence baru, set return = 001
                ItemLotMasterSequence newItemLotSeq = new ItemLotMasterSequence();
                newItemLotSeq.ItemCode = itemCode;
                newItemLotSeq.LotNo = lotNo;
                newItemLotSeq.ExecutionDate = executeDate;
                newItemLotSeq.Length = 3;
                newItemLotSeq.Seq = 1;

                entPreparation.Resolve<ItemLotMasterSequence>().Add(newItemLotSeq);
                entPreparation.Save();
                result = "001";
            }
            return result;
        }
        private string GenerateBarcodeNo()
        {
            var chars = "0123456789";
            var stringChars = new char[int.Parse(GS.GetValue("BARCODE_LENGTH"))];
            var random = new Random();
            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }
            string barcode = new String(stringChars);
            TaskTimbang data = entPreparation.Resolve<TaskTimbang>().Get(x => x.Barcode == barcode);
            if (data != null)
            {
                return GenerateBarcodeNo();
            }
            else
            {
                return barcode;
            }
        }
    }
}
