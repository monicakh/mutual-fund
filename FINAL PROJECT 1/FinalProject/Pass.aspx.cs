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
    public partial class Pass : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DbCon"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            string name = " اهلا";
            Label2.Text = "! " + Session["username"].ToString() + name;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand command1 = conn.CreateCommand();
            command1.CommandText = "select * from Users where username=@username and password=@password";
            command1.Parameters.Add("username", SqlDbType.VarChar, 50).Value = Session["username"].ToString();
            command1.Parameters.Add("password", SqlDbType.VarChar, 50).Value = TextBox1.Text.ToString();
            conn.Open();
            SqlDataReader dr3 = command1.ExecuteReader();
           
            
            SqlCommand command = conn.CreateCommand();
            command.CommandText = "update Users set password=@NewPassword where username = @username and password=@password";
            command.Parameters.Add("username", SqlDbType.VarChar, 50).Value = Session["username"].ToString();
            command.Parameters.Add("password", SqlDbType.VarChar, 50).Value = TextBox1.Text.ToString();
            command.Parameters.Add("NewPassword", SqlDbType.VarChar, 50).Value = TextBox2.Text.ToString();

            if (dr3.Read())
            {
                if (TextBox2.Text.ToString() == TextBox3.Text.ToString())
                {
                    command.ExecuteNonQuery();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Password changed')", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please enter correct Pass')", true);
            }
            conn.Close();

        }
    }
}