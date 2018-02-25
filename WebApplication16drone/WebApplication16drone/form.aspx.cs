using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Collections.Generic;

using System.Web.Script.Serialization;


namespace WebApplication16drone
{
    public partial class form : System.Web.UI.Page
    {
        string droname = null; int cou = 100;
        public static List<DateTime> list = new List<DateTime>();

        protected DataSet dsDates;

        protected void Page_Load(object sender, EventArgs e)
        {
            droname = Request.QueryString["id1"].ToString();
            // Response.Write(droname);

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString);
            conn.Open();

            String str = "select count(*) from Drones where DroneName ='" + droname + "'";


            // String str1 = "SELECT BeginDate FROM (SELECT BeginDate FROM BookedDrone WHERE DroneName = '" + droname + "') BookedDrone GROUP BY BeginDate HAVING COUNT(*) > 1";
            SqlCommand com = new SqlCommand(str, conn);
            cou = Convert.ToInt32(com.ExecuteScalar().ToString());
            // SqlCommand com1 = new SqlCommand(str1, conn);
            Session["sdronename"] = droname;
            Session["scount"] = cou;
            GetDates(cou, droname);

            if (!IsPostBack)
            {
                Calendar1.VisibleDate = DateTime.Today;
            }
          

        }


        protected void GetDates(int count, string droneNme)
        {

            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString))
            {


                SqlCommand cmd = new SqlCommand("SELECT BeginDate FROM (SELECT BeginDate FROM BookedDrone WHERE DroneName = '" + droneNme + "') BookedDrone GROUP BY BeginDate HAVING COUNT(*) >= '" + count + "'", con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                dt.Columns.AddRange(new DataColumn[1] { new DataColumn("BookedDate", typeof(DateTime)) });
                while (rdr.Read())
                {


                    dt.Rows.Add(rdr["BeginDate"].ToString());

                    //Response.Write(rdr["BeginDate"].ToString());
                }


                con.Close();

            }
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            dsDates = ds;


        }
        protected void Calendar1DayRender(object sender, DayRenderEventArgs e)
        {
            DateTime nextDate;
            if (dsDates != null)
            {
                foreach (DataRow dr in dsDates.Tables[0].Rows)
                {
                    nextDate = (DateTime)dr["BookedDate"];
                    if (nextDate.Date == e.Day.Date)
                    {
                        e.Day.IsSelectable = false;
                        e.Cell.BackColor = System.Drawing.Color.Red;
                    }
                }
            }

            if (e.Day.IsSelected == true)
            {
                list.Add(e.Day.Date);

            }
            if (e.Day.Date < DateTime.Now.Date)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.Black;
                
            }
            //if (list.IndexOf(e.Day.Date) >= 0) { list.RemoveAt(list.IndexOf(e.Day.Date)); }
            // Response.Write(list.IndexOf(e.Day.Date));

            Session["SelectedDates"] = list;







        }


        protected void ButtonCheck1_Click(object sender, EventArgs e)
        {
            list.Clear();
            Session["SelectedDates"] = null;

            Calendar1.SelectedDates.Clear();
        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

            if (Session["SelectedDates"] != null)
            {
                List<DateTime> newList = (List<DateTime>)Session["SelectedDates"];
                foreach (DateTime dt in newList)
                {
                    Calendar1.SelectedDates.Add(dt);

                }
                list.Clear();
            }
        }


        protected void Buttonconfirm_Click(object sender, EventArgs e)
        {
           // con.Open();

            //storing Sessions

            Session["Fnme"] = TextBoxFullName.Text;
            Session["Nic"] = TextBoxID.Text;
            Session["phn"] = TextBoxPhoneNumber.Text;
            Session["eml"] = TextBoxemail.Text;
            Session["droneid"] = droname;
            Session["locatio"] = TextBoxLocation.Text;

           

            Response.Redirect("selectlocation.aspx");

            // insert into done order table

           /* String userinsertquary = "insert into Droneorders (FullName,Nic,Phone,Email,DroneId,LocLat,Loclang,BeginDate,EndDate) values (@FNM,@NI,@PN,@eml,@DID,@LOCLAT,@LOCLANG,@BIGIDT,@ENDDT)";
            SqlCommand com = new SqlCommand(userinsertquary, con);

            com.Parameters.AddWithValue("@FNM", TextBoxFullName.Text);
            com.Parameters.AddWithValue("@NI", TextBoxID.Text);
            com.Parameters.AddWithValue("@PN", TextBoxPhoneNumber.Text);
            com.Parameters.AddWithValue("@eml", TextBoxemail.Text);
            com.Parameters.AddWithValue("@DID", TextBoxID.Text);
            com.Parameters.AddWithValue("@LOCLAT", TextBoxID.Text);
            com.Parameters.AddWithValue("@LOCLANG", TextBoxID.Text);
            com.Parameters.AddWithValue("@BIGIDT", TextBoxBeginDate.Text);
            com.Parameters.AddWithValue("@ENDDT", TextBoxEndDate.Text);

            com.ExecuteNonQuery();

            //end of that table

            // inset into BookDrone table for lock calander 

            String Bookdrn = "insert into BookedDrone (DroneID,BeginDate,EndDate) values (@DRID,@BIGNDT,@ENDDT)";
            SqlCommand comBookdron = new SqlCommand(Bookdrn, con);

            comBookdron.Parameters.AddWithValue("@DRID", TextBoxID.Text);
            comBookdron.Parameters.AddWithValue("@BIGNDT", TextBoxBeginDate.Text);
            comBookdron.Parameters.AddWithValue("@ENDDT", TextBoxEndDate.Text);

            comBookdron.ExecuteNonQuery();
            
            //end of book drone inset

            con.Close(); 
            */

        }
    }
}