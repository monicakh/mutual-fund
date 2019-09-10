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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DbCon"].ConnectionString);
            DataTable dt = new DataTable();
            SqlCommand command = conn.CreateCommand();
            command.CommandText = "select * from Users where username=@username and password=@password";
            command.Parameters.Add("@username", SqlDbType.VarChar, 50).Value = TextBox1.Text.ToString();
            command.Parameters.Add("@password", SqlDbType.VarChar, 50).Value = TextBox2.Text.ToString();
            SqlDataAdapter sa = new SqlDataAdapter(command);
            sa.Fill(dt);

            SqlCommand command2 = conn.CreateCommand();
            command2.CommandText ="select profile from Profiles p,Users u where p.idProfile=u.idProfile and u.username=@username and u.password=@password ";
            command2.Parameters.Add("@username", SqlDbType.VarChar, 50).Value = TextBox1.Text.ToString();
            command2.Parameters.Add("@password", SqlDbType.VarChar, 50).Value = TextBox2.Text.ToString();
            conn.Open();
            SqlDataReader dr3 = command2.ExecuteReader();

            try
            {
                if (dt.Rows.Count > 0)
                {
                    
                    if (dr3.Read())
                    {
                        string profile = (string)dr3["profile"].ToString();
                        if(profile=="admin")
                        {
                            Session["username"] = TextBox1.Text;
                            Response.Redirect("Admin.aspx");
                        }
                        if(profile=="hospital secretary")
                        {
                            Session["username"] = TextBox1.Text;
                            Response.Redirect("Home.aspx");
                        }
                        if(profile=="lab secretary")
                        {
                            Session["username"] = TextBox1.Text;
                            Response.Redirect("Home.aspx");
                        }
                        if(profile== "committee")
                        {
                            Session["username"] = TextBox1.Text;
                            Response.Redirect("CommitteeHomePage.aspx");
                        }
                        if(profile== "committee secretary")
                        {
                            Session["username"] = TextBox1.Text;
                            Response.Redirect("CommitteeSecretaryHomePage.aspx");
                        }
                    }
                    conn.Close();
                }
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Login Failed')", true);
            }
            catch (SqlException sqlexception)
            {
                Response.Write("ERROR ::" + sqlexception.Message);
            }
            catch (Exception ex)
            {
                Response.Write("ERROR ::" + ex.Message);
            }
            finally
            {
                conn.Close();
            }
          
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}