using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace SayWatch_Ecommerce
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {

            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        void Session_Start(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["watchid"] = 0;
            Session["OrderValue"] = "";
            Session["Discount"] = "";
            Session["Shipping"] = "";
            Session["TotalPayable"] = "";
            Session["OrderId"] = 0;
            Session["userId"] = 0;


        }
    }
}