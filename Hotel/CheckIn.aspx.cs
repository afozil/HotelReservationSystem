using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Data.SqlTypes;
using System.Drawing;

public partial class Hotel_CheckIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["Reservation_ID"] != null)
                hidReservationId.Value = Request.Params["Reservation_ID"] != null || Request.Params["Reservation_ID"] != "" ? Request.Params["Reservation_ID"].ToString() : "0";
        }
        txtCheckInDate.Text = DateTime.Today.ToString("MM/dd/yyyy");
    }

    protected void btnCheckIn_Click(object sender, EventArgs e)
    {
        DateTime checkInDate = DateTime.Parse(txtCheckInDate.Text);
        SqlDateTime sCheckInDate = Utility.GetSqlCheckInTimeFromDate(checkInDate);
        if (checkInDate.Date > DateTime.Today || checkInDate.Date < DateTime.Today)
            lblMsg.Text = "Invalid Date is wrong";

        Reservations r = new Reservations();
        r.Reservation_ID = SqlInt32.Parse(hidReservationId.Value);
        r.SelectOne();
        Reservation_Payments rp = new Reservation_Payments();
        rp.Reservation_ID = r.Reservation_ID;
        rp.SelectAll();

        if (r.BookingStatus == BookingStatus.CHECKED_IN)
        {
            lblMsg.Text = "Invalid Check In. Already Checked In";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        if (r.PaymentStatus == PaymentStatus.PARTIAL_PAID)
        {
            lblMsg.Text = "Please pay the pending amount";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        if (sCheckInDate.Value.Date > r.ToDate.Value.Date)
        {
            lblMsg.Text = "Invalid Check In Date. Booking Period is past";
            lblMsg.ForeColor = Color.Red;
            btnCancel.Visible = true;
            return;
        }
        if (sCheckInDate.Value.Date < r.FromDate.Value.Date)
        {
            lblMsg.Text = "Invalid Check In Date. Selected date is earlier than Booked From date";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        CheckIn checkIn = new CheckIn();
        checkIn.Reservation_ID = r.Reservation_ID;
        checkIn.CheckIn_Date = sCheckInDate;
        checkIn.Remarks = txtComments.Text;
        checkIn.CheckIn_Date = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
        checkIn.CheckIn_Personnel = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
       
        if (checkIn.Insert()) {
            lblMsg.Text = "Sucessfully Checked In";
            lblMsg.ForeColor = Color.Green;

            return;
        }
        else
        {
            lblMsg.Text = checkIn.ErrorCode.ToString() + " - " + checkIn.ErrorDesc.ToString();
            lblMsg.ForeColor = Color.Red;
            return;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Reservations res = new Reservations();
        res.Reservation_ID = SqlInt32.Parse(hidReservationId.Value);
        
        if (res.Delete())
        {
            lblMsg.Text = "Reservation & Associateed Payments Cancelled. Room made Ready";
            lblMsg.ForeColor = Color.Green;
        }
        else
        {
            lblMsg.Text = "Error in Cancellation";
            lblMsg.ForeColor = Color.Red;
        }

    }
    protected void btnPrintWelcome_Click(object sender, EventArgs e)
    {
        Reservation_Payments rp = new Reservation_Payments();
        rp.Reservation_ID = SqlInt32.Parse(hidReservationId.Value);
      //  rp.SelectOne();

        DataTable resevePay = rp.GetReservationPayment();
        Session["welcomeLetter"] = resevePay;
        string popupScript = "<script language='javascript'>" +
                          "window.open('Welcome.aspx','ThisPopUp1', " +
                          "'left = 300, top=150,  " +
                          "menubar=no, scrollbars=yes, resizable=yes')" +
                          "</script>";
        Page.ClientScript.RegisterStartupScript(GetType(), "PopupScript", popupScript);
        
    }
    protected void btnPrintRegistration_Click(object sender, EventArgs e)
    {
        CheckIn checkIn = new CheckIn();
        checkIn.Reservation_ID = SqlInt32.Parse(hidReservationId.Value);
        DataTable tbaleCard = checkIn.SelectOne_ByReservationID();//FOR registration card
        Session["welcomeCard"] = tbaleCard;

        string popupScript = "<script language='javascript'>" +
                          "window.open('RegCard.aspx','ThisPopUp1', " +
                          "'left = 300, top=150,  " +
                          "menubar=no, scrollbars=yes, resizable=yes')" +
                          "</script>";
        Page.ClientScript.RegisterStartupScript(GetType(), "PopupScript", popupScript);

    }
}