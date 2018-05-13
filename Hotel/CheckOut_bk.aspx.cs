using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Data.SqlTypes;

public partial class Hotel_CheckOut_bk : System.Web.UI.Page
{
    private double totalBills,totalAmenities;
    protected void Page_Load(object sender, EventArgs e)
    {
        totalAmenities = 0;
        totalBills = 0;
        if (!Page.IsPostBack)
        {
            BindCheckIns();
            BindPaymenModes();
            int checkInID = 0;
            Session.Remove("Prop_Action");
            if (Request.QueryString["CheckIn_ID"] != null)
            {
                checkInID = Request.Params["CheckIn_ID"] != null || Request.Params["CheckIn_ID"] != "" ? Int32.Parse(Request.Params["CheckIn_ID"].ToString()) : 0;
                BindCheckIn(checkInID);
                Session["Prop_Action"] = "U";
               

            }
            BindAvailedBillService(checkInID);
            BindAvailedAmenities(checkInID);
            if (Session["Prop_Action"] == "U")
                BindCheckIn(checkInID);

           
        }
    }

    private void BindCheckIns()
    {
        DataTable table = new CheckIn().SelectAll_Active();
        drpCheckIns.DataSource = table;
        drpCheckIns.DataTextField = table.Columns["RoomNumber"].ToString();
        drpCheckIns.DataValueField = table.Columns["CheckIn_ID"].ToString();
        drpCheckIns.DataBind();
        
    }
    private void BindPaymenModes()
    {
        drpPaymentModes.ClearSelection();
        DataTable table = new PaymentModes().SelectAll();
        drpPaymentModes.DataSource = table;
        drpPaymentModes.DataTextField = table.Columns["PaymentMode"].ToString();
        drpPaymentModes.DataValueField = table.Columns["PaymentMode_ID"].ToString();
        drpPaymentModes.DataBind();

    }
    private void BindAvailedBillService(int checkInID)
    {
       
        AvailedBillServices bill = new AvailedBillServices();
        bill.CheckIn_ID = checkInID;
        DataTable table = new DataTable();
        table = bill.SelectByCheckInID();

        if(table.Rows.Count>0)
        { 
            foreach(DataRow row in table.Rows)
            {
                totalBills += double.Parse(row["TotalCost"].ToString());
            }
            hidTotBills.Value = totalBills.ToString();
            gridB.DataSource = table;
            gridB.DataBind();
        }
        else
        {
            gridB.DataSource = table;
            gridB.DataBind();
        }
    }
    private void BindAvailedAmenities(int checkInID)
    {

        DataTable table = new DataTable();

        AvailedAmenities aminity = new AvailedAmenities();
        aminity.CheckIn_ID = checkInID;
        table = aminity.SelectByCheckInID();
        if (table.Rows.Count > 0)
        {
            foreach (DataRow row in table.Rows)
            {
                totalAmenities += double.Parse(row["TotalCost"].ToString());
            }
            hidTotAmenities.Value = totalAmenities.ToString();
            gridA.DataSource = table;
            gridA.DataBind();
        }
        else
        {
            gridA.DataSource = table;
            gridA.DataBind();
        }
    }
    private void BindCheckIn(int checkInID)
    {
        CheckIn checkIn = new CheckIn();
        checkIn.CheckIn_ID = checkInID;
        checkIn.SelectOne();
        drpCheckIns.ClearSelection();
        drpCheckIns.Items.FindByValue(checkInID.ToString()).Selected = true;
        performCalculations(checkIn);
    }

    private void performCalculations(CheckIn checkIn)
    {
        
        DateTime checkInDate = DateTime.Parse(checkIn.CheckIn_Date.ToString());
        DateTime checkOutDate = DateTime.Now;
        //double timeSpan = (checkOutDate - checkInDate).TotalHours;
        int numberOfDaysStayed = CalculateNumberOfDaysStayed(checkInDate,checkOutDate);
        if (txtCheckOutDate.Text != string.Empty)
            checkOutDate = DateTime.Parse(txtCheckOutDate.Text);
        lblCheckInDate.Text = checkInDate.ToShortDateString();
        txtCheckOutDate.Text = checkOutDate.ToString();
        lblNumStayDays.Text = numberOfDaysStayed.ToString();
        Bookings booking = new Bookings();
        booking.Booking_ID = checkIn.Booking_ID;
        booking.SelectOne();
        DateTime bookingFromDate = DateTime.Parse(booking.FromDate.ToString());
        DateTime bookingToDate = DateTime.Parse(booking.ToDate.ToString());
        int numberOfDaysBooked = Int32.Parse((bookingToDate.Date.Subtract(bookingFromDate.Date).TotalDays + 1).ToString());
        lblNumBookedDays.Text = numberOfDaysBooked.ToString();
        double costIncurred = 0;
        if (numberOfDaysBooked < numberOfDaysStayed)
            costIncurred = booking.Cost_After_Discount.ToDouble() - booking.Amount_Paid.ToDouble();

        costIncurred = costIncurred + (booking.Rate.ToDouble() * numberOfDaysStayed);
        lblCostOfStay.Text = costIncurred.ToString();
        lblPaidAmount.Text = booking.Amount_Paid.ToString();
        lblOutstandingBoardingPayment.Text = (costIncurred - booking.Amount_Paid.ToDouble()).ToString();
        calculateTotalOutstandingAmounts();
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Occupancy.aspx", true);
    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        /*
        CheckOut checkOut = new CheckOut();
        checkOut.CheckIn_ID = SqlInt32.Parse(drpCheckIns.SelectedValue);
        checkOut.CheckOut_Date = SqlDateTime.Parse(txtCheckOutDate.Text);
        checkOut.Number_Of_DaysStayed = SqlInt32.Parse(lblNumStayDays.Text);
        checkOut.TotalBoarding_Amount = (lblCostOfStay.Text != null || lblCostOfStay.Text != string.Empty) ? SqlMoney.Parse(lblCostOfStay.Text) : 0;
        //checkOut.TotalFacilitiesAvailed_Amount = ((txtCostAdditionalFacilitiesAvailed.Text != null || txtCostAdditionalFacilitiesAvailed.Text != string.Empty) && txtCostAdditionalFacilitiesAvailed.Text != "")  ? SqlMoney.Parse(txtCostAdditionalFacilitiesAvailed.Text) : 0;
        checkOut.Settlement_Amount = ((txtTotaOutstandingAmount.Text != null || txtTotaOutstandingAmount.Text != string.Empty) && txtTotaOutstandingAmount.Text != "") ? SqlMoney.Parse(txtTotaOutstandingAmount.Text) : 0;
        checkOut.Additional_Invoice_Amount = ((txtTotalInvoiceAmount.Text != null || txtTotalInvoiceAmount.Text != string.Empty) && txtTotalInvoiceAmount.Text != "") ? SqlMoney.Parse(txtTotalInvoiceAmount.Text) : 0;
        checkOut.Paid_Amount = ((lblPaidAmount.Text != null || lblPaidAmount.Text != string.Empty) &&lblPaidAmount.Text != "")  ? SqlMoney.Parse(lblPaidAmount.Text) : 0;
        checkOut.Outstanding_Amount = ((txtTotaOutstandingAmount.Text != null || txtTotaOutstandingAmount.Text != string.Empty) && txtTotaOutstandingAmount.Text != "" ) ? SqlMoney.Parse(txtTotaOutstandingAmount.Text) : 0;
        checkOut.Settlement_Amount = checkOut.Outstanding_Amount;
        checkOut.PaymentMode_ID = SqlInt32.Parse(drpPaymentModes.SelectedValue);
        if (checkOut.Insert())
        {
           
            CheckIn checkIn = new CheckIn();
            checkIn.CheckIn_ID = checkOut.CheckIn_ID;
            checkIn.SelectOne();
            checkIn.CheckOut_Date = checkOut.CheckOut_Date;
            checkIn.LastModifiedDate = DateTime.Now;
            checkIn.LastModifiedUser = 1;
            checkIn.Update();
            Bookings booking = new Bookings();
            booking.Booking_ID = checkIn.Booking_ID;
            booking.SelectOne();
            booking.BookingStatus = BookingStatus.CHECKED_OUT;
            btnCheckOut.Enabled = false;
            Rooms room = new Rooms();
            
            room.Room_ID = checkIn.Room_ID;
            room.Is_Out_Of_Order = 0;
            room.RoomStatus_ID = RoomStatus.DIRTY;
            room.LastModifiedDate = DateTime.Now;
            room.LastModifiedUser = 1;
            room.UpdateStatus();
            Response.Redirect("Invoice.aspx?CheckOut_ID=" + checkOut.CheckOut_ID, true);
        }
        else
        {
            lblStatus.Text = "Error !!! Couldn't Check Out.";
        }
        */


    }
    protected void txtCheckOutDate_TextChanged(object sender, EventArgs e)
    {
        DateTime checkInDate = DateTime.Parse(lblCheckInDate.Text);
        DateTime checkOutDate = DateTime.Parse(txtCheckOutDate.Text);
        int numberOfDaysStayed = CalculateNumberOfDaysStayed(checkOutDate, checkInDate);

    }
    protected void txtCostAdditionalFacilitiesAvailed_TextChanged(object sender, EventArgs e)
    {
        calculateTotalOutstandingAmounts();
    }

    private void calculateTotalOutstandingAmounts()
    {
        Double totalOutstandingPayment = (lblOutstandingBoardingPayment.Text != null || lblOutstandingBoardingPayment.Text != string.Empty) ? Double.Parse(lblOutstandingBoardingPayment.Text) : 0;
        Double totalInvoiceAmount = (lblCostOfStay.Text != null || lblCostOfStay.Text != string.Empty) ? Double.Parse(lblCostOfStay.Text) : 0;
       
        txtTotaOutstandingAmount.Text = totalOutstandingPayment.ToString();
        txtTotalInvoiceAmount.Text = totalInvoiceAmount.ToString();

        if(totalBills!=0 || totalAmenities != 0)
        {
            txtTotaOutstandingAmount.Text = (double.Parse(txtTotaOutstandingAmount.Text) + totalBills+totalAmenities).ToString();
            txtTotalInvoiceAmount.Text = (double.Parse(txtTotalInvoiceAmount.Text) + totalBills + totalAmenities).ToString();
        }
    }

    private int CalculateNumberOfDaysStayed(DateTime from, DateTime to)
    {
        double numberOfDaysStayed = to.Date.Subtract(from.Date).TotalDays;
        int i = from.Date.CompareTo(to.Date);
        TimeSpan tFrom = from.TimeOfDay;
        TimeSpan tTo = to.TimeOfDay;
        int fromTimeCmp = tFrom.CompareTo(new TimeSpan(13, 59, 0));
        int toTimeCmp = tTo.CompareTo(new TimeSpan(11, 59, 0));
        switch(i)
        {
            case 0:
                numberOfDaysStayed += 1;
                if (fromTimeCmp <= 0 && toTimeCmp > 0)
                    numberOfDaysStayed += 1;
                break;
            case -1:
                if (fromTimeCmp < 0)
                    numberOfDaysStayed += 1;
                if (toTimeCmp > 0)
                    numberOfDaysStayed += 1;
                break;
        }

       
        //numberOfDaysStayed = ((numberOfDaysStayed % 8) > 0) ? (numberOfDaysStayed + 1) : numberOfDaysStayed;
        int numDays = Int32.Parse(Math.Round(numberOfDaysStayed, 0).ToString());
        return numDays;

        /*
        CheckIn_CheckOut_Time chkIn_ChkOut = new CheckIn_CheckOut_Time();
        DataTable table = chkIn_ChkOut.SelectAll();
        TimeSpan chkIn = TimeSpan.Parse(table.Rows[0]["CheckIn_Time"].ToString());
        TimeSpan chkInHoursDifference = DateTime.Parse(chkIn.ToString()).Subtract(from);
        Int32 hoursInDifference = chkInHoursDifference.Hours;
        

        TimeSpan chkOut = TimeSpan.Parse(table.Rows[0]["CheckOut_Time"].ToString());
        TimeSpan chkOutHoursDifference = to.Date.Subtract(DateTime.Parse(chkOut.ToString()));
        int hoursOutDifference = chkOutHoursDifference.Hours;

        TimeSpan daysDifference = to.Subtract(from);
        int numberOfDays = daysDifference.Days;

        double numberOfDaysStayed = (from.Date - to.Date).TotalDays;
        return numberOfDaysStayed;
         * */
    }

    protected void drpCheckIns_SelectedIndexChanged(object sender, EventArgs e)
    {
        int checkInID = Int32.Parse(drpCheckIns.SelectedValue);
        Response.Redirect("CheckOut.aspx?CheckIn_ID=" + checkInID, true);
    }
}