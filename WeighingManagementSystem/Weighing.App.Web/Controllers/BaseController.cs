using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Weighing.App.Web.Controllers
{
    public class BaseController : Controller
    {
        // GET: Base
        public ActionResult NotAuthorized()
        {
            return View();
        }

        public ActionResult ViewMessage()
        {
            return PartialView("_MessagePopUp");
        }
    }
}