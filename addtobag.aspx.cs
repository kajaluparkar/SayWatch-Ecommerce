using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SayWatch_Ecommerce
{
    public partial class addtobag : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["MyEshopping"].ConnectionString;
        SqlConnection con = null;
        SqlDataAdapter adapter = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            string sid = Session.SessionID;
            Session["sid"] = sid;
            int qty = 1;
            string wn = null;
            int wp = 0;
            string wimg = null;

            string wid = Request.QueryString["watchid"].ToString();
            con = new SqlConnection(strcon);
            //checking the cart table whether item exists or not
            string qr1 = "select count(*) from addtocart where watchid=@wid and sessionid=@sid";
            SqlCommand cmdc = new SqlCommand(qr1, con);
            cmdc.Parameters.AddWithValue("@wid", wid);
            cmdc.Parameters.AddWithValue("@sid", Session["sid"].ToString());
            con.Open();
            int res = Convert.ToInt32(cmdc.ExecuteScalar());
            con.Close();

            //insert record in cart table if record does not exist
            if (res == 0)
            {
                string qr = "select * from watches where watchid=@wid";
                SqlCommand cmd1 = new SqlCommand(qr, con);
                cmd1.Parameters.AddWithValue("@wid", wid);
                con.Open();
                SqlDataReader dr = cmd1.ExecuteReader();
                while (dr.Read())
                {
                    wn = dr["watchname"].ToString();
                    wp = Convert.ToInt32(dr["watchprice"].ToString());
                    wimg = dr["imagename"].ToString();
                }
                dr.Close();
                con.Close();
                qr = "insert into addtocart values(@wid,@wn,@wp,@wimg,@sid,@qty)";
                SqlCommand cmd = new SqlCommand(qr, con);
                cmd.Parameters.AddWithValue("@wid", wid);
                cmd.Parameters.AddWithValue("@wn", wn);
                cmd.Parameters.AddWithValue("@wp", wp);
                cmd.Parameters.AddWithValue("@wimg", wimg);
                cmd.Parameters.AddWithValue("@sid", Session["sid"].ToString());
                cmd.Parameters.AddWithValue("@qty", qty); con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("saved");
                con.Close();
                Response.Redirect("viewcart.aspx");
            }
            else
            {     //if record exist in cart then update the quantity
                string qr = "update addtocart set quantity=quantity+1 where watchid=@wid and sessionid=@sid";
                SqlCommand cmd1 = new SqlCommand(qr, con);
                cmd1.Parameters.AddWithValue("@wid", wid);
                cmd1.Parameters.AddWithValue("@sid", Session["sid"].ToString());
                con.Open();
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Redirect("viewcart.aspx");
            }
        }
    }
    }
