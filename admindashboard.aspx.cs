using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Security.Cryptography;
using System.Security.Principal;

namespace SayWatch_Ecommerce
{
    public partial class admindashboard : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["MyEshopping"].ConnectionString;
        SqlConnection con = null;
        SqlCommand cmd = null;
        SqlDataAdapter adapter = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(strcon);
            adapter = new SqlDataAdapter($"select * from watches", con);

            DataSet ds = new DataSet();
            if (!Page.IsPostBack)
            {
                adapter.Fill(ds, "watches");
                
                DataList1.DataSource = ds.Tables["watches"];
                DataList1.DataBind();
            }

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string res = e.CommandName.ToString();

            if(res == "edit")
            {
                string wid=e.CommandArgument.ToString();
                Response.Redirect("editwatch.aspx?watchid=" + wid);
            }
            if (res == "delete")
            {
                Label watchid = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("wid")); 
                string wi = watchid.Text;
                // Label1.Text = pi.ToString();
                string qr = "delete from watches  where watchid=@wi; ";
                SqlCommand com = new SqlCommand(qr, con);
                con.Open();
                com.Parameters.AddWithValue("@wi", wi);
                
                com.ExecuteNonQuery();
                con.Close();
                Session["AlertMessage"] = "Watch details Deleted successfully!";
                Session["AlertType"] = "success";
                Response.Redirect("admindashboard.aspx");
            }

        }
    }
}