using AccountManagement.Models;
using OanTech.Framework;
using OanTech.Framework.OanTechHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Weighing.Entities;

namespace AccountManagement.Logic
{
    public class AccountManagementLogic
    {
        OanTechHelper entAccountManagement = new OanTechHelper(MyEntities.AccountManagement);
        public List<Role> GetUserRoleList()
        {
            List<Role> result = entAccountManagement.Resolve<Role>().GetAll().OrderBy(x => x.RoleName).ToList();
            return result;
        }
        public User GetUserData(string userlogin, string userpin, Int64 roleId)
        {
            var user = entAccountManagement.Resolve<User>().Get(x => x.UserLoginCode == userlogin && x.UserLoginPin == userpin);
            if (user != null && user.IsActive)
            {
                return user;
            }
            else
            {
                throw new Exception("User Not Active");
            }
        }

        public Role GetUserRole(Int64 roleId)
        {
            return entAccountManagement.Resolve<Role>().Get(x => x.RoleId == roleId);
        }

        public string GenerateSecurityToken(Int64 userId)
        {
            return OanTechSecurity.GenerateSecurity(userId.ToString()).TrimEnd('=');
        }
    }
}
