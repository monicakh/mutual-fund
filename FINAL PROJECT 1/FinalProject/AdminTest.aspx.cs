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
    public partial class AdminTest : System.Web.UI.Page
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
            txtTest.Text = string.Empty;
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
                cmd.CommandText = "Select idTest,nameTest,TestReduction from Tests;";
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                GridViewTest.DataSource = ds;
                GridViewTest.DataBind();
                lbltotalcount.Text = GridViewTest.Rows.Count.ToString();
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
                cmd.CommandText = "Insert into Tests(nameTest,TestReduction)values(@nameTest,@TestReduction)";
                cmd.Parameters.AddWithValue("@nameTest", txtName.Text);
                cmd.Parameters.AddWithValue("@TestReduction", txtTest.Text);
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

        protected void GridViewTest_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewTest.SelectedRow;
            lblidTest.Text = row.Cells[2].Text;
            txtName.Text = row.Cells[3].Text;
            txtTest.Text = row.Cells[4].Text;
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
                cmd.CommandText = "update Tests Set nameTest=@nameTest,TestReduction=@TestReduction where idTest=@idTest";
                cmd.Parameters.AddWithValue("@nameTest", txtName.Text);
                cmd.Parameters.AddWithValue("@TestReduction", txtTest.Text);
                cmd.Parameters.AddWithValue("@idTest", lblidTest.Text);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                showMessage("Test Data update Successfully......!");
                GridViewTest.EditIndex = -1;
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

        protected void GridViewTest_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                int idTest = Convert.ToInt32(GridViewTest.DataKeys[e.RowIndex].Value);
                cmd.CommandText = "Delete From Tests where idTest='" + idTest + "'";
                cmd.ExecuteNonQuery();

                showMessage("Lab Data Delete Successfully....!");
                GridViewTest.EditIndex = -1;
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