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
    public partial class prNB : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DbCon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            string name = " اهلا";
            Label2.Text = "! " + Session["username"].ToString() + name;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["prnb"] = TextBox1.Text;
            String newText = TextBox1.Text;
            if (newText == "" || newText==null || newText==" ")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' ادخل الرقم الباركودر ')", true);
            }
            SqlCommand cmd4 = conn.CreateCommand();
            cmd4.CommandText = "select * from Prescription  where prNB=@prNB";
            cmd4.Parameters.AddWithValue("prNB", Session["prnb"]);
            conn.Open();
            cmd4.ExecuteNonQuery();
            SqlDataReader dr4 = cmd4.ExecuteReader();
            try
            {
                if (dr4.Read())
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' رقم موجود ')", true);
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("insert into Prescription(prNB) values (@prNB) ", conn);


                    cmd.Parameters.Add("prNB", SqlDbType.NVarChar, 50).Value = TextBox1.Text;

                    
                    cmd.ExecuteNonQuery();
                    
                    Response.Redirect("PrescForm.aspx");
                }
               
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
