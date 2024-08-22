using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SayWatch_Ecommerce
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                string userName = Session["userName"] as string;
                if (!string.IsNullOrEmpty(userName))
                {
                    Label1.Text = userName;
                    phAuthenticated.Visible = true;
                    phNotAuthenticated.Visible = false; ;
                }
                else
                {
                    phAuthenticated.Visible = false;
                    phNotAuthenticated.Visible = true;
                }
            }
        }
    }
}