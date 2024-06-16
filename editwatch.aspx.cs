using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SayWatch_Ecommerce
{
    public partial class edit : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["MyEshopping"].ConnectionString;
        SqlConnection con = null;
        SqlCommand cmd = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Check if watchid is present in query string
                if (Request.QueryString["watchid"] != null)
                {
                    string wid = Request.QueryString["watchid"].ToString();

                    using (SqlConnection con = new SqlConnection(strcon))
                    {
                        con.Open();
                        string query = $"SELECT * FROM watches WHERE watchid = @WatchId";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@WatchId", wid);

                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            txtWatchId.Text = reader["watchid"].ToString(); 
                            txtWatchName.Text = reader["watchname"].ToString();
                            txtWatchPrice.Text = reader["watchprice"].ToString();
                            txtWatchDescription.Text = reader["watch_descrip"].ToString();
                            string imageUrl = reader["imagename"].ToString();
                            imgWatch.ImageUrl = imageUrl;

                        }
                        else
                        {
                            lblMessage.Text = "Watch ID not found.";
                        }

                        reader.Close();
                    }
                }
                else
                {
                    lblMessage.Text = "Watch ID is missing in query string.";
                }
            }
        }

        private void LoadWatchDetails(string watchId)
        {

           
        }
            protected void txtWatchImage_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string wid = Request.QueryString["watchid"].ToString();

            string fn = null;

            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();

                if (fileUploadImage.HasFile)
                {
                    fn = fileUploadImage.FileName;
                    fileUploadImage.SaveAs(Server.MapPath(fn));

                    string query = "UPDATE watches SET watchname = @WatchName, watchprice = @WatchPrice, watch_descrip = @WatchDescription, imagename = @ImageName WHERE watchid = @WatchId";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@WatchName", txtWatchName.Text);
                    cmd.Parameters.AddWithValue("@WatchPrice", decimal.Parse(txtWatchPrice.Text));
                    cmd.Parameters.AddWithValue("@WatchDescription", txtWatchDescription.Text);
                    cmd.Parameters.AddWithValue("@ImageName", fn);
                    cmd.Parameters.AddWithValue("@WatchId", wid);

                    cmd.ExecuteNonQuery();
                   

                    Session["AlertMessage"] = "Watch details updated successfully!";
                    Session["AlertType"] = "success";
                    Response.Redirect("admindashboard.aspx");

                }
                else
                {
                    string query = "UPDATE watches SET watchname = @WatchName, watchprice = @WatchPrice, watch_descrip = @WatchDescription WHERE watchid = @WatchId";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@WatchName", txtWatchName.Text);
                    cmd.Parameters.AddWithValue("@WatchPrice", decimal.Parse(txtWatchPrice.Text));
                    cmd.Parameters.AddWithValue("@WatchDescription", txtWatchDescription.Text);
                    cmd.Parameters.AddWithValue("@WatchId", wid);

                    cmd.ExecuteNonQuery();
                    Session["AlertMessage"] = "Watch details updated successfully!";
                    Session["AlertType"] = "success";
                    Response.Redirect("admindashboard.aspx");



                }
            }
        }

        protected void btnGoBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("admindashboard.aspx");

        }

        private void ShowAlertMessage(string message, string alertType)
        {
            string alertClass = $"alert alert-{alertType} alert-dismissible fade show";
            string alertHtml = $@"
        <div class='{alertClass}' role='alert'>
            <strong>{message}</strong>
            <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                <span aria-hidden='true'>&times;</span>
            </button>
        </div>";

            lblMessage.Text = alertHtml;
        }
    }
}