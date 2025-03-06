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

namespace AdExcellence
{
    public partial class WebForm12 : System.Web.UI.Page
    {
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
            try
            {
                if (!Session["LoginId"].ToString().Equals(""))
                {
                    if (!(Page.IsPostBack == true))
                    {
                        connection();
                        try
                        {
                            da = new SqlDataAdapter("select Password from Login where Email='" + Session["LoginId"] + "'", cn);
                            dt = new DataTable();
                            da.Fill(dt);

                            if (dt.Rows.Count > 0)
                            {
                                Session["pwd"] = dt.Rows[0]["Password"].ToString();
                            }
                            else
                            {
                            }
                        }
                        catch (Exception ex)
                        {
                        }
                    }
                    else
                    {

                    }
                }

                else
                {
                    Response.Redirect("Error.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("Error.aspx");
            }

            try
            {
                if (!(Page.IsPostBack == true))
                {

                    try
                    {


                        connection();
                        String query = "select * from Login where Email='" + Session["LoginId"].ToString() + "' and type='howner'";
                        da = new SqlDataAdapter(query, cn);
                        dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            
                            lblsid.Text = dt.Rows[0]["id"].ToString();
                            txtname.Text = dt.Rows[0]["name"].ToString();
                            txtemail.Text = dt.Rows[0]["Email"].ToString();
                            lbladdress.Text = dt.Rows[0]["address"].ToString();
                            lblcity.Text = dt.Rows[0]["city"].ToString();
                            lblstate.Text = dt.Rows[0]["state"].ToString();
                            lblland.Text = dt.Rows[0]["landmark"].ToString();
                            lblMobile.Text = dt.Rows[0]["mobile"].ToString();

                            Image1.ImageUrl = "~/images/aadhar/" + lblsid.Text + ".jpg";

                        }





                    }


                    catch (Exception ex)
                    {
                        Response.Redirect("Error.aspx");
                    }


                }
            }
            catch { }

        }
        
        
      
    }
}