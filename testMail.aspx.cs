using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

public partial class testMail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    
        try
        {
            //Create the msg object to be sent
            MailMessage msg = new MailMessage();
            //Add your email address to the recipients
            msg.To.Add("bentoms@gmail.com");
            //Configure the address we are sending the mail from
            MailAddress address = new MailAddress("booking@failakaonline.com");
            msg.From = address;
            msg.Subject = "Failaka Online Reservation";
            msg.Body = "Dear Benoy, " + "<br/>" + "Your Booking has been completed successfully.<br/> Reservation ID : " + 123;
            msg.IsBodyHtml = true;

            SmtpClient client = new SmtpClient();
            client.Host = "relay-hosting.secureserver.net";
            client.Port = 25;


            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            ServicePointManager.ServerCertificateValidationCallback += delegate { return true; };
            //Send the msg
            client.Send(msg);

            //Display some feedback to the user to let them know it was sent
             lblResult.Text = "Your message was sent!";
        }
        catch (Exception ex)
        {
            //If the message failed at some point, let the user know
            lblResult.Text = ex.ToString(); //alt text "Your message failed to send, please try again."
        }
    

}
}