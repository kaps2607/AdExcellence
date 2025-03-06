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

using System.Net;
using System.Net.Mail;

using System.Data.Sql;
using System.Data.SqlClient;

namespace AdExcellence
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        int count = 0;
        String i;

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
                clearAll();
                getdata();
                autogenerate();
                lblid.Text = Session["count"].ToString();

            }
            else
            {
            }

        }

        protected void getdata()
        {
            da = new SqlDataAdapter("select * from Login", cn);
            dt = new DataTable();
            da.Fill(dt);
        }

        private void autogenerate()
        {
            int a = 0;
            getdata();
            Session["count"] = dt.Rows.Count;
            if (a.Equals(Session["count"]))
            {
                Session["count"] = 1;
            }
            else
            {
                Session["count"] = (int)Session["count"] + 1;
            }

            da = null;
            dt = null;
        }

        public void clearAll()
        {

            txtname.Text = "";
            txtemail.Text = "";
            txtadd.Text = "";
            txtcity.Text = "";
            txtState.Text = "";
            txtLandmark.Text = "";
            txtMobile.Text = "";



        }


        protected void btnSave_Click1(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                String t = "true";
                //image

                //code for new record
                checkit();
                //send mail code
                clearAll();
            }

        }
        public void checkit()
        {
            string image;
            image = FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath("~") + "/images/aadhar/" + lblid.Text + ".jpg");
            if (FileUpload1.HasFile)
            {
                try
                {
                    //a_pic.ImageUrl = FileUpload1.PostedFile.FileName
                    Image1.ImageUrl = "~/images/aadhar/" + lblid.Text + ".jpg";
                }

                catch (Exception ex) { }

            }


            da = new SqlDataAdapter("select * from Login where Email='" + txtemail.Text + "'", cn);
            dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count == 0)
            {
                cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cn.Open();
                cmd.Connection = cn;

                cmd.CommandText = "insert into Login values('" + lblid.Text + "','" + txtname.Text + "','" + txtemail.Text + "','" + txtMobile.Text + "','" + txtadd.Text + "','" + txtcity.Text + "','" + txtState.Text + "','" + txtLandmark.Text + "','" + txtMobile.Text + "','howner','no')";
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Verification Under Process') </script>");
                cmd = null;
                getdata();
                autogenerate();
                lblid.Text = Session["count"].ToString();
            }
            else
            {
                Response.Write("<script>alert('Email-Id Already Present') </script>");
                cmd = null;
            }

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clearAll();
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
                client.Port = 587;
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

        protected void txtadd_TextChanged(object sender, EventArgs e)
        {

        }
    }
}