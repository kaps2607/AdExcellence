using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Drawing;
using System.IO;

using System.Data.Sql;
using System.Data.SqlClient;

namespace AdExcellence
{
    public partial class WebForm8 : System.Web.UI.Page
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

                disable();

                btnNew.Enabled = true;
                btnSave.Enabled = false;
                btnCancel.Enabled = false;
                btnModify.Enabled = false;
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
            da = new SqlDataAdapter("select * from Location", cn);
            dt = new DataTable();
            da.Fill(dt);
        }

        private void autogenerate()
        {
            try
            {
                int a = 0;
                da = new SqlDataAdapter("select max(Id) from Location", cn);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    String tp=dt.Rows[0][0].ToString();
                    Session["count"] = (Convert.ToInt32(tp) + 1)+"";
                }


                da = null;
                dt = null;
            }
            catch {
                Session["count"] = 1 ;
            }
            
        
        
        }

        public void clearAll()
        {
            lblid.Text = "";
            txtname.Text = "";
            txtpincode.Text = "";


            

        }
        public void disable()
        {
            txtname.Enabled = false;
            txtpincode.Enabled = false;
            

        }
        public void enable()
        {
            txtname.Enabled = true;
            txtpincode.Enabled = true;

        }
        protected void display()
        {
            lblid.Text = dt.Rows[0]["Id"].ToString();
            txtname.Text = dt.Rows[0]["name"].ToString();
            txtpincode.Text = dt.Rows[0]["pincode"].ToString();

        }



        public void gridfill()
        {
            String sqlq = "select * from Location";
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
                da = new SqlDataAdapter("select * from Location where Id=" + i + " ", cn);
                dt = new DataTable();
                da.Fill(dt);
                display();
                btnNew.Enabled = false;
                btnModify.Enabled = true;
                btnSave.Enabled = false;
                btnRemove.Enabled = true;
                btnCancel.Enabled = true;
            }
            catch (Exception ex)
            {

            }
        }

        public static Boolean IsNumeric(string stringToTest)
        {
            int result;
            return int.TryParse(stringToTest, out result);
        }

        protected void btnNew_Click1(object sender, EventArgs e)
        {
            enable();
            Session["save_code"] = "true";
            autogenerate();
            lblid.Text = Session["count"].ToString();
            btnNew.Enabled = false;
            btnSave.Enabled = true;
            btnCancel.Enabled = true;
            btnModify.Enabled = false;
            btnRemove.Enabled = false;

        }

        protected void btnModify_Click1(object sender, EventArgs e)
        {
            enable();
            Session["save_code"] = "false";

            btnNew.Enabled = false;
            btnSave.Enabled = true;
            btnCancel.Enabled = true;
            btnModify.Enabled = false;
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

                    //code for new record
                    cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    cn.Open();
                    cmd.Connection = cn;
                    cmd.CommandText = "insert into Location values(" + Convert.ToInt32(Session["count"].ToString()) + ",'" + txtname.Text + "','" + txtpincode.Text + "')";
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Saved Successfully') </script>");
                    cmd = null;

                    clearAll();
                    disable();
                    gridfill();
                    btnNew.Enabled = true;
                    btnModify.Enabled = false;
                    btnSave.Enabled = false;
                    btnRemove.Enabled = false;
                    btnCancel.Enabled = false;
                }
                else
                {

                    //code for modify i.e. update.
                    cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    cn.Open();
                    cmd.Connection = cn;
                    cmd.CommandText = "update Location set name='" + txtname.Text + "',pincode='" + txtpincode.Text + "' where Id='" + lblid.Text + "' ";
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Updated Successfully') </script>");
                    cmd = null;

                    clearAll();
                    disable();
                    gridfill();
                    btnNew.Enabled = true;
                    btnModify.Enabled = false;
                    btnSave.Enabled = false;
                    btnRemove.Enabled = false;
                    btnCancel.Enabled = false;

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
                cmd.CommandText = "Delete from Location where Id='" + lblid.Text + "' ";
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Removed Successfully') </script>");
                cmd = null;

                clearAll();
                disable();
                gridfill();
                btnNew.Enabled = true;
                btnModify.Enabled = false;
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
            btnModify.Enabled = false;
            btnRemove.Enabled = false;
        }
    }
}