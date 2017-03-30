using OanTech.Paging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OANTech.Web.ViewModel
{
    public class UserRoleViewModel
    {
        public int RoleId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime? BirthDate { get; set; }
        public string Email { get; set; }
    }

    public class UserRoleViewPaging
    {
        public IPagingHelper Paging { get; set; }
        public List<UserRoleViewModel> Data { get; set; }
    }
}