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
    public partial class WebForm4 : System.Web.UI.Page
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
            txtName.Text = string.Empty;
            txtPhonenb.Text = string.Empty;
            Speciality.Text = string.Empty;
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
                cmd.CommandText = "Select idDoc,name,tel,speciality from Doctors;";
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                GridViewDoctor.DataSource = ds;
                GridViewDoctor.DataBind();
                lbltotalcount.Text = GridViewDoctor.Rows.Count.ToString();
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
         
        protected void btnSubmit_Click(object sender,EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Insert into Doctors(name,tel,speciality)values(@name,@tel,@speciality)";
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@tel", txtPhonenb.Text);
                cmd.Parameters.AddWithValue("@speciality", Speciality.Text);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                showMessage("Register successfully....!");
                Clear();
                BindGridView();
            }
            catch(SqlException ex)
            {
                showMessage(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        protected void GridViewDoctor_SelectedIndexChanged(object sender,EventArgs e)
        {
            GridViewRow row = GridViewDoctor.SelectedRow;
            lblidDoc.Text = row.Cells[2].Text;
            txtName.Text = row.Cells[3].Text;
            txtPhonenb.Text = row.Cells[4].Text;
            Speciality.Text = row.Cells[5].Text;
            btnSubmit.Visible = false;
            btnUpdate.Visible = true;
        }
        protected void btnUpdate_Click(object sender,EventArgs e)
        {
            try
            {
                conn.Open();
                string idDoc = lblidDoc.Text;
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "update Doctors Set name=@name,tel=@tel,speciality=@Speciality where idDoc=@idDoc";
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@tel", txtPhonenb.Text);
                cmd.Parameters.AddWithValue("@Speciality", Speciality.Text);
                cmd.Parameters.AddWithValue("@idDoc", idDoc);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                showMessage("Doctors Data update Successfully....!");
                GridViewDoctor.EditIndex = -1;
                Clear();
                BindGridView();
                btnUpdate.Visible = false;
                btnCancel.Visible = true;
                btnSubmit.Visible = true;
            }
            catch(SqlException ex)
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
        protected void txtName_TextChanged(object sender, EventArgs e)
        {

        }
        protected void GridViewDoctor_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                int idDoc = Convert.ToInt32(GridViewDoctor.DataKeys[e.RowIndex].Value);
                cmd.CommandText = "Delete From Doctors where idDoc='" + idDoc + "'";
                cmd.ExecuteNonQuery();

                showMessage("Doctor Data Delete Successfully....!");
                GridViewDoctor.EditIndex = -1;
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
        

  
