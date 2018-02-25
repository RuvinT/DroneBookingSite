using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication16drone
{
    public partial class AdminViewBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DataTable dt = this.GetData("select * from Droneorders");
                rptMarkers.DataSource = dt;
                rptMarkers.DataBind();
            }
        }
        private DataTable GetData(string query)
        {
            string conString = ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;

                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }
       
        protected void Gridview1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Write(GridView1.SelectedRow.Cells[1].Text);

        }

       
    }
}