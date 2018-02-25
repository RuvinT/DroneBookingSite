using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;


namespace WebApplication16drone
{
    public partial class contactus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       
        protected void ButtonSendMessage_Click(object sender, EventArgs e)
        {
            String Name = "Unknown";
            String emal = "";
            String subject = "Nosubject";
            String message = "default";

            Name = contact_name.Value;
            emal = TextBoxcontact_email.Text;
            subject = contact_subject.Value;
            message = TextBoxcontact_message.Text;

           // Response.Write(contact_name.Value);

            // send an e-mail to customer

            try
            {
                // /* "https://myaccount.google.com/lesssecureapps?pli=1" */

                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("lankadrone@gmail.com", "Lanka#DR571");
                MailMessage msgobj = new MailMessage();
                msgobj.To.Add(emal.ToString());
                msgobj.From = new MailAddress("lankadrone@gmail.com");
                msgobj.Subject = "Lankadrone";
                msgobj.Body = "Thak you for your comment ....!";
                client.Send(msgobj);

                //popup box
               // ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('message sent successfully...!');", true);

                //Response.Write("message has been sent successfully");


            }
            catch (Exception ex)
            {
                Response.Write("Could not send the email" + ex.Message);
            }


            // send message to system addministator

            try
            {
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("lankadrone@gmail.com", "Lanka#DR571");
                MailMessage msgobj = new MailMessage();
                msgobj.To.Add("indunilm76@gmail.com");
                msgobj.From = new MailAddress("lankadrone@gmail.com");
                msgobj.Subject = subject;

                String Contactmessage = message ;

                msgobj.Body = Contactmessage;
                client.Send(msgobj);

                //popup box
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('message sent successfully...!');", true);

                //Response.Write("message has been sent successfully");
            }
            catch (Exception ex)
            {
                Response.Write("Could not send the email" + ex.Message);
            }
        }
    }
}