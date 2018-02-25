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
    public partial class index : System.Web.UI.Page
    {
        
        string droname=null;int cou=100; // cou iyanne thiyena mulu drone gana
        int cob = 0;
        public static List<DateTime> list = new List<DateTime>();
       
        protected DataSet dsDates;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = GetData1();
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            if (!Page.IsPostBack)
            {
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT DroneName FROM Drones"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        DropDownList1.DataSource = cmd.ExecuteReader();
                        DropDownList1.DataTextField = "DroneName";
                        DropDownList1.DataValueField = "DroneName";
                        DropDownList1.DataBind();
                        con.Close();
                    }
                }
                DropDownList1.Items.Insert(0, new ListItem("Select Drone", "0"));
            }
           
            if (!IsPostBack)
            {
                Calendar1.VisibleDate = DateTime.Today;
            }
            if (Session["scount"] == null) { }
            else
            {

                GetDates(Convert.ToInt32(Session["scount"].ToString()), Session["sdronename"].ToString());
            }
           

        }
        protected void GetDates(int count,string droneNme)
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

                   // Response.Write(rdr["BeginDate"].ToString());
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
            if (e.Day.Date < DateTime.Now.Date)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.Black;

            }

            if (e.Day.IsSelected == true)
            {
                list.Add(e.Day.Date);
              
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

        private DataSet GetData1()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString))
            {


                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Drones  ", con);

                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;


            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex != 0)
            {
                 droname = DropDownList1.SelectedItem.Value;
               // Response.Write(droname);

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString);
                conn.Open();

                String str = "select NoOFDrones from Drones where DroneName ='" + droname + "'";


               // String str1 = "SELECT BeginDate FROM (SELECT BeginDate FROM BookedDrone WHERE DroneName = '" + droname + "') BookedDrone GROUP BY BeginDate HAVING COUNT(*) > 1";
                SqlCommand com = new SqlCommand(str, conn);
                cou = Convert.ToInt32(com.ExecuteScalar().ToString());
                // SqlCommand com1 = new SqlCommand(str1, conn);
                Session["sdronename"] = droname;
                Session["scount"] = cou;
                //Response.Write(cou);
                GetDates(cou, droname);







                conn.Close();









            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
           
            if (Session["SelectedDates"] != null)
            {
                List<DateTime> newList = (List<DateTime>)Session["SelectedDates"];
                foreach (DateTime dt in newList)
                {
                    Calendar1.SelectedDates.Add(dt);
                   // Response.Write(dt);
                    
                }
                list.Clear();
            }
        }

        protected void ButtonCheck_Click(object sender, EventArgs e)
        {
            try
            {
                ///String checkdrone = "SELECT count(*) FROM Users where email ='" + TextBoxemail.Text + "'";
                // SqlCommand com = new SqlCommand(checkdrone, con);

                //  int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

                //Response.Write(temp);

                //Response.Write(Session["sdronename"]);

                Response.Redirect("quickform.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}