using AccountManagement.Logic;
using AccountManagement.Models;
using OanTech.Common;
using OanTech.Framework;
using OanTech.Framework.OanTechHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Weighing.App.Web.Controllers
{
    public class AccountController : Controller
    {
        AccountManagementLogic obj = new AccountManagementLogic();
        public ActionResult Login()
        {
            Session.Clear();
            ViewBag.Title = "Login";
            ViewBag.dataRole = new SelectList(obj.GetUserRoleList(), "RoleId", "RoleName");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(FormCollection form)
        {
            //Session["BurgerStatus"] = "Opened";
            //HttpCookie cokie = new HttpCookie("NavBar");
            //cokie.Value = "NavBar=Opened";

            String userlogin = form["userlogin"].ToString();
            String userpin = form["userpin"].ToString();
            String role = form["dataRole"].ToString();
            Int64 roleId = Int64.Parse(role);

            User usr = obj.GetUserData(userlogin, userpin, roleId);
            if (usr != null)
            {
                Session["UserId"] = usr.UserId;
                Session["Role"] = obj.GetUserRole(roleId).RoleName;
                Session["DisplayName"] = usr.DisplayName;
                Session["SecurityToken"] = obj.GenerateSecurityToken(usr.UserId);
                return RedirectToAction("Index", "Home");
            }
            else
            {
                OanTechLog.Info("Invalid Login Attemp for User: " + usr.DisplayName + ".");
                ViewBag.Message = "Invalid Login Attemp!";
                return RedirectToAction("Login", "Account");
            }
        }
    }
}