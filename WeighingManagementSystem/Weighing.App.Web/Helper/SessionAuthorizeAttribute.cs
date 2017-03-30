using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Weighing.App.Web.Helper
{
    public class SessionAuthorizeAttribute : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (httpContext.Session["UserId"] != null && httpContext.Session["Role"] != null && httpContext.Session["DisplayName"] != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            RouteValueDictionary route = new RouteValueDictionary(new { Controller = "Account", Action = "Login" });            
            filterContext.Result = new RedirectToRouteResult(route);

            //filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary{{ "action", "Login" }, { "controller", "Account" }});
        }
    }
}