using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class CommitteeSecretaryHomePage : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DbCon"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            string name = " اهلا";
            Label2.Text = "! " + Session["username"].ToString() + name;

            function();

   
        }

        void function()
        {
            ImageButton1.ImageUrl = "~/img/bellWhite2.png";
            int c = 0;
            SqlCommand command3 = conn.CreateCommand();
            command3.CommandText = "select * from Prescription where ComSecNotification=0 and LabNotification=0 and ComNotification=0";
            conn.Open();
            command3.ExecuteNonQuery();

            SqlDataReader dr3 = command3.ExecuteReader();
            try
            {
                while (dr3.Read())
                {
                    ImageButton1.ImageUrl = "~/img/bellYellow2.png";
                    c++;
                    counter.Text = c.ToString();
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
            string session = Session["username"].ToString();
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("CommitteeSecretaryNotification.aspx");
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            function();
        }
    }
}