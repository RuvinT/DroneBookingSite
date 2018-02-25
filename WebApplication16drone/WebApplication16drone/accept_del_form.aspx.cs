using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Text;

namespace WebApplication16drone
{
    public partial class accept_del_form : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)

        {
            if (!IsPostBack)
            {    string email = Request.QueryString["email"].ToString();
                Session["useremail"]  = Request.QueryString["email"].ToString();

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString);
                conn.Open();
                String insertQ2 = "select * from Droneorders WHERE email='" + email + "'";
                SqlCommand com2 = new SqlCommand(insertQ2, conn);

                SqlDataReader reader = com2.ExecuteReader();

                reader.Read();
                name.Text = reader["FullName"].ToString();
                nic.Text = reader["Nic"].ToString();
                phone.Text = reader["Phone"].ToString();
                emaill.Text = reader["Email"].ToString();
                dname.Text = reader["DroneName"].ToString();
                location.Text = reader["Locati"].ToString();

                conn.Close();

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString))
                {


                    SqlCommand cmd = new SqlCommand("select BeginDate from Droneorders WHERE Email='" + email + "'", con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();


                    while (rdr.Read())
                    {


                        dates.Text += rdr["BeginDate"].ToString() +
                     "<br />";

                    }


                    con.Close();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString);
                conn.Open();

                String str = "select NoOFDrones from Drones where DroneName ='" + dname.Text + "'";


                // String str1 = "SELECT BeginDate FROM (SELECT BeginDate FROM BookedDrone WHERE DroneName = '" + droname + "') BookedDrone GROUP BY BeginDate HAVING COUNT(*) > 1";
                SqlCommand comx = new SqlCommand(str, conn);
               int cou = Convert.ToInt32(comx.ExecuteScalar().ToString());
                // SqlCommand com1 = new SqlCommand(str1, conn);
               
               







                conn.Close();
                object objResult;
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString))
                {


                    SqlCommand cmd = new SqlCommand("SELECT count(*) FROM (SELECT BeginDate FROM BookedDrone WHERE DroneName = '" + dname.Text + "') BookedDrone GROUP BY BeginDate HAVING COUNT(*) >= '" + cou + "'", con);
                    con.Open();

                    objResult = cmd.ExecuteScalar();
                   

                   


                    con.Close();

                }



                if (objResult==null) {

                    SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString);

                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString))
                    {


                        SqlCommand cmd = new SqlCommand("select BeginDate from Droneorders WHERE Email='" + Session["useremail"] + "'", con);
                        con.Open();
                        SqlDataReader rdr = cmd.ExecuteReader();


                        while (rdr.Read())
                        {

                            con1.Open();
                            String userinsertquary = "insert into BookedDrone (DroneName,BeginDate,Email) values (@FNM,@BIGIDT,@mail)";
                            SqlCommand com = new SqlCommand(userinsertquary, con1);

                            com.Parameters.AddWithValue("@FNM", dname.Text);

                            com.Parameters.AddWithValue("@BIGIDT", rdr["BeginDate"].ToString());
                            com.Parameters.AddWithValue("@mail", emaill.Text);



                            com.ExecuteNonQuery();
                            con1.Close();

                        }


                        con.Close();
                    }
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString))
                    {



                        con.Open();



                        if (Session["SelectedDates"] != null)
                        {
                            List<DateTime> newList = (List<DateTime>)Session["SelectedDates"];
                            foreach (DateTime dt in newList)
                            {

                                // insert into done order table



                                //end of that table

                                // Response.Write(dt);

                            }

                            con.Close();

                        }
                    }




                    string sendemail = ConfigurationManager.AppSettings["SendEmail"];
                    if (sendemail.ToLower() == "true")
                    {

                        MyFunction(name.Text, content.Text, Session["useremail"].ToString(), title.Text);


                    }
                    // Response.Redirect("AdminViewBookings.aspx");

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Message sent successfully...!');", true);
                }
                else { ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('This booking cannot approve deones full check dates...!');", true); }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());

            }
        }
        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString))
                {


                    SqlCommand cmd = new SqlCommand("delete from Droneorders WHERE Email='" + Session["useremail"].ToString() + "'", con);
                    con.Open();



                    cmd.ExecuteNonQuery();

                    con.Close();
                    SqlCommand cmd1 = new SqlCommand("delete from BookedDrone WHERE Email='" + Session["useremail"].ToString() + "'", con);
                    con.Open();



                    cmd1.ExecuteNonQuery();

                    con.Close();
                }



                string sendemail = ConfigurationManager.AppSettings["SendEmail"];
                if (sendemail.ToLower() == "true")
                {

                    MyFunction(name.Text, content.Text, Session["useremail"].ToString(), title.Text);


                }
               // Response.Redirect("AdminViewBookings.aspx");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Message sent successfully...!');", true);
            } catch (Exception ex)
            {
                Response.Write(ex.ToString());

            }
}
        void MyFunction(string name, string discription, string email,string sub)
        {
            MailMessage mailMessage = new MailMessage("lankadrone@gmail.com", email);


            // StringBuilder class is present in System.Text namespace
            StringBuilder sbEmailBody = new StringBuilder();
            sbEmailBody.Append("Dear " + name + ",<br/><br/>");
            
            sbEmailBody.Append("<br/>"); sbEmailBody.Append(discription);
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<b>Lanka Drones</b>");

            mailMessage.IsBodyHtml = true;

            mailMessage.Body = sbEmailBody.ToString();
            mailMessage.Subject = sub;
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "lankadrone@gmail.com",
                Password = "Lanka#DR571"
            };

            smtpClient.EnableSsl = true;
            smtpClient.Send(mailMessage);
        }
    }
}