using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace SayWatch_Ecommerce
{
    public partial class _Default : Page
    {
        SqlConnection con = null;
        SqlDataAdapter da = null;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            
                using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyEshopping"].ConnectionString))
                {
                   
                    da = new SqlDataAdapter("select * from watches", con);
                    ds = new DataSet();
                    if (!Page.IsPostBack)
                    {
                        da.Fill(ds, "watches");
                        DataList1.DataSource = ds.Tables["watches"];
                        DataList1.DataBind();
                    }
                }


        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string watchid = e.CommandArgument.ToString();
            Response.Redirect("viewDetails.aspx?watchid=" + watchid);
        }
        //protected string GetVideoHtml()
        //{
        //    return @"
        //        <video width='100%' height='200' autoplay muted loop>
        //            <source src='watch_video.mp4' type='video/mp4'>
        //            Your browser does not support the video tag.
        //        </video>";
        //}
    }
}