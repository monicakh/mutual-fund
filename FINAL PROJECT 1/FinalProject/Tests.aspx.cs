using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Tests : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DbCon"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGridView();

            }
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
                cmd.CommandText = "Select idTest,nameTest from Tests;";
                SqlDataAdapter adp = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                adp.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                lbltotalcount.Text = GridView1.Rows.Count.ToString();
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                if ((row.FindControl("CheckBox1") as CheckBox).Checked)
                {
                    SqlCommand cmd = new SqlCommand("insert into PrescTest (Test,idPresc) values (@Test,(select idPresc from Prescription where prNB=@prNB ))", conn);
                    cmd.Parameters.Add("Test", SqlDbType.NVarChar, 50).Value = row.Cells[1].Text;
                    cmd.Parameters.Add("prNB", SqlDbType.NVarChar, 50).Value = Session["prnb"].ToString();
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            string NewTest = TextBox1.Text.ToString();
            if (NewTest != null)
            {
                if (NewTest == "")
                { }
                else
                {
                    SqlCommand cmd = new SqlCommand("insert into PrescTest (Test,idPresc) values (@Test,(select idPresc from Prescription where prNB=@prNB ))", conn);
                    cmd.Parameters.Add("Test", SqlDbType.NVarChar, 50).Value = NewTest;
                    cmd.Parameters.Add("prNB", SqlDbType.NVarChar, 50).Value = Session["prnb"].ToString();
                    //cmd.Parameters.Add("Desc", SqlDbType.Text).Value = TextArea1;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Console.WriteLine("Inserted Successfully");
                }

            }
            Response.Redirect("PrescForm.aspx");
        }
    }
}