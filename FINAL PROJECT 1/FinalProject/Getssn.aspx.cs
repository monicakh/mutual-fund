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
    public partial class GetPrescription : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DbCon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            string name = " اهلا";
            Label2.Text = "! " + Session["username"].ToString() + name;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
                Session["ssn"] = TextBox1.Text;
               String newText = TextBox1.Text;
            if (newText == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' ادخل الرقم الضمان ')", true);
            }
            else
            {
                Response.Redirect("GetPrescriptionGridView.aspx");
            } 
        }
    }
}