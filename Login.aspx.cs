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
using System.Runtime.Remoting.Messaging;

namespace AdExcellence
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();

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
                Response.Write("<script>alert('Error in connection')<'/'script>");
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            connection();
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            da = new SqlDataAdapter("select Email,Password,type from Login where Email='" + txtemail.Text + "' and Password='" + txtpassword.Text + "' and status='yes'", cn);
            dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count == 0)
            {
                //if Id & Password is not found in database
                txtpassword.Text = "";
                Response.Write("<script>alert('Either Username or password does not match/User Verification is not completed')</script>");
                txtpassword.Focus();
            }
            else
            {
                String save = "";
                save = dt.Rows[0]["Password"].ToString();
                if (save == txtpassword.Text)
                {
                    //Show other page

                    Session["LoginId"] = txtemail.Text;

                    String url = "";

                    String type = dt.Rows[0]["type"].ToString();

                    if (type.ToLower().Equals("admin"))
                        url = "VerifyAccount.aspx";
                    else if (type.ToLower().Equals("howner"))
                        url = "HProfile.aspx";
                    else
                        url = "UserProfile.aspx";

                    Response.Redirect(url);

                }
                else
                {
                    //error code
                    Response.Write("<script>alert('Either Username or password does not match/User Verification is not completed')</script>");
                    txtpassword.Text = "";
                    txtpassword.Focus();
                }
            }
        }
    }
}