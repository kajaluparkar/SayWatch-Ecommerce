using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace SayWatch_Ecommerce
{
    public partial class signin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["MyEshopping"].ConnectionString;
        SqlConnection con= null;
        SqlCommand cmd = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            try
            {

                con = new SqlConnection(strcon);
                con.Open();
                string r = null;
                string query = "Select * from tblUser where username = '" + txtUsername.Text + "'and pwd ='" + txtPassword.Text + "'";
                cmd = new SqlCommand(query, con);
                SqlDataReader reader = cmd.ExecuteReader();
                string un = null;
                if (reader.Read())
                {
                    r = reader["_role"].ToString();
                    un = reader["username"].ToString();
                    Session["username"] = un;
                    if (r == "user")
                    {
                        Response.Redirect("userdashboard.aspx");
                    }
                    else if (r == "admin")
                    {
                        Response.Redirect("admindashboard.aspx");
                    }
                    // Label1.Text = "Login Succesfully";
                    // Response.Redirect("about.aspx");
                }
                else
                {
                    Label1.Text = "Invalid UserName or Password";
                }
            }
            catch (SqlException ex)
            {
                Label1.Text += ex.Message;
            }
            finally {
                con.Close(); 
            }


        }
    }
    }
