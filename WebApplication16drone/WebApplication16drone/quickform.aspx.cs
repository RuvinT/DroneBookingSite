using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication16drone
{
    public partial class quickform : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Buttonconfirm_Click(object sender, EventArgs e)
        {
            Session["Fnme"] = TextBoxFullName.Text;
            Session["Nic"] = TextBoxID.Text;
            Session["phn"] = TextBoxPhoneNumber.Text;
            Session["eml"] = TextBoxemail.Text;
           // Session["droneid"] = TextBoxID.Text;
            Session["locatio"] = TextBoxLocation.Text;
           // Session["dat"] = TextBoxBeginDate.Text;
            //Session["endat"] = TextBoxEndDate.Text;

            Response.Redirect("selectlocation.aspx");
        }
    }
}