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
using System.Drawing;
using System.IO;

using System.Data.Sql;
using System.Data.SqlClient;

namespace AdExcellence
{
    public partial class WebForm15 : System.Web.UI.Page
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
                fillLocation();
                clearAll();

                disable();

                btnNew.Enabled = true;
                btnSave.Enabled = false;
                btnCancel.Enabled = false;
                btnRemove.Enabled = false;

                getdata();
                if (dt.Rows.Count > 0)
                {
                    gridfill();
                }

                

            }
            else
            {
            }
        }

        protected void getdata()
        {
            da = new SqlDataAdapter("select * from Hoarding", cn);
            dt = new DataTable();
            da.Fill(dt);
        }
        public void fillLocation()
        {
            try
            {

                connection();
                da = new SqlDataAdapter("select distinct pincode from Location",cn);
                dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count > 0)
                {
                    DdlLocation.Items.Clear();
                    for (int i = 0;i < dt.Rows.Count; i++)
                    {
                        DdlLocation.Items.Add(dt.Rows[i][0].ToString());

                    }

                }

            }
            catch { }
        }

        private void autogenerate()
        {
            try
            {
                cn.Open();
                SqlCommand sq = new SqlCommand("select MAX(hid) from Hoarding", cn);
                SqlDataReader sd = sq.ExecuteReader();
                sd.Read();
                Session["count"] = sd[0];
                Session["count"] = (int)Session["count"] + 1;
            }
            catch { cn.Close(); cn.Open(); Session["count"] = "1"; }


            //int a = 0;
            //getdata();
            //Session["count"] = dt.Rows.Count;
            //if (a.Equals(Session["count"]))
            //{
            //    Session["count"] = 1;
            //}
            //else
            //{
            //    Session["count"] = (int)Session["count"] + 1;
            //}

            //da = null;
            //dt = null;
        }

        public void clearAll()
        {
            lblid.Text = "";
            txtcost.Text = "";
            DdlLocation.SelectedIndex = 0;
            txtsize.Text = "";
            txtsummary.Text = "";
            Image1.ImageUrl = "~/images/hoarding/NAvail.jpg";
        }
        public void disable()
        {
            txtsize.Enabled = false;
            txtcost.Enabled = false;
            DdlLocation.Enabled = false;
            txtsummary.Enabled = false;
            
            
        }
        public void enable()
        {
            txtsize.Enabled = true;
            txtcost.Enabled = true;
            DdlLocation.Enabled = true;
            txtsummary.Enabled = true;

            txtsummary.Enabled = true;
        }
        protected void display()
        {
            lblid.Text = dt.Rows[0]["hid"].ToString();
            txtcost.Text = dt.Rows[0]["cost"].ToString();
            DdlLocation.Text = dt.Rows[0]["location"].ToString();
            txtsummary.Text = dt.Rows[0]["description"].ToString();
            txtsize.Text = dt.Rows[0]["size"].ToString();
           

            //image
            string image;
            image = FileUpload1.FileName;
            Image1.ImageUrl = "~/images/hoarding/" + lblid.Text + ".jpg";
        }

        public void gridfill()
        {
            String sqlq = "select hid[Id],size[Size],location[Location],cost[Price] from Hoarding where emailid='"+ Session["LoginId"].ToString() +"' order by hid desc";
            da = new SqlDataAdapter(sqlq, cn);
            dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            i = GridView1.SelectedRow.Cells[1].Text;

            try
            {
                da = new SqlDataAdapter("select * from Hoarding where hid=" + i + " ", cn);
                dt = new DataTable();
                da.Fill(dt);
                display();
                btnNew.Enabled = false;
                
                btnSave.Enabled = false;
                btnRemove.Enabled = true;
                btnCancel.Enabled = true;
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnNew_Click1(object sender, EventArgs e)
        {
            enable();
            RequiredFieldValidator3.Enabled = true;
            Session["save_code"] = "true";
            autogenerate();
            lblid.Text = Session["count"].ToString();
            btnNew.Enabled = false;
            btnSave.Enabled = true;
            btnCancel.Enabled = true;

            btnRemove.Enabled = false;

        }

        protected void btnSave_Click1(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                String t = "true";
                //image


                if (t.Equals(Session["save_code"].ToString()))
                {
                    string image;
                    image = FileUpload1.FileName;
                    FileUpload1.SaveAs(Server.MapPath("~") + "/images/hoarding/" + lblid.Text + ".jpg");
                    if (FileUpload1.HasFile)
                    {
                        try
                        {
                            //a_pic.ImageUrl = FileUpload1.PostedFile.FileName
                            Image1.ImageUrl = "~/images/hoarding/" + lblid.Text + ".jpg";
                        }

                        catch (Exception ex) { }

                    }
                    //code for new record
                    cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    cn.Open();
                    cmd.Connection = cn;
                    cmd.CommandText = "insert into Hoarding values(" + Convert.ToInt32(Session["count"].ToString()) + ",'" + txtsize.Text + "','" + DdlLocation.Text + "','" + txtcost.Text + "','" + txtsummary.Text + "','" + Session["loginId"].ToString() + "')";
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Saved Successfully') </script>");
                    cmd = null;

                    clearAll();
                    disable();
                    gridfill();
                    btnNew.Enabled = true;

                    btnSave.Enabled = false;
                    btnRemove.Enabled = false;
                    btnCancel.Enabled = false;
                }
                else
                {

                }
            }

        }

        protected void btnRemove_Click1(object sender, EventArgs e)
        {
            if (lblid.Text != "")
            {
                cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cn.Open();
                cmd.Connection = cn;
                cmd.CommandText = "Delete from Hoarding where hid='" + lblid.Text + "' ";
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Removed Successfully') </script>");
                cmd = null;

                clearAll();
                disable();
                gridfill();
                btnNew.Enabled = true;

                btnSave.Enabled = false;
                btnRemove.Enabled = false;
                btnCancel.Enabled = false;
            }

        }

        protected void btnCancel_Click1(object sender, EventArgs e)
        {
            disable();
            clearAll();
            Session["save_code"] = "";
            btnNew.Enabled = true;
            btnSave.Enabled = false;
            btnCancel.Enabled = false;
            btnRemove.Enabled = false;
        }
    }

}