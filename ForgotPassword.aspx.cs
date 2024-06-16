using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SayWatch_Ecommerce
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            // Dummy check - Replace this with actual email check and sending logic
            if (IsEmailRegistered(email))
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "A password reset link has been sent to your email address.";
                // Code to send password reset email goes here
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "This email address is not registered.";
            }
        }

        private bool IsEmailRegistered(string email)
        {
            // Replace with actual logic to check if the email is registered
            // This is just a dummy implementation
            return email == "test@example.com";
        }
    }
    }
