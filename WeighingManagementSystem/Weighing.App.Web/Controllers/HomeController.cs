using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OanTech.Framework.OanTechHelper;
using Weighing.App.Web.Helper;
//using AccountManagement.Models;

namespace Weighing.App.Web.Controllers
{
    public class HomeController : Controller
    {
        [SessionAuthorize]
        public ActionResult Index()
        {
            //Page Load
            //Check session
            if (!CheckSession())
            {
                return RedirectToAction("Login", "Account");
            }
            else
            {
                return View();
            }
            
        }

        [SessionAuthorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            //return Content("<script language='javascript' type='text/javascript'>alert('test');window.location.assign('/Home/Index')</script>");
            return View();
        }

        [SessionAuthorize]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [SessionAuthorize]
        public ActionResult PageHelper()
        {
            return View();
        }

        //Function
        private bool CheckSession()
        {
            if (Session["UserId"] != null && Session["Role"] != null && Session["DisplayName"] != null)
            {
                RedirectToAction("Index", "Home");
                return true;
            }
            else
            {
                RedirectToAction("Login", "Account");
                return false;
            }
        }
    }
}