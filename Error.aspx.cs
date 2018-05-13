using System;
using HotelReservationSystemDAL;
using System.Web.UI;
using System.Data;
using System.Data.SqlTypes;
using System.Net;
using System.Net.Mail;
using System.Configuration;

public partial class Error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                string PaymentID, Result, TranID, Auth, Ref, TrackID, reservationId;
                PaymentID = Request.QueryString["PaymentID"];
                Result = Request.QueryString["Result"];
                TranID = Request.QueryString["TranID"];
                Auth = Request.QueryString["Auth"];
                Ref = Request.QueryString["Ref"];
                TrackID = Request.QueryString["TrackID"];
                reservationId = Request.QueryString["UDF1"];
                UpdateKNET(PaymentID, Result, Auth, Ref, TranID, TrackID);
                BindReservation(PaymentID);
            }
            catch (Exception ex) { }
        }
    }
    private void UpdateKNET(string knetPaymentId, string result, string auth, string Ref, string TranID, string TrackID)
    {
        KNET_Payments knet = new KNET_Payments();
        knet.KNET_Payment_ID = knetPaymentId;
        knet.SelectOne();
        knet.Result = result;
        knet.Auth = auth;
        knet.Ref = Ref;
        knet.TransVal = TranID;
        knet.Track_ID = TrackID;
        knet.PaymentSatus = PaymentStatus.KNET_ERROR;
        knet.Remarks = knet.Remarks + "- KNET ERROR";
        String status = "Error in KNET Payment !!!";
        if (result == "CANCELED")
        {
            knet.PaymentSatus = PaymentStatus.KNET_CANCELED;
            knet.Remarks = knet.Remarks + "- KNET CANCELED";
            status = "KNET Payment Canceled!!!";
        }
        if (knet.Update())
            this.lblStatus.Text = status;
        else
            this.lblStatus.Text = "KNET Payment Error. Error in Saving it !!!";
    }
    private void BindReservation(string knetPaymentId)
    {
        KNET_Payments knet = new KNET_Payments();
        knet.KNET_Payment_ID = knetPaymentId;
        knet.SelectOne();
        this.lblKnetPaymentId.Text = knet.KNET_Payment_ID;
        this.lblKnetReference.Text = knet.Ref;

        Reservation_Payments payments = new Reservation_Payments();
        payments.Reservation_ID = knet.Reservation_ID;
        DataTable pays = payments.SelectAll();
        int numKidsFerry = 0, numAdultsFerry = 0, numDays = 0;
        SqlMoney roomCharges = new SqlMoney(0.00);
        SqlMoney ferryCharges = new SqlMoney(0.00);
        SqlMoney kidsFerryCost = new SqlMoney(0.00);
        SqlMoney adultsFerryCost = new SqlMoney(0.00);
        SqlMoney totalCost = new SqlMoney(0.00);
        if (pays.Rows.Count > 0)
        {
            foreach (DataRow r in pays.Rows)
            {
                if ((Int32)r["AvailedService_Type"] == PAYMENT_AVAILED_SERVICETYPES.FERRY_KIDS)
                {
                    numKidsFerry = (Int32)r["UnitsConsumed"];
                    kidsFerryCost = (Decimal)r["Cost_After_Discount"];
                }
                if ((Int32)r["AvailedService_Type"] == PAYMENT_AVAILED_SERVICETYPES.FERRY_ADULTS)
                {
                    numAdultsFerry = (Int32)r["UnitsConsumed"];
                    adultsFerryCost = (Decimal)r["Cost_After_Discount"];
                }
                if ((Int32)r["AvailedService_Type"] == PAYMENT_AVAILED_SERVICETYPES.RESERVATION)
                {
                    numDays = (Int32)r["UnitsConsumed"];
                    roomCharges = (Decimal)r["Cost_After_Discount"];
                }
            }
        }
        ferryCharges = (adultsFerryCost + kidsFerryCost);
        totalCost = (ferryCharges + roomCharges);
        this.lblRoomCharges.Text = roomCharges.ToString();
        //this.lblFerryCharges.Text = ferryCharges.ToString();
        this.lblTotalCharges.Text = totalCost.ToString();

        this.lblDays.Text = numDays.ToString();
        //this.lblFerryKids.Text = numKidsFerry.ToString();
        //this.lblFerryAdults.Text = numAdultsFerry.ToString();

        Reservations reservation = new Reservations();
        reservation.Reservation_ID = knet.Reservation_ID;
        reservation.SelectOne();
        this.lblFromDate.Text = Utility.GetDateTimeFromSqlDateTime(reservation.FromDate).ToString("dd/MM/yyyy");
        this.lblToDate.Text = Utility.GetDateTimeFromSqlDateTime(reservation.ToDate).ToString("dd/MM/yyyy");
        this.lblRoomType.Text = reservation.RoomType_ID.ToString();
        //this.lblFerryKidsValidity.Text = Utility.GetDateTimeFromSqlDateTime(reservation.FromDate).ToString("dd/MM/yyyy");
        //this.lblFerryAdultsValidity.Text = Utility.GetDateTimeFromSqlDateTime(reservation.FromDate).ToString("dd/MM/yyyy");
        //this.lblDepartureTickets.Text = (numKidsFerry + numAdultsFerry).ToString();
        //this.lblDepartureDate.Text = Utility.GetDateTimeFromSqlDateTime(reservation.ToDate).ToString("dd/MM/yyyy");

        Guests guest = new Guests();
        guest.Guest_ID = reservation.Guest_ID;
        guest.SelectOne();
        this.lblGuestFirstName.Text = guest.FirstName.ToString();
        this.lblGuestMiddleName.Text = guest.MiddleName.ToString();
        this.lblGuestLastName.Text = guest.LastName.ToString();
        this.lblGuestEmail.Text = guest.Email.ToString();
        this.lblGuestMobile.Text = guest.MobileNumber.ToString();
        this.lblGuestCvd.Text = guest.Civil_ID.ToString();
        //SendMail("", "Failed", "", "", "", "", guest.Email.ToString(), guest.FirstName.ToString());

    }

    private void SendMail(string knetPaymentId, string result, string auth, string Ref, string TranID, string TrackID, string email, string strName)
    {
        try
        {
            AppSettingsReader _configReader = new AppSettingsReader();

            string smtp_Host = _configReader.GetValue("smtp_server", typeof(string)).ToString();
            string smtp_Email = _configReader.GetValue("backoffice_email", typeof(string)).ToString();
            string smtp_UserName = _configReader.GetValue("backoffice_email", typeof(string)).ToString();
            string smtp_Password = _configReader.GetValue("backoffice_password", typeof(string)).ToString();
            //Create the msg object to be sent
            MailMessage msg = new MailMessage();
            //Add your email address to the recipients
            msg.To.Add(email);
            //Configure the address we are sending the mail from
            MailAddress address = new MailAddress(smtp_Email);
            //MailAddress address = new MailAddress("admin@failakaonline.com");
            msg.From = address;
            msg.Subject = "Failaka Online Reservation - Failed.";
            msg.Body = "Dear " + strName + ",<br/>" + "Your Booking Failed.<br/> Please try later. " ;
            msg.IsBodyHtml = true;

            SmtpClient client = new SmtpClient();
            client.Host = smtp_Host;
            client.Port = 25;
            client.Credentials = new NetworkCredential(smtp_Email, smtp_Password); 

            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            ServicePointManager.ServerCertificateValidationCallback += delegate { return true; };
            //Send the msg
            client.Send(msg);

            //Display some feedback to the user to let them know it was sent
            // lblResult.Text = "Your message was sent!";
        }
        catch (Exception ex)
        {
            //If the message failed at some point, let the user know
            // lblResult.Text = ex.ToString(); //alt text "Your message failed to send, please try again."
        }
    }



}