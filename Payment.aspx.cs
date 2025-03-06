    using System;
    using System.Collections;
    using System.Configuration;
    using System.Data;
    using System.Linq;
    using System.Web;
    using System.Web.Security;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;
    using System.Web.UI.WebControls.WebParts;
    using System.Xml.Linq;
    using System.Data.SqlClient;
    using System.Net.Mail;
    using System.Net;

    namespace AdExcellence
    {
        public partial class WebForm20 : System.Web.UI.Page
        {
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            SqlDataAdapter da1 = new SqlDataAdapter();
            DataTable dt1 = new DataTable();
            SqlCommand cmd = new SqlCommand();


            SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            public void connection()
            {
                try
                {
                    cn.Close();
                    cn.Open();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.ToString() + "')</script>");
               
                }
            }


            protected void Page_Load(object sender, EventArgs e)
            {

                if (!(Page.IsPostBack == true))
                {
                    connection();
                    Ddlyear.Items.Clear();
                    for (int i = 1; i <= 20; i++)
                    {
                        Ddlyear.Items.Add((Convert.ToInt16(DateTime.Today.Year - 1) + i).ToString());
                    }

                    // call auto generate for order ID
                    autogenerate();
                    lblorderid.Text = Session["count"].ToString();

                    lblcid.Text = Session["LoginId"].ToString();
                    lbltotalamt.Text = Session["finalamount"].ToString();

                    //code for customer id.

                    //code to display total amount
                }
            }

            private void autogenerate()
            {
                int a = 0;
                da = new SqlDataAdapter("select max(payid) from payment", cn);
                dt = new DataTable();
                da.Fill(dt);
                Session["count"] = dt.Rows[0][0].ToString();
                try
                {
                    if (a.Equals(Session["count"]))
                    {
                        Session["count"] = 1;
                    }
                    else
                    {
                        Session["count"] = Convert.ToInt32(Session["count"].ToString()) + 1;
                    }
                }
                catch
                {
                    Session["count"] = 1;
                }
                da = null;
                dt = null;
            }


        

        

        protected void btnbook1_Click(object sender, EventArgs e)
        {
            String month, year;
            month = DateTime.Now.Date.Month.ToString();
            year = DateTime.Now.Date.Year.ToString();

            if (((txtn1.Text.Length) + (txtn2.Text.Length) + (txtn3.Text.Length) + (txtn4.Text.Length)) < 16)
            {
                lblerror.Text = "Enter proper 16 digit Card Number.";

            }
            else
            {
                if (Convert.ToInt32(Ddlyear.Text) == Convert.ToInt32(year))
                {
                    if (Convert.ToInt32(Ddlmonth.Text) < Convert.ToInt32(month))
                    {
                        lblerror.Text = "Your card is Expired.";
                    }
                    else
                    {
                        lblerror.Text = "";
                    }
                }
                else
                {
                    lblerror.Text = "";
                }
            }
            if (lblerror.Text == "")
            {
                //code for save
                //String details = "";
                try
                {




                    connection();


                    //QUERYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
                    String ss = "select * from booking where hid='" + Session["proid"].ToString() + "' and CONVERT(DATE, fromdate, 105)<='" + DateTime.Now.ToString("yyyy-MM-dd") + "' and CONVERT(DATE, todate, 105)>='" + DateTime.Now.ToString("yyyy-MM-dd") + "' and status='true'";



                    da = new SqlDataAdapter(ss, cn);
                    dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        Response.Write("<script>alert('Sorry!!!Hoarding Already Booked!!!!')</script>");
                    }
                    else
                    {
                        String str = "insert into payment values(" + Session["count"] + ",'" + Session["bookid"] + "','" + Session["finalamount"] + "','" + DateTime.Today.Date.ToShortDateString() + "','" + DdlMode.Text + "','" + txtn1.Text + txtn2.Text + txtn3.Text + txtn4.Text + "','" + Ddlmonth.Text + "','" + Ddlyear.Text + "','" + Session["LoginId"] + "')";

                        cmd = new SqlCommand(str, cn);
                        cmd.CommandType = CommandType.Text;
                        try
                        {
                            cn.Close();
                            cn.Open();
                        }
                        catch (Exception ex) { }
                        cmd.Connection = cn;
                        cmd.ExecuteNonQuery();

                        str = "update Booking set status='true' where bookid = '" + Session["bookid"] + "'";

                        cmd = new SqlCommand(str, cn);
                        cmd.CommandType = CommandType.Text;
                        try
                        {
                            cn.Close();
                            cn.Open();
                        }
                        catch (Exception ex) { }
                        cmd.Connection = cn;
                        cmd.ExecuteNonQuery();

                        Response.Redirect("PaymentSuccessful.aspx");
                    }
                }
                catch (Exception ex)
                { }
            }
        }
    }
    }