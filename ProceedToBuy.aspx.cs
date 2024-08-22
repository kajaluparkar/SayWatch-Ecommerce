using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace SayWatch_Ecommerce
{
    public partial class ProceedToBuy : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["MyEshopping"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnProceed_Click(object sender, EventArgs e)
        { 
         // Retrieve form data
            string name = txtName.Text;
        string address = txtAddress.Text;
        string city = txtCity.Text;
        string state = txtState.Text;
        string zipCode = txtZipCode.Text;
        string phone = txtPhone.Text;
        string paymentMethod = ddlPaymentMethod.SelectedValue;


            // Save the order details in the database
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();

                // Insert order details into Orders table
                string orderQuery = "INSERT INTO Orders (_Name, _Address, City, _State, ZipCode, Phone, PaymentMethod, OrderDate) OUTPUT INSERTED.OrderId VALUES ( @Name, @Address, @City, @State, @ZipCode, @Phone, @PaymentMethod, @OrderDate)";
                SqlCommand cmd = new SqlCommand(orderQuery, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@City", city);
                cmd.Parameters.AddWithValue("@State", state);
                cmd.Parameters.AddWithValue("@ZipCode", zipCode);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);

                // Get the inserted OrderId
                int orderId = (int)cmd.ExecuteScalar();

                //// Insert each item from the cart into OrderItems table
                //string sid = Session["sid"].ToString();
                //string cartQuery = "SELECT watchid, quantity, watchprice * quantity as totalamount FROM addtocart WHERE sessionid = @sid";
                //SqlCommand cartCmd = new SqlCommand(cartQuery, con);
                //cartCmd.Parameters.AddWithValue("@sid", sid);

                //SqlDataReader reader = cartCmd.ExecuteReader();

                //while (reader.Read())
                //{
                //    string watchId = reader["watchid"].ToString();
                //    int quantity = Convert.ToInt32(reader["quantity"]);
                //    decimal totalAmount = Convert.ToDecimal(reader["totalamount"]);

                //    string orderItemsQuery = "INSERT INTO OrderItems (OrderId, WatchId, Quantity, TotalAmount) VALUES (@OrderId, @WatchId, @Quantity, @TotalAmount)";
                //    SqlCommand cmdOrderItems = new SqlCommand(orderItemsQuery, con);
                //    cmdOrderItems.Parameters.AddWithValue("@OrderId", orderId);
                //    cmdOrderItems.Parameters.AddWithValue("@WatchId", watchId);
                //    cmdOrderItems.Parameters.AddWithValue("@Quantity", quantity);
                //    cmdOrderItems.Parameters.AddWithValue("@TotalAmount", totalAmount);
                //    cmdOrderItems.ExecuteNonQuery();
                //}
                //reader.Close();

                //// Clear the cart after successful order placement
                //string clearCartQuery = "DELETE FROM addtocart WHERE sessionid = @SessionId";
                //SqlCommand cmdClearCart = new SqlCommand(clearCartQuery, con);
                //cmdClearCart.Parameters.AddWithValue("@SessionId", sid);
                //cmdClearCart.ExecuteNonQuery();


                // Store order details in session variables
                Session["OrderId"] = orderId;
            }

// Redirect to the order confirmation page
Response.Redirect("OrderConfirmation.aspx");
        }
}
    }
