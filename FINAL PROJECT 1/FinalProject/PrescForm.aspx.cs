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
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DbCon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
            CheckBox1.Checked = true;
            TextBox3.Focus();

            if (Session["receiptNB"] != null)
                TextBox44.Text = Session["receiptNB"].ToString();

            if (Session["patient-ssn"] != null)
                TextBox3.Text = Session["patient-ssn"].ToString();

            if (Session["patient-fullname"] != null)
                TextBox4.Text = Session["patient-fullname"].ToString();

            if (Session["patient-dateofbirth"] != null)
                TextBox5.Text = Session["patient-dateofbirth"].ToString();

            if (Session["doctor-fullname"] != null)
                TextBox8.Text = Session["doctor-fullname"].ToString();

            if (Session["doctor-speciality"] != null)
                TextBox9.Text = Session["doctor-speciality"].ToString();

            if (Session["doctor-phonenb"] != null)
                TextBox10.Text = Session["doctor-phonenb"].ToString();

            if (Session["DatePicker"] != null)
                datepicker.Text = Session["DatePicker"].ToString();

            if (Session["idDoc"] != null)
                idDoc.Text = Session["idDoc"].ToString();

            //
            string today = DateTime.Now.ToString();
            TextBox7.Text = today;

            string name = " اهلا";
            Label40.Text = "! " + Session["username"].ToString() + name;

            string prNBB = Session["prnb"].ToString();
            TextBox1.Text = prNBB;

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
                    TextBox2.Text = source;
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
            string prNB = Session["prnb"].ToString();
            /*    //TextArea
                SqlCommand command = conn.CreateCommand();
                command.CommandText = ("select Test from PrescTest pt,Prescription p where pt.idPresc=p.idPresc and p.prNB=" + prNB);
                conn.Open();
            string Tests = "";
            SqlDataReader dr2 = command.ExecuteReader();
                try
                {
                    if (dr2.HasRows)
                    {
                        
                        while (dr2.Read())
                        {
                            // get the results of column "Test" 
                            Tests += dr2["Test"].ToString() + System.Environment.NewLine;
                        }
                        TextBox15.Text += Tests.Trim();
                        conn.Close();
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

            SqlCommand command2 = conn.CreateCommand();
            command2.CommandText = ("select Radio from PrescRadio pr, Prescription p where pr.idPresc=p.idPresc and p.prNB=" + prNB);
            conn.Open();

            SqlDataReader dr4 = command2.ExecuteReader();
            try
            {
                if (dr4.HasRows)
                {
                    while (dr4.Read())
                    {
                        // get the results of column "Radio"
                        Tests += dr4["Radio"].ToString() + System.Environment.NewLine;
                    }
                    TextBox15.Text += Tests.Trim();
                    conn.Close();
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
            */


        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            Fill();

        }

        void Fill()
        {
            //For ssn
            SqlCommand command = conn.CreateCommand();
            command.CommandText = "select name from Profs where ssn=@ssn";
            command.Parameters.Add("@ssn", SqlDbType.Int).Value = TextBox3.Text.ToString();
            conn.Open();
            command.ExecuteNonQuery();
            SqlDataReader dr = command.ExecuteReader();

            if (dr.Read())
            {
                string name = (string)dr["name"].ToString();
                TextBox4.Text = name;
            }
            conn.Close();

            //For Name and Age
            SqlCommand command2 = conn.CreateCommand();
            command2.CommandText = "select DateOfBirth from Profs where ssn=@ssn";
            command2.Parameters.Add("@ssn", SqlDbType.Int).Value = TextBox3.Text.ToString();
            conn.Open();
            command2.ExecuteNonQuery();
            SqlDataReader dr2 = command2.ExecuteReader();

            if (dr2.Read())
            {
                string DateOfBirth = (string)dr2["DateOfBirth"].ToString();
                TextBox5.Text = DateOfBirth;
                conn.Close();
            }
        }
        protected void TextBox8_TextChanged(object sender, EventArgs e)
        {
            Fill2();
            if (TextBox8.Text == "")
                Fill2();
        }

        void Fill2()
        {
            //For speciality,tel,idDoc
            SqlCommand command2 = conn.CreateCommand();
            command2.CommandText = "select * from Doctors where name=@name";
            command2.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = TextBox8.Text;
            conn.Open();
            command2.ExecuteNonQuery();
            SqlDataReader dr2 = command2.ExecuteReader();


            if (dr2.Read())
            {
                string speciality = (string)dr2["speciality"].ToString();
                TextBox9.Text = speciality;
                string tel = dr2["tel"].ToString();
                TextBox10.Text = tel;
                string id = dr2["idDoc"].ToString();
                idDoc.Text = id;
                conn.Close();
            }
            else
            {
                //If doc not found then the user insert a new one
                SqlCommand command = conn.CreateCommand();
                command.CommandText = "insert into Doctors(name) values (@name)";
                command.Parameters.AddWithValue("name", TextBox8.Text);
                command.ExecuteNonQuery();

                //Getting idDoc in the invisible textBox
                SqlCommand cmd2 = conn.CreateCommand();
                cmd2.CommandText = "select * from Doctors where name=@name";
                cmd2.Parameters.Add("@name", SqlDbType.VarChar, 50).Value = TextBox8.Text;
                cmd2.ExecuteNonQuery();
                SqlDataReader dr3 = cmd2.ExecuteReader();

                if (dr3.Read())
                {
                    string idDoc2 = dr3["idDoc"].ToString();
                    idDoc.Text = idDoc2;
                }
                TextBox9.Focus();
                conn.Close();
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["receiptNB"] = TextBox44.Text;
            Session["patient-ssn"] = TextBox3.Text;
            Session["patient-fullname"] = TextBox4.Text;
            Session["patient-dateofbirth"] = TextBox5.Text;

            Session["DatePicker"] = datepicker.Text;
            Session["doctor-fullname"] = TextBox8.Text;
            Session["doctor-speciality"] = TextBox9.Text;
            Session["doctor-phonenb"] = TextBox10.Text;

            Session["idDoc"] = idDoc.Text;
            Response.Redirect("Tests.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["receiptNB"] = TextBox44.Text;
            Session["patient-ssn"] = TextBox3.Text;
            Session["patient-fullname"] = TextBox4.Text;
            Session["patient-dateofbirth"] = TextBox5.Text;

            Session["DatePicker"] = datepicker.Text;
            Session["doctor-fullname"] = TextBox8.Text;
            Session["doctor-speciality"] = TextBox9.Text;
            Session["doctor-phonenb"] = TextBox10.Text;

            Session["idDoc"] = idDoc.Text;
            Response.Redirect("Radiology.aspx");
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            //ta jib idUser
            try
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Select * from Users where username=@username";
                cmd.Parameters.AddWithValue("username", Session["username"].ToString());

                conn.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();


                if (dr.Read())
                {
                    string id = dr["idUser"].ToString();
                    SqlCommand command2 = conn.CreateCommand();
                    command2.CommandText = "UPDATE Prescription set PrIssuedDate=@PrIssuedDate,PrFilledDate=@PrFilledDate,ssn=@ssn,idDoc=@idDoc,idUser=@idUser where prNB=@prNB";
                    command2.Parameters.AddWithValue("prNB", Session["prnb"].ToString());
                    command2.Parameters.AddWithValue("PrFilledDate", Convert.ToDateTime(TextBox7.Text));
                    command2.Parameters.AddWithValue("PrIssuedDate", Convert.ToDateTime(datepicker.Text));
                    command2.Parameters.AddWithValue("ssn", TextBox3.Text);
                    command2.Parameters.AddWithValue("idDoc", idDoc.Text);
                    command2.Parameters.AddWithValue("idUser", id);
                    command2.ExecuteNonQuery();
                }
                Session.Remove("DatePicker");
                Session.Remove("idDoc");
                Response.Redirect("Home.aspx");
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
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }

        }
        protected void gridView1(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void TextBox9_TextChanged(object sender, EventArgs e)
        {
            string spec = TextBox9.Text;
            if (spec != null || spec != "")
            {
                SqlCommand command = conn.CreateCommand();
                command.CommandText = "update Doctors set speciality=@speciality where name=@name";
                command.Parameters.AddWithValue("name", TextBox8.Text);
                command.Parameters.AddWithValue("speciality", TextBox9.Text);
                conn.Open();
                command.ExecuteNonQuery();
                conn.Close();
            }
            TextBox10.Focus();
        }

        protected void TextBox10_TextChanged(object sender, EventArgs e)
        {
            string phone = TextBox10.Text;
            if (phone != null || phone != "")
            {
                SqlCommand command = conn.CreateCommand();
                command.CommandText = "update Doctors set tel=@tel where name=@name";
                command.Parameters.AddWithValue("name", TextBox8.Text);
                command.Parameters.AddWithValue("tel", TextBox10.Text);
                conn.Open();
                command.ExecuteNonQuery();
                conn.Close();
            }

        }
    }
}