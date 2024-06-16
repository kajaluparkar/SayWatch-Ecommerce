using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace SayWatch_Ecommerce
{
    public partial class viewcart : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["MyEshopping"].ConnectionString;
        SqlConnection con = null;
        SqlDataAdapter adapter = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            string sid = Session["sid"].ToString();
            con = new SqlConnection(strcon);
            adapter = new SqlDataAdapter($"select watchid,watchname,watchprice,watchimage,quantity,watchprice*quantity as totalamount from addtocart where sessionid= '{sid}'", con);
            int orderValue = 0;
            int discount = 1000;
            int shipping = 0;
            int gtotal = 0;


            DataSet ds = new DataSet();
            if (!Page.IsPostBack)
            {

                adapter.Fill(ds, "addtocart");
                foreach (DataRow dr in ds.Tables["addtocart"].Rows)
                {
                   int itemTotal = Convert.ToInt32(dr["totalamount"]);
                    orderValue += itemTotal;

                }
                gtotal = orderValue - discount + shipping;
                OrderValueLabel.Text = orderValue.ToString();
                DiscountLabel.Text = discount.ToString();
                DiscountLabel.Text = discount.ToString();
                TotalPayLabel.Text = gtotal.ToString();
                ItemsCountLabel.Text = ds.Tables["addtocart"].Rows.Count.ToString();
                SummaryItemsCountLabel.Text = ds.Tables["addtocart"].Rows.Count.ToString();

                CartRepeater.DataSource = ds.Tables["addtocart"];
                CartRepeater.DataBind();
            }
        }

        protected void ProceedToCheckoutButton_Click(object sender, EventArgs e)
        {

        }

        protected void CartRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string res= e.CommandName.ToString();
            if (res == "Remove")
            {
                string watchId = e.CommandArgument.ToString();
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand($"DELETE FROM addtocart WHERE watchid = @watchid AND sessionid = @sessionid", con);
                    cmd.Parameters.AddWithValue("@watchid", watchId);
                    cmd.Parameters.AddWithValue("@sessionid", Session["sid"].ToString());
                    cmd.ExecuteNonQuery();
                    Response.Redirect("viewcart.aspx");
                }
                
            }
            if (res == "plus")
            {
                TextBox txtBox = ((TextBox)CartRepeater.Items[e.Item.ItemIndex].FindControl("txtQuantity"));
                string qt = txtBox.Text;
                int count = Convert.ToInt32(qt) + 1;
                txtBox.Text = count.ToString();

            }
            if (res == "minus")
            {
                TextBox txtBox = ((TextBox)CartRepeater.Items[e.Item.ItemIndex].FindControl("txtQuantity"));
                string qt = txtBox.Text;
                int count = Convert.ToInt32(qt) - 1;
                txtBox.Text = count.ToString();

            }

        }
    }
}