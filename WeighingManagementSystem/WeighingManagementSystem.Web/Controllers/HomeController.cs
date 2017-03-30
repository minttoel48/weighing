using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OanTech.Framework.OanTechHelper;
using AccountManagement.Models;

namespace OANTech.Web.Controllers
{
    public class HomeController : Controller
    {
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

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return Content("<script language='javascript' type='text/javascript'>alert('test');window.location.assign('/Home/Index')</script>");
            //return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult PageHelper()
        {
            return View();
        }

        //Function
        private bool CheckSession()
        {
            if (Session["Username"] != null)
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