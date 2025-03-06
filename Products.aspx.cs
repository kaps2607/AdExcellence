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
using System.IO;
using System.Data.SqlClient;

namespace AdExcellence
{
    public partial class WebForm18 : System.Web.UI.Page
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        String str = "";
        int count = 0;

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
                //check profile
                chkprofile();

                fillLocation();
                forallBrands();



            }
        }
        public void chkprofile()
        {
            try
            {
                da = new SqlDataAdapter("select * from Login where Email='" + Session["LoginId"].ToString() + "'", cn);
                dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                }
                else
                {
                    Response.Redirect("UserProfile.aspx");
                }
            }
            catch (Exception ex) { }
        }
        public void fillLocation()
        {
            try
            {
                da = new SqlDataAdapter("select * from Location", cn);
                dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    ddlLocation.Items.Clear();
                    ddlLocation.Items.Add("All");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        ddlLocation.Items.Add(dt.Rows[i][2].ToString());
                    }
                }
                else
                {

                }
            }
            catch (Exception ex) { }
        }
        protected void forallBrands()
        {
            try
            {
                da = new SqlDataAdapter("select * from Hoarding", cn);
                dt = new DataTable();
                da.Fill(dt);

                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    if (count >= 4)
                    {
                        count = 0;
                    }

                    count += 1;

                    str = str + "<a href='HoardingSummary.aspx?pname=" + dt.Rows[i]["hid"].ToString() + " ' class='inline-flex flex-col w-72 bg-white shadow-md rounded-xl duration-500 hover:scale-105 hover:shadow-xl'><img src='" + "images/hoarding/" + dt.Rows[i]["hid"].ToString() + ".jpg" + "' class='h-80 w-72 object-cover rounded-t-xl'/><div class='px-4 py-3 w-72'><p class='text-lg font-bold text-black truncate block capitalize'> " + dt.Rows[i]["description"].ToString() + "</p><div class='flex items-center'><p class='text-lg font-semibold text-black cursor-auto my-3'> Rs." + dt.Rows[i]["cost"].ToString() + "/month</p> <del> <p class='text-sm text-gray-600 cursor-auto ml-2'></p> </del> <div class='ml-auto'> </div> </div> </div> </a>";
                }
            }
            catch (Exception ex)
            { }
            lbldisply.Text = str;
        }

        protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlLocation.Text != "All")
            {
                try
                {
                    da = new SqlDataAdapter("select * from Hoarding where location='" + ddlLocation.Text + "'", cn);
                    dt = new DataTable();
                    da.Fill(dt);

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {

                        if (count >= 4)
                        {
                            count = 0;
                        }

                        count += 1;

                    str = str + "<a href='HoardingSummary.aspx?pname=" + dt.Rows[i]["hid"].ToString() + " ' class='inline-flex flex-col w-72 bg-white shadow-md rounded-xl duration-500 hover:scale-105 hover:shadow-xl'><img src='" + "images/hoarding/" + dt.Rows[i]["hid"].ToString() + ".jpg" + "' class='h-80 w-72 object-cover rounded-t-xl'/><div class='px-4 py-3 w-72'><p class='text-lg font-bold text-black truncate block capitalize'> " + dt.Rows[i]["description"].ToString() + "</p><div class='flex items-center'><p class='text-lg font-semibold text-black cursor-auto my-3'> Rs." + dt.Rows[i]["cost"].ToString() + "/month</p> <del> <p class='text-sm text-gray-600 cursor-auto ml-2'></p> </del> <div class='ml-auto'> </div> </div> </div> </a>";
                    }
                }
                catch (Exception ex)
                { }
                lbldisply.Text = str;
            }

            if (ddlLocation.Text == "All")
            {
                forallBrands();
            }


        }
    }

}