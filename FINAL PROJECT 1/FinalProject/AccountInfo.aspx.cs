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
    public partial class AccountInfo : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DbCon"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            string name = " اهلا";
            Label2.Text = "! " + Session["username"].ToString() + name;

            //Profile
            SqlCommand command = conn.CreateCommand();
            command.CommandText =" select profile from Users u, Profiles p where u.idProfile = p.idProfile and username = @username";
            command.Parameters.Add("@username", SqlDbType.VarChar, 50).Value = Session["username"].ToString();
            conn.Open();
            command.ExecuteNonQuery();
            
            SqlDataReader dr = command.ExecuteReader();
            try
            {
                if (dr.Read())
                {
                    string profile = (string)dr["profile"].ToString();
                    Label7.Text = profile;
                }
                conn.Close();
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

            //User
            SqlCommand command2 = conn.CreateCommand();
            command2.CommandText = " select username from Users where username = @username1";
            command2.Parameters.Add("@username1", SqlDbType.VarChar, 50).Value = Session["username"].ToString();
            conn.Open();
            command2.ExecuteNonQuery();

            SqlDataReader dr2 = command2.ExecuteReader();
            try
            {
                if (dr2.Read())
                {
                    string user = (string)dr2["username"].ToString();
                    Label8.Text = user;
                }
                conn.Close();
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

            //Source
            SqlCommand command3 = conn.CreateCommand();
            command3.CommandText = "select LabName from Users u, Labs l where u.idLab = l.idLab and username = @username3";
            command3.Parameters.Add("@username3", SqlDbType.VarChar, 50).Value = Session["username"].ToString();
            conn.Open();
            command3.ExecuteNonQuery();

            SqlDataReader dr3 = command3.ExecuteReader();
            try
            {
                if (dr3.Read())
                {
                    string source = (string)dr3["LabName"].ToString();
                    Label9.Text = source;
                }
                conn.Close();
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
    }
}