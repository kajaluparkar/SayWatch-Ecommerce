using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SayWatch_Ecommerce
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = null;
            try
            {
                using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyEshopping"].ConnectionString))
                {
                    con.Open();
                    string query = "Insert into tblUser(username,pwd,gender,email) values(@un,@pass,@gender,@email);";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@un", txtUname.Text);
                    cmd.Parameters.AddWithValue("@pass", txtpass.Text);
                    string gender = null;
                    if (RadioMale.Checked)
                    {
                        gender = "Male";
                    }
                    else if (RadioFemale.Checked)
                    {
                        gender = "Female";
                    }
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);

                    cmd.ExecuteNonQuery();
                    Response.Write("<script> alert('Registeration Saved Succesfully !!!') </script>");
                    Clear();
                    Response.Redirect("default.aspx");

                }
            }


            catch (SqlException ex)
            {
                string userFriendlyMessage = "";

                // Check if the error is a unique key constraint violation
                if (ex.Message.Contains("UNIQUE KEY constraint") && ex.Message.Contains("tblUser"))
                {
                    // Extract the duplicate key value from the error message
                    string duplicateKeyValue = ex.Message.Split('(')[1].Split(')')[0];

                    // Set a user-friendly message
                    userFriendlyMessage = $"Sorry, the username '{duplicateKeyValue}' already exists. Please choose a new username and try again.";
                }

                else
                {
                    // Set a general error message for other SQL exceptions
                    userFriendlyMessage = "Sorry, Something is Missed, Please try again!!!";
                }

                // Display the user-friendly message
                Label1.Text = userFriendlyMessage;
            }

            finally
            {
                if (con != null)
                {
                    con.Close();
                }

            }

        }

        public void Clear()
        {
            txtUname.Text = string.Empty;
            txtpass.Text = string.Empty;
            txtConfirm.Text = string.Empty;
            RadioMale.Checked = false;
            RadioFemale.Checked = false;
            txtEmail.Text = string.Empty;
            txtUname.Focus();

        }
    }
    }
