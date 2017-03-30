using OanTech.Framework.OanTechHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Weighing.Debagging.Models;
using Weighing.Entities;

namespace Weighing.Debagging.Logic
{
    public class DebaggingLogic
    {
        OanTechHelper entDebagging = new OanTechHelper(MyEntities.Debagging);
        public bool ValidationTask(string MONumber, string ItemCode, string LotNo, string User)
        {
            OracleHeader oracleH = entDebagging.Resolve<OracleHeader>().Get(x => x.MoNumber == MONumber);
            TaskTimbang taskTimbang = entDebagging.Resolve<TaskTimbang>().Get(x => x.OracleHeaderId == oracleH.OracleHeaderId && x.ItemCode == ItemCode && x.LotNo == LotNo);

            //Update User & Terminal
            return false;
        }
    }
}
