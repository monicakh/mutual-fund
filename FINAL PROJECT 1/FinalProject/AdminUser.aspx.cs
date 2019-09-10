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
    public partial class AdminUser : System.Web.UI.Page
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
            txtUser.Text = string.Empty;
            txtName.Text = string.Empty;
            txtPass.Text = string.Empty;
            TxtLab.Text = string.Empty;
            TxtProfile.Text = string.Empty;
            
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
                cmd.CommandText = "Select idUser,username,password,name,idLab,idPRofile from Users;";
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                GridViewUsers.DataSource = ds;
                GridViewUsers.DataBind();
                lbltotalcount.Text = GridViewUsers.Rows.Count.ToString();
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
                cmd.CommandText = "Insert into Users(username,password,name,idLab,idProfile)values(@username,@name,@password,@idLab,@idPRofile)";
                cmd.Parameters.AddWithValue("@username", txtUser.Text);
                cmd.Parameters.AddWithValue("@password", txtPass.Text);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@idLab", TxtLab.Text);
                cmd.Parameters.AddWithValue("@idProfile", TxtProfile.Text);

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

        protected void GridViewUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewUsers.SelectedRow;
            lblidUser.Text = row.Cells[2].Text;
            txtUser.Text = row.Cells[3].Text;
            txtPass.Text = row.Cells[4].Text;
            txtName.Text = row.Cells[5].Text;
            TxtLab.Text = row.Cells[6].Text;
            TxtProfile.Text = row.Cells[7].Text;
            btnSubmit.Visible = false;
            btnUpdate.Visible = true;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Clear();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "update Users Set username=@username,password=@password,name=@name,idLab=@idLab,idProfile=@idPRofile where idUser=@idUser";
                cmd.Parameters.AddWithValue("@username", txtUser.Text);
                cmd.Parameters.AddWithValue("@password", txtPass.Text);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@idLab", TxtLab.Text);
                cmd.Parameters.AddWithValue("@idProfile", TxtProfile.Text);
                cmd.Parameters.AddWithValue("idUser", lblidUser.Text);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                showMessage("Test Data update Successfully......!");
                GridViewUsers.EditIndex = -1;
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

        protected void GridViewUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                int idUser = Convert.ToInt32(GridViewUsers.DataKeys[e.RowIndex].Value);
                cmd.CommandText = "Delete From Users where idUser='" + idUser + "'";
                cmd.ExecuteNonQuery();

                showMessage("Lab Data Delete Successfully....!");
                GridViewUsers.EditIndex = -1;
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