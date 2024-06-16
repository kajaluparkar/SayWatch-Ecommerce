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
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Assuming you have the user's name stored in session
                string userName = Session["userName"] as string;
                if (!string.IsNullOrEmpty(userName))
                {
                    Label1.Text = userName;
                }
            }

        }

      
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string fn = null;

            if (fuProductImage.HasFile)
            {
                fn = fuProductImage.FileName;
                fuProductImage.SaveAs(Server.MapPath(fn));
            }
            string connectionString = ConfigurationManager.ConnectionStrings["MyEshopping"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("Insertwatch", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Pass parameter values
                cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text);
                cmd.Parameters.AddWithValue("@ProductImage", fn); // You need to handle this properly
                cmd.Parameters.AddWithValue("@ProductPrice", Convert.ToDecimal(txtProductPrice.Text));
                cmd.Parameters.AddWithValue("@ProductDes", txtProductDescription.Text); // Adjust this parameter

                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Optionally, you can redirect the user to another page after the product is added
            Session["AlertMessage"] = "Watch details Added successfully!";
            Session["AlertType"] = "success";
            Response.Redirect("admindashboard.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("editproduct.aspx");
        }
    }
}