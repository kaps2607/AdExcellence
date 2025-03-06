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

using System.Data.Sql;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace AdExcellence
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        String sq, sa, email;
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
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
                Response.Write("<script>alert(" + ex.ToString() + ")</script>");

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Page.IsPostBack == true))
            {
                connection();
            }
        }
        protected void btnSendMail_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            if (Page.IsValid == true)
            {
                try
                {

                    email = txtEmailID.Text;




                    da = new SqlDataAdapter("select * from Login where Email='" + txtEmailID.Text + "' and status='yes'", cn);
                    dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        Session["Email"] = dt.Rows[0]["Email"].ToString();
                        Session["epwd"] = dt.Rows[0]["password"].ToString();
                        if (txtEmailID.Text.Equals(Session["Email"].ToString()))
                        {

                            String pwd = "Your Password: " + Session["epwd"].ToString();


                            //Send password
                            lblpass.Text = pwd;




                        }
                        else
                            Response.Write("<script>alert('Email-Id Not Found')</script>");

                    }
                }
                catch (Exception xe)
                { }

            }


        }
        public void verification_code(String sender, String pass, String tos, String subject, String message)
        {
            try
            {
                NetworkCredential loginInfo = new NetworkCredential();
                loginInfo = new NetworkCredential(sender, pass);
                MailMessage msg = new MailMessage();
                msg = new MailMessage();
                msg.From = new MailAddress(sender);
                msg.To.Add(new MailAddress(tos));
                msg.Subject = subject;
                msg.Body = message;
                msg.IsBodyHtml = true;
                SmtpClient client = new SmtpClient();
                client = new SmtpClient("smtp.gmail.com");
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = loginInfo;
                client.Send(msg);

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Email Not Sent !!!')</script>");
            }
        }


    }
}