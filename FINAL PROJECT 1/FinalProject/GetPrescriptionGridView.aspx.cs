using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class GetPrescription1 : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            string name = " اهلا";
            Label40.Text = "! " + Session["username"].ToString() + name;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Session["idPresc"] = row.Cells[1].Text;
            Response.Redirect("GetPrescription.aspx");
        }
    }
}