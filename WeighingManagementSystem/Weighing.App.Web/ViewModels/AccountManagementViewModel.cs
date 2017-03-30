using OanTech.Paging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Weighing.App.Web.ViewModels
{
    public class AccountManagementViewModel
    {
        public string UserLoginCode { get; set; }
        public string UserLoginPin { get; set; }
        public string DisplayName { get; set; }
        public string Email { get; set; }
        public string PhoneNo { get; set; }
        public bool IsActive { get; set; }
    }

    public class AccountManagementViewPaging
    {
        public IPagingHelper Paging { get; set; }
        public List<AccountManagementViewModel> Data { get; set; }
    }
}