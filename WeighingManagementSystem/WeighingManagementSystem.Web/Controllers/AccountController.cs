using AccountManagement.Models;
using OanTech.Common;
using OanTech.Framework.OanTechHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OANTech.Web.Controllers
{
    public class AccountController : Controller
    {
        OanTechHelper ent = new OanTechHelper(MyEntities.AccountManagement);
        public ActionResult Login()
        {
            Session.Clear();
            ViewBag.Title = "Login";
            ViewBag.dataRole = new SelectList(GetUserRoleList(), "RoleId", "RoleName");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(FormCollection form)
        {
            //Session["BurgerStatus"] = "Opened";
            //HttpCookie cokie = new HttpCookie("NavBar");
            //cokie.Value = "NavBar=Opened";
            
            String username = form["username"].ToString();
            String password = form["password"].ToString();
            String role = form["dataRole"].ToString();
            int roleId = Int32.Parse(role);

            User usr = GetUserData(username, password, roleId);
            if (usr != null)
            {
                Session["username"] = usr.Username;
                Session["role"] = usr.Role.RoleName;
                Session["DisplayName"] = usr.DisplayName;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                OanTechLog.Info("Invalid Login Attemp for Username: " + username + ".");
                ViewBag.Message = "Invalid Login Attemp!";
                return RedirectToAction("Login", "Account");
            }
        }

        //Function
        private List<Role> GetUserRoleList()
        {
            List<Role> result = ent.Resolve<Role>().GetAll().OrderBy(x => x.RoleName).ToList();
            return result;
        }

        private User GetUserData(string username, string password, int roleId)
        {
            return ent.Resolve<User>().Get(x => x.Username == username && x.Password == password && x.RoleId == roleId);
        }
    }
}