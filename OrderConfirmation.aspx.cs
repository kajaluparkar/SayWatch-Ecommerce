using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SayWatch_Ecommerce
{
    public partial class OrderConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["OrderValue"] != null)
                {
                    lblOrderValue.Text += Session["OrderValue"].ToString();
                    lblDiscount.Text += Session["Discount"].ToString();
                    lblShipping.Text += Session["Shipping"].ToString();
                    lblTotalPayable.Text += Session["TotalPayable"].ToString();
                    lblOrderDate.Text += DateTime.Now.ToString("f");
                }
                //else
                //{
                //    lblConfirmationMessage.Text = "There was an error processing your order.";
                //}
            }
        }
    }
}