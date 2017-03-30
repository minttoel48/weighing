using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OanTech.Common;

namespace OANTech.Web
{
    public class MyEntities : EntitiesType
    {
        private MyEntities(String val) : base(val) { }
        public static readonly EntitiesType AccountManagement = new MyEntities("AccountManagementEntities");
    }
}