using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Data.SqlTypes;

public partial class Hotel_Invoice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int checkOut = 0;
            if (Request.QueryString["CheckOut_ID"] != null)
            {
                checkOut = Convert.ToInt32(Request.QueryString["CheckOut_ID"]);
            }
            BindCheckOut(checkOut);
        }
    }

    private void BindCheckOut(int checkOutId)
    {
        CheckOut checkOut = new CheckOut();
        checkOut.CheckOut_ID = checkOutId;
        checkOut.SelectOne();
        try
        {

            CheckIn checkin = new CheckIn();
            checkin.CheckIn_ID = checkOut.CheckIn_ID;
            checkin.SelectOne();
            Bookings booking = new Bookings();
            booking.Booking_ID = checkin.Booking_ID;
            booking.SelectOne();
            AvailedBillServices availedBillServices = new AvailedBillServices();
            //availedBillServices.

            DateTime from = DateTime.Parse(checkin.CheckIn_Date.ToString());
            DateTime to = DateTime.Parse(checkOut.CheckOut_Date.ToString());
            lblCheckIn.Text = from.ToString("MM/dd/yyyy");
            lblCheckOut.Text = to.ToString("MM/dd/yyyy");
            double numberDays = to.Subtract(from).TotalDays + 1;
            numberDays= Math.Round(numberDays,0);
            lblDaysStayed.Text = numberDays.ToString();
          //  lblBoardingCost.Text = "KWD. " + checkOut.TotalBoarding_Amount.ToString();
           // lblTotalInvoice.Text = "KWD. " + checkOut.Additional_Invoice_Amount.ToString();
           // lblPaidAmount.Text = "KWD. " + checkOut.Paid_Amount.ToString();
           // lblSettlementAmount.Text = "KWD. " + checkOut.Settlement_Amount.ToString();
        }
        catch (Exception ex)
        {

        }

    }
    protected void btnPrintInvoice_Click(object sender, EventArgs e)
    {
        int checkOut = 0;
        if (Request.QueryString["CheckOut_ID"] != null)
        {
            checkOut = Convert.ToInt32(Request.QueryString["CheckOut_ID"]);
        }
        DataTable table = new DataTable();
        CheckOut checkout = new CheckOut();
        table = checkout.GetInvoiceByCheckOutID(checkOut.ToString());
        Session["tableRpt"] = table;
        Response.Redirect("rpt.aspx");
       
    }
}