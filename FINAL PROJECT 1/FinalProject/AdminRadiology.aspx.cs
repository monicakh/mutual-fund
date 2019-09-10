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
    public partial class WebForm5 : System.Web.UI.Page
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
                cmd.CommandText = "Select idRadiology,nameRadiology,RadiologyReduction from Radiology;";
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                GridViewRad.DataSource = ds;
                GridViewRad.DataBind();
                lbltotalcount.Text = GridViewRad.Rows.Count.ToString();
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
                cmd.CommandText = "Insert into Radiology(nameRadiology,RadiologyReduction)values(@nameRadiology,@RadiologyReduction)";
                cmd.Parameters.AddWithValue("@nameRadiology", txtName.Text);
                cmd.Parameters.AddWithValue("@RadiologyReduction", txtRad.Text);
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
       
        protected void GridViewRad_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewRad.SelectedRow;
            lblidRad.Text = row.Cells[2].Text;
            txtName.Text = row.Cells[3].Text;
            txtRad.Text = row.Cells[4].Text;
            btnSubmit.Visible = false;
            btnUpdate.Visible = true;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "update Radiology Set nameRadiology=@nameRadiology,RadiologyReduction=@RadiologyReduction where idRadiology=@idRadiology";
                cmd.Parameters.AddWithValue("@nameRadiology", txtName.Text);
                cmd.Parameters.AddWithValue("@RadiologyReduction", txtRad.Text);
                cmd.Parameters.AddWithValue("@idRadiology", lblidRad.Text);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                showMessage("Radiology Data update Successfully......!");
                GridViewRad.EditIndex = -1;
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

        protected void GridViewRad_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                int idRadiology = Convert.ToInt32(GridViewRad.DataKeys[e.RowIndex].Value);
                cmd.CommandText = "Delete From Radiology where idRadiology='" + idRadiology + "'";
                cmd.ExecuteNonQuery();

                showMessage("Lab Data Delete Successfully....!");
                GridViewRad.EditIndex = -1;
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