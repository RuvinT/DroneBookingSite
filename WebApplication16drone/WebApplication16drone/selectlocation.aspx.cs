using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Text;


namespace WebApplication16drone
{
    public partial class selectlocation : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(Session["locatio"]);
            
        }

        protected void ButtonUpload_Click(object sender, EventArgs e)
        {
           

        }

        protected void ButtonConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();


                if (Session["SelectedDates"] != null)
                {
                    List<DateTime> newList = (List<DateTime>)Session["SelectedDates"];
                    foreach (DateTime dt in newList)
                    {

                        // insert into done order table

                        String userinsertquary = "insert into Droneorders (FullName,Nic,Phone,Email,DroneName,Locati,LocLat,Loclang,BeginDate) values (@FNM,@NI,@PN,@eml,@DNM,@LOCA,@LOCLAT,@LOCLANG,@BIGIDT)";
                        SqlCommand com = new SqlCommand(userinsertquary, con);

                        com.Parameters.AddWithValue("@FNM", Session["Fnme"]);
                        com.Parameters.AddWithValue("@NI", Session["Nic"]);
                        com.Parameters.AddWithValue("@PN", Session["phn"]);
                        com.Parameters.AddWithValue("@eml", Session["eml"]);
                       
                        com.Parameters.AddWithValue("@DNM", Session["sdronename"]);
                        com.Parameters.AddWithValue("@LOCA", Session["locatio"]);
                        com.Parameters.AddWithValue("@LOCLAT", lat.Text);
                        com.Parameters.AddWithValue("@LOCLANG", lon.Text);
                        com.Parameters.AddWithValue("@BIGIDT", dt);
                        


                        com.ExecuteNonQuery();

                        //end of that table

                        // Response.Write(dt);

                    }

                }

                
               /*
                // inset into BookDrone table for lock calander 

               String Bookdrn = "insert into BookedDrone (DroneID,BeginDate,EndDate) values (@DRID,@BIGNDT,@ENDTE)";
                SqlCommand comBookdron = new SqlCommand(Bookdrn, con);

                comBookdron.Parameters.AddWithValue("@DRID", Session["droneid"]);
                comBookdron.Parameters.AddWithValue("@BIGNDT", Session["dat"]);
                comBookdron.Parameters.AddWithValue("@ENDTE", Session["endat"]);


                comBookdron.ExecuteNonQuery();

                //end of book drone inset
                */

                con.Close();

              //  ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Drone Orderd successfully...!');", true);

                // send an e-mail to customer

                try
                {
                    // /* "https://myaccount.google.com/lesssecureapps?pli=1" */

                   
                    string sendemail = ConfigurationManager.AppSettings["SendEmail"];
                    if (sendemail.ToLower() == "true")
                    {
                        MyFunction(Session["Fnme"].ToString(), Session["eml"].ToString());

                    }
                    //popup box
                    Session["SelectedDates"] = null;
                  

                    //Response.Write("message has been sent successfully");

                  //  Response.Redirect("index.aspx");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Drone orderd successfully...!');", true);
                }
                catch (Exception ex)
                {
                    Response.Write("Could not send the email" + ex.Message);
                }


                // send message to system addministator

                try
                {
                    /*  SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                      client.EnableSsl = true;
                      client.DeliveryMethod = SmtpDeliveryMethod.Network;
                      client.UseDefaultCredentials = false;
                      client.Credentials = new NetworkCredential("lankadrone@gmail.com", "Lanka#DR571");
                      MailMessage msgobj = new MailMessage();
                      msgobj.To.Add("indunilm76@gmail.com");
                      msgobj.From = new MailAddress("lankadrone@gmail.com");
                      msgobj.Subject = "New Drone Order";

                      String order = "You have new order at " + Session["locatio"].ToString();

                      msgobj.Body = order;
                      client.Send(msgobj);*/
                    MyFunction1(Session["locatio"].ToString());

                    //popup box
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Drone ordred successfully');", true);

                    //Response.Write("message has been sent successfully");
                }
                catch (Exception ex)
                {
                    Response.Write("Could not send the email" + ex.Message);
                }

            }

            catch(Exception ex)
            {
                Response.Write(ex.ToString());
            }
            
        }
        void MyFunction(string name, string email)
        {
            MailMessage mailMessage = new MailMessage("lankadrone@gmail.com", email);


            // StringBuilder class is present in System.Text namespace
            StringBuilder sbEmailBody = new StringBuilder();
            sbEmailBody.Append("Dear " + name + ",<br/><br/>");

            sbEmailBody.Append("<br/>"); sbEmailBody.Append("Thak you for using our site ....!");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<b>Lanka Drones</b>");

            mailMessage.IsBodyHtml = true;

            mailMessage.Body = sbEmailBody.ToString();
            mailMessage.Subject = "Drone Order";
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "lankadrone@gmail.com",
                Password = "Lanka#DR571"
            };

            smtpClient.EnableSsl = true;
            smtpClient.Send(mailMessage);
        }
        void MyFunction1( string loc)
        {
            MailMessage mailMessage = new MailMessage("lankadrone@gmail.com", "indunilm76@gmail.com");


            // StringBuilder class is present in System.Text namespace
            StringBuilder sbEmailBody = new StringBuilder();
            sbEmailBody.Append("Dear Indunil ,<br/><br/>");

            sbEmailBody.Append("<br/>"); sbEmailBody.Append("You have new order at "+loc);
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<b>Lanka Drones</b>");

            mailMessage.IsBodyHtml = true;

            mailMessage.Body = sbEmailBody.ToString();
            mailMessage.Subject = "Drone Order";
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