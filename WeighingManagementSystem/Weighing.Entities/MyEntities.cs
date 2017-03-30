using OanTech.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Weighing.Entities
{
    public class MyEntities : EntitiesType
    {
        private MyEntities(String val) : base(val) { }
        public static readonly EntitiesType AccountManagement = new MyEntities("AccountManagementEntities");
        public static readonly EntitiesType Common = new MyEntities("CommonEntities");
        public static readonly EntitiesType Oracle = new MyEntities("OracleEntities");
        public static readonly EntitiesType Preparation = new MyEntities("PreparationEntities");
        public static readonly EntitiesType Debagging = new MyEntities("DebaggingEntities");
        public static readonly EntitiesType Terminal = new MyEntities("TerminalEntities");
        public static readonly EntitiesType Setting = new MyEntities("SettingEntities");
    }
}
