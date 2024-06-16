using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SayWatch_Ecommerce
{
    public partial class viwedetails : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["MyEshopping"].ConnectionString;
        SqlConnection con = null;
        SqlCommand cmd = null;
        SqlDataAdapter adapter = null;
        string watchid = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            watchid = Request.QueryString["watchid"].ToString();
                Response.Write(watchid);
                con = new SqlConnection(strcon);
                con.Open();
                adapter = new SqlDataAdapter($"select * from watches where watchid= {watchid}", con);

                DataSet ds = new DataSet();
                if (!Page.IsPostBack)
                {

                    adapter.Fill(ds,"watches");

                    DataList1.DataSource = ds.Tables["watches"];
                    DataList1.DataBind();
                
                }
                con.Close();
            
        }

        protected void AddToBag_Click(object sender, EventArgs e)
        {

        }

        protected void BuyNow_Click(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string res = e.CommandName.ToString();

            if(res== "goback")
            {
                Response.Redirect("Default.aspx");
            }
            if(res=="addtobag")
            {
                string watchid=e.CommandArgument.ToString();
                Response.Redirect("addtobag.aspx?watchid="+watchid);
            }
            if(res== "buynow")
            {
                Response.Redirect("Buynow.aspx");
            }
        }
    }
}