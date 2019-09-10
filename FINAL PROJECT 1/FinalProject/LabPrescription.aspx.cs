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
    public partial class LabPrescription : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DbCon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session
            string name = " اهلا";
            Label40.Text = "! " + Session["username"].ToString() + name;

            TextBox44.Focus();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('حصلت على الموافقة')", true);
            //idLab
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select idLab from Prescription p,Users u where p.idUser=u.idUser and idPresc=@idPresc";
            cmd.Parameters.AddWithValue("idPresc", Session["idPresc"]);
            conn.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader dr = cmd.ExecuteReader();
            try
            {
                if (dr.Read())
                {
                    string id = dr["idLab"].ToString();
                    TextBox2.Text = id;
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

            //Doctor: name, speciality, tel
            SqlCommand cmd4 = conn.CreateCommand();
            cmd4.CommandText = "select * from Prescription p,Doctors d where p.idDoc=d.idDoc and idPresc=@idPresc";
            cmd4.Parameters.AddWithValue("idPresc", Session["idPresc"]);
            conn.Open();
            cmd4.ExecuteNonQuery();
            SqlDataReader dr4 = cmd4.ExecuteReader();
            try
            {
                if (dr4.Read())
                {

                    TextBox8.Text = dr4["name"].ToString();
                    TextBox9.Text = dr4["speciality"].ToString();
                    string tel = dr4["tel"].ToString();
                    TextBox10.Text = tel;
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
            //PrNB, ssn, PrIssuedDate, PrFilledDate
            //Profs: name,tel,DateOfBirth
            SqlCommand command3 = conn.CreateCommand();
            command3.CommandText = "select * from Prescription where idPresc=@idPresc";
            command3.Parameters.AddWithValue("idPresc", Session["idPresc"]);
            conn.Open();
            command3.ExecuteNonQuery();

            SqlDataReader dr3 = command3.ExecuteReader();
            try
            {
                if (dr3.Read())
                {

                    TextBox44.Text = dr3["receiptNB"].ToString();
                    TextBox1.Text = dr3["prNB"].ToString();
                    String ssn1 = dr3["ssn"].ToString();
                    TextBox3.Text = ssn1;

                    String PrIssuedDate = dr3["PrIssuedDate"].ToString();
                    datepicker.Text = PrIssuedDate;


                    String PrFilledDate = dr3["PrFilledDate"].ToString();
                    TextBox7.Text = PrFilledDate;



                    //name
                    SqlCommand cmd2 = conn.CreateCommand();
                    cmd2.CommandText = "select * from Profs where ssn=@ssn";
                    cmd2.Parameters.AddWithValue("ssn", ssn1);
                    cmd2.ExecuteNonQuery();
                    SqlDataReader dr2 = cmd2.ExecuteReader();
                    if (dr2.Read())
                    {
                        TextBox4.Text = dr2["name"].ToString();
                        TextBox5.Text = dr2["DateOfBirth"].ToString();
                        TextBox6.Text = dr2["tel"].ToString();
                    }



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



        protected void Button3_Click1(object sender, EventArgs e)
        {



            SqlCommand command2 = conn.CreateCommand();
            command2.CommandText = "update Prescription set  LabNotification=@LabNotification where prNB=@prNB";
            command2.Parameters.Add("prNB", SqlDbType.NVarChar, 50).Value = TextBox1.Text;
            command2.Parameters.Add("LabNotification", SqlDbType.Bit).Value = 1;
            conn.Open();
            command2.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("HomeNotification.aspx");



        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlCommand command2 = conn.CreateCommand();
            command2.CommandText = "update Prescription set  LabNotification=@LabNotification where prNB=@prNB";
            command2.Parameters.Add("prNB", SqlDbType.NVarChar, 50).Value = TextBox1.Text;
            command2.Parameters.Add("LabNotification", SqlDbType.Bit).Value = 0;
            conn.Open();
            command2.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("HomeNotification.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}