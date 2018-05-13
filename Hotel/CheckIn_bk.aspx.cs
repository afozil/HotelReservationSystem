using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;

using System.Data;
using System.Data.SqlTypes;

public partial class Hotel_CheckIn_bk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindActiveBookings();
            BindAvailableRooms();
            BindPendingPaymentModes();
            int bookingId = 0;
            Session.Remove("Prop_Action");
            if (Request.QueryString["Booking_ID"] != null)
            {
                bookingId = Request.Params["Booking_ID"] != null || Request.Params["Booking_ID"] != "" ? Int32.Parse(Request.Params["Booking_ID"].ToString()) : 0;
                
                Session["Prop_Action"] = "U";
            }
            if (Session["Prop_Action"] == "U")
                BindBooking(bookingId);

        }
    }


    private void BindBooking(int bookingId)
    {
        Bookings booking = new Bookings();
        booking.Booking_ID = SqlInt32.Parse(bookingId.ToString());
        DataTable table = booking.SelectOne();
        btnCheckIn.Enabled = true;
        if (booking.BookingStatus==BookingStatus.CANCELLED || 
            booking.BookingStatus==BookingStatus.CHECKED_IN || 
            booking.BookingStatus==BookingStatus.CHECKED_OUT)
            btnCheckIn.Enabled = false;
        

        if (drpBookings.Items.Count > 0)
        {
            drpBookings.ClearSelection();
            drpBookings.Items.FindByValue(bookingId.ToString()).Selected = true;
        }
        if (table.Rows.Count <= 0) {
            lblStatus.Text = "There is no Booking!!";
                return;
        }
        lblFromDate.Text = DateTime.Parse(table.Rows[0]["FromDate"].ToString()).ToString("MM/dd/yyyy");
        lblToDate.Text = DateTime.Parse(table.Rows[0]["ToDate"].ToString()).ToString("MM/dd/yyyy");
        lblRoomType.Text = table.Rows[0]["RoomType_EN"].ToString();
        if (drpRoomsList.Items.Count > 0) {
            drpRoomsList.ClearSelection();
            drpRoomsList.Items.FindByValue(booking.Room_ID.ToString()).Selected = true;
        }
        //lblSalesPerson.Text = table.Rows[0]["EmployeeFirstName"].ToString() + table.Rows[0]["EmployeeMiddleName"].ToString() + table.Rows[0]["EmployeeLastName"].ToString();
        lblRateName.Text = table.Rows[0]["RateDescription_EN"].ToString();
        lblRate.Text = table.Rows[0]["Rate"].ToString();
        lblPaidAmount.Text = table.Rows[0]["Amount_Paid"].ToString();
        //lblSalesPersonDiscount.Text = table.Rows[0]["Discount"].ToString();
        lblDiscountOffered.Text = table.Rows[0]["Discount_Offered"].ToString();
        lblTotalAmount.Text = table.Rows[0]["Cost_After_Discount"].ToString();
        lblBookingStatus.Text = table.Rows[0]["BookingStatus_EN"].ToString();
        SqlInt32 bookingStatus = SqlInt32.Parse(table.Rows[0]["BookingStatus"].ToString());
        lblPaymentMode.Text = table.Rows[0]["PaymentMode"].ToString();
        txtPendingAmount.Text = table.Rows[0]["Amount_PendingPayment"].ToString();
        hidPendingPayment.Value = txtPendingAmount.Text;

    }

    private void BindActiveBookings()
    {
        DataTable table = new Bookings().SelectAll();
        drpBookings.DataSource = table;
        drpBookings.DataTextField = table.Columns["Booking_ID"].ToString();
        drpBookings.DataValueField = table.Columns["Booking_ID"].ToString();
        drpBookings.DataBind();
        drpBookings.Items.Insert(0, new ListItem("Select a Booking...", "-1"));
    }
    private void BindAvailableRooms()
    {
        //TODO: Display only Available rooms of the type for the day
        DataTable table = new Rooms().SelectAll();
        drpRoomsList.DataSource = table;
        drpRoomsList.DataTextField = table.Columns["RoomNumber"].ToString();
        drpRoomsList.DataValueField = table.Columns["Room_ID"].ToString();
        drpRoomsList.DataBind();
    }

    private void BindPendingPaymentModes()
    {
        DataTable table=new PaymentModes().SelectAll();
        drpPendingPaymentMode.DataSource = table;
        drpPendingPaymentMode.DataTextField = table.Columns["PaymentMode"].ToString();
        drpPendingPaymentMode.DataValueField = table.Columns["PaymentMode_ID"].ToString();
        drpPendingPaymentMode.DataBind();

    }

    protected void btnCheckIn_Click(object sender, EventArgs e)
    {
        Bookings booking = new Bookings();
        booking.Booking_ID =  SqlInt32.Parse(drpBookings.SelectedValue);
        booking.SelectOne();
        if (booking.BookingStatus == BookingStatus.CANCELLED ||
            booking.BookingStatus == BookingStatus.CHECKED_IN ||
            booking.BookingStatus == BookingStatus.CHECKED_OUT)
        {
            lblStatus.Text = "Cannot Check In to  Cancelled/Checked In/Checked Out Booking!!!";
            return;
        }
        DateTime checkInDate = DateTime.Parse(txtCheckInDate.Text);
        int compareCheckInDate = checkInDate.CompareTo(DateTime.Now.Date);
        if (compareCheckInDate < 0 || compareCheckInDate > 0)
        {
            lblStatus.Text = "Check In Date must be today";
            return;
        }
        
        CheckIn checkIn = new CheckIn();
        checkIn.Booking_ID = booking.Booking_ID;
        checkIn.Guest_ID = booking.Guest_ID;
        checkIn.Room_ID = SqlInt32.Parse(drpRoomsList.SelectedValue);
        checkIn.CheckIn_Date = new SqlDateTime(DateTime.Now);
        checkIn.CheckIn_Personnel = 1;
        checkIn.IsTotalAmountSettled = (chkPaid.Checked) ? 1 : 0;
        SqlMoney settledAmount = ((txtPendingAmount.Text != null || txtPendingAmount.Text != string.Empty) && txtPendingAmount.Text != "") ? SqlMoney.Parse(txtPendingAmount.Text) : 0;
        if ((hidPendingPayment.Value != null || hidPendingPayment.Value != string.Empty) && hidPendingPayment.Value != "")
        {
            SqlMoney pendingAtBooking = SqlMoney.Parse(hidPendingPayment.Value);
            if (pendingAtBooking > 0 && pendingAtBooking == SqlMoney.Parse(txtPendingAmount.Text))
            {
                checkIn.Settled_Amount = settledAmount;
                checkIn.IsTotalAmountSettled = 1;
                booking.PaymentStatus = PaymentStatus.FULLY_PAID;
                checkIn.PendingPayment_Mode = SqlInt32.Parse(drpPendingPaymentMode.SelectedValue);
            }
            else if (pendingAtBooking > 0 && pendingAtBooking < SqlMoney.Parse(txtPendingAmount.Text))
            {
                checkIn.Settled_Amount = settledAmount;
                checkIn.IsTotalAmountSettled = 0;
                booking.PaymentStatus = PaymentStatus.PARTIAL_PAID;
                checkIn.PendingPayment_Mode = SqlInt32.Parse(drpPendingPaymentMode.SelectedValue);
                booking.Amount_PendingPayment = pendingAtBooking - settledAmount;
            }
        } 
        if (checkIn.Insert())
        {
            Rooms room = new Rooms();
            room.Room_ID = checkIn.Room_ID;
            room.SelectOne();
            room.RoomStatus_ID = RoomStatus.OCCUPIED;
            room.Update();
            booking.BookingStatus = BookingStatus.CHECKED_IN;
            booking.Update();
            lblStatus.Text = "Successfully Checked In.";
            btnCheckIn.Enabled = false;
        }


    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("BookingsList.aspx", true);
    }
    protected void drpBookings_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblStatus.Text = string.Empty;
        int bookingId = Int32.Parse(drpBookings.SelectedValue);
        if (bookingId == -1)
        {
            lblStatus.Text = "Please select a Booking Id";
            return;
        }
        BindBooking(bookingId);
    }
}