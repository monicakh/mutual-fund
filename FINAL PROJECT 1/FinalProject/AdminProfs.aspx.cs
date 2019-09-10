using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace FinalProject
{
    public partial class AdminProfs : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DbCon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            string name = " اهلا";
            Label2.Text = "! " + Session["username"].ToString() + name;
            try
            {
                if (!Page.IsPostBack)
                {
                    BindGridView();
                }
            }
            catch (Exception ex)
            {
                showMessage(ex.Message);
            }
        }
        void showMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + msg + "');</script>");

        }
        void Clear()
        {
            txtssn.Text = string.Empty;
            txtName.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtBirth.Text = string.Empty;
            txtName.Focus();
        }

        private void BindGridView()
        {
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Select ssn,name,tel,email,DateOfBirth from Profs";
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                GridViewProfs.DataSource = ds;
                GridViewProfs.DataBind();
                lbltotalcount.Text = GridViewProfs.Rows.Count.ToString();
            }
            catch (SqlException ex)
            {
                showMessage(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Insert into Profs(ssn,name,tel,email,DateOfBirth)values(@ssn,@name,@tel,@email,@DateOfBirth)";
                cmd.Parameters.AddWithValue("@ssn", txtssn.Text);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@tel", txtMobile.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@DateOfBirth", txtBirth.Text);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                showMessage("Register successfully....!");
                Clear();
                BindGridView();
            }
            catch (SqlException ex)
            {
                showMessage(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Clear();
        }
       
        protected void GridViewProfs_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewProfs.SelectedRow;
          
            txtssn.Text = row.Cells[2].Text;
            txtName.Text = row.Cells[3].Text;
            txtMobile.Text = row.Cells[4].Text;
            txtEmail.Text = row.Cells[5].Text;
            txtBirth.Text = row.Cells[6].Text;
            btnSubmit.Visible = false;
            btnUpdate.Visible = true;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "update Profs Set name=@name,tel=@tel,email=@email,DateOfBirth=@DateOfBirth where ssn=@ssn";

                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@tel", txtMobile.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@DateOfBirth", txtBirth.Text);
                cmd.Parameters.AddWithValue("@ssn", txtssn.Text);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                showMessage("Profs Data update Successfully......!");
                GridViewProfs.EditIndex = -1;
                Clear();
                BindGridView();
                btnUpdate.Visible = false;
                btnCancel.Visible = true;
                btnSubmit.Visible = true;
            }
            catch (SqlException ex)
            {
                showMessage(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        protected void txtName_TextChanged(object sender, EventArgs e)
        {

        }
        protected void GridViewProfs_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                int ssn = Convert.ToInt32(GridViewProfs.DataKeys[e.RowIndex].Value);
                cmd.CommandText = "Delete From Profs where ssn='" + ssn + "'";
                cmd.ExecuteNonQuery();

                showMessage("Profs Data Delete Successfully....!");
                GridViewProfs.EditIndex = -1;
                BindGridView();
                cmd.Dispose();
            }
            catch (SqlException ex)
            {
                showMessage(ex.Message);
            }
            finally
            {

                conn.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            

                Response.Redirect("Admin.aspx");

            
        }
    }
}