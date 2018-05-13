using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;

using System.Data;
using System.Data.SqlTypes;

public partial class Hotel_BookRooms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            BindRoomTypes();
            BindRooms();
            BindPaymentModes();
            BindGuests();
            BindPaymentModes();
            BindBookingStatuses();
            BindEmployeeDiscount();
            int bookingId = 0;
            Session.Remove("Prop_Action");
            if (Request.QueryString["Booking_ID"] != null)
            {
                bookingId = Request.Params["Booking_ID"] != null || Request.Params["Booking_ID"] != "" ? Int32.Parse(Request.Params["Booking_ID"].ToString()) : 0;
                Session["Prop_Action"] = "U";
            }
            if (Session["Prop_Action"] == "U")
                BindBooking(bookingId);

            int roomId = 0;
            if (Request.Params["Room_ID"] != null)
            {
                roomId = (Request.Params["Room_ID"] != null || Request.Params["Room_ID"] != "") ? Int32.Parse(Request.Params["Room_ID"]) : 0;
                Session["Prop_Action"] = "R";
            }
            if (Session["Prop_Action"] == "R")
                BindDefaults();

        }
        
    }

    private void BindDefaults()
    {
        int roomId = 0;
        int roomTypeId = 0;
        
        string fromDate = string.Empty;
        string toDate = string.Empty;
        try
        {
            roomId = (Request.Params["Room_ID"] != null || Request.Params["Room_ID"] != "") ? Int32.Parse(Request.Params["Room_ID"]) : 0;
            roomTypeId = (Request.Params["RoomType_ID"] != null || Request.Params["RoomType_ID"] != "") ? Int32.Parse(Request.Params["RoomType_ID"]) : 0;
            fromDate = (Request.Params["FromDate"] != null || Request.Params["FromDate"] != "") ? Request.Params["FromDate"] : string.Empty;
            toDate = (Request.Params["ToDate"] != null || Request.Params["ToDate"] != "") ? Request.Params["ToDate"] : string.Empty;
        }
        catch (Exception e) { }
        if (fromDate != string.Empty) { 
            hidFromDate.Value = DateTime.Parse(fromDate).ToString("MM/dd/yyyy");
            txtFromDate.Text = DateTime.Parse(fromDate).ToString("MM/dd/yyyy");
        }
        if (toDate != string.Empty)
        {
            hidToDate.Value = DateTime.Parse(toDate).ToString("MM/dd/yyyy"); ;
            txtToDate.Text = DateTime.Parse(toDate).ToString("MM/dd/yyyy");
        }
        if (roomTypeId != 0)
        {
            hidRoomTypeId.Value = roomTypeId.ToString();
            drpRoomTypesList.Items.FindByValue(roomTypeId.ToString()).Selected = true;
            //drpRoomTypesList.Enabled = false;
        }
        if (roomId != 0)
        {
            hidRoomId.Value = roomId.ToString();
            drpRoomsList.Items.FindByValue(roomId.ToString()).Selected = true;
            //drpRoomsList.Enabled = false;
            BindRoom(roomId);
            CalculateTotalAmount();

        }
        lblSalesPerson.InnerText = "1";
    }

    private void BindBooking(int bookingId)
    {
        hidBookingID.Value = bookingId.ToString();
        Bookings booking = new Bookings();
        booking.Booking_ID = SqlInt32.Parse(bookingId.ToString());
        booking.SelectOne();
        drpGuests.Items.FindByValue(booking.Guest_ID.ToString());
        hidFromDate.Value = DateTime.Parse(booking.FromDate.ToString()).ToString("MM/dd/yyyy"); 
        txtFromDate.Text = DateTime.Parse(booking.FromDate.ToString()).ToString("MM/dd/yyyy");
        hidToDate.Value = DateTime.Parse(booking.ToDate.ToString()).ToString("MM/dd/yyyy");
        txtToDate.Text = DateTime.Parse(booking.ToDate.ToString()).ToString("MM/dd/yyyy");
        lblNumDays.Text = (DateTime.Parse(booking.ToDate.ToString()).Subtract(DateTime.Parse(booking.FromDate.ToString())).TotalDays + 1).ToString();
        hidRoomTypeId.Value = booking.RoomType_ID.ToString();
        drpRoomTypesList.Items.FindByValue(booking.RoomType_ID.ToString()).Selected = true;
        hidRoomId.Value = booking.Room_ID.ToString();
        drpRoomsList.Items.FindByValue(booking.Room_ID.ToString()).Selected = true;
        lblSalesPerson.InnerText = booking.Booking_Personnel.ToString();
        BindRateByRoomType(booking.RoomType_ID);
        drpRatesApplicable.ClearSelection();
        drpRatesApplicable.Items.FindByValue(booking.Rate_ID.ToString()).Selected = true;
        txtDiscountOffered.Text = ((booking.DiscountOffered.ToString() == null || booking.DiscountOffered.ToString() == string.Empty) && booking.DiscountOffered.ToString() == "") ? "0" : booking.DiscountOffered.ToString();
        txtPaidAmount.Text = booking.Amount_Paid.ToString();
        hidPaidAmount.Value = booking.Amount_Paid.ToString();
        lblTotalAmount.Text = booking.Cost_After_Discount.ToString();
        drpPaymentModes.Items.FindByValue(booking.PaymentMode.ToString()).Selected = true;
        drpBookingStatus.Items.FindByValue(booking.BookingStatus.ToString()).Selected = true;
        
        //BindEmployeeDiscount();

    }

    private void BindRoom(int roomId)
    {
        Rooms room = new Rooms();
        room.Room_ID = roomId;
        room.SelectOne();
        BindRateByRoomType(room.RoomType_ID);
        //BindEmployeeDiscount();
        
    }

    private void BindRateByRoomType(SqlInt32 roomTypeId){
        Rate_To_RoomType rateToRmType = new Rate_To_RoomType();
        rateToRmType.RoomType_ID = roomTypeId;
        DataTable table = rateToRmType.SelectRatesByRoomTypeID();
        drpRatesApplicable.DataSource = table;
        drpRatesApplicable.DataTextField = table.Columns["RateDescription_EN"].ToString();
        drpRatesApplicable.DataValueField = table.Columns["Rate_ID"].ToString();
        drpRatesApplicable.DataBind();
        if (drpRatesApplicable.Items.Count > 0)
        {
            var results = (from m in table.AsEnumerable()
                           where m.Field<int>("Rate_ID") == Int32.Parse(drpRatesApplicable.Items[0].Value) //&& m.Field<int>("Rate_ID") == rateId
                           select m);
            lblRate.Text = results.ElementAt(0)["Rate"].ToString();
        }
        //CalculateTotalAmount();
    }
    /*
    private void BindDiscountByEmployee(int rateId)
    {
        DataTable table = new DiscountsOffered().SelectAll();
        SqlMoney discount = new SqlMoney();
        discount = 0;
        var results = (from m in table.AsEnumerable()
                       where m.Field<int>("Employee_ID") == 1 //&& m.Field<int>("Rate_ID") == rateId
                       select m);
        foreach (var result in results)
        {
            discount = SqlMoney.Parse(result["Allowed_Discount"].ToString());
            if (result["Rate_ID"].ToString().Equals(rateId.ToString()))
            {
                discount = SqlMoney.Parse(result["Allowed_Discount"].ToString());
                break;
            }
        }
        lblSalesPersonDiscount.InnerText = discount.ToString();
        lblTotalAmount.Text = (SqlMoney.Parse(lblRate.Text) - SqlMoney.Parse(lblSalesPersonDiscount.InnerText)).ToString();
          
    }*/
    private void BindEmployeeDiscount()
    {
        hidEmployeeDiscount.Value = "0";
        hidEmployeeDiscountUnit.Value = "0";
        EmployeeDiscounts discount = new EmployeeDiscounts();
        discount.EmployeeID = 1;
        DataTable table = discount.SelectOneByEmployeeID();
        if(table.Rows.Count > 0)
        {
            hidEmployeeDiscount.Value = ((discount.Discount.ToString() != null || discount.Discount.ToString() != string.Empty) && discount.Discount.ToString() !="") ? discount.Discount.ToString() : "0";
            hidEmployeeDiscountUnit.Value = ((discount.UnitOfDiscount.ToString() != null || discount.UnitOfDiscount.ToString() != string.Empty) && discount.UnitOfDiscount.ToString() != "") ? discount.UnitOfDiscount.ToString() : "0"; 
        }
    }

    private void BindGuests()
    {
        DataTable table = new Guests().SelectAll();
        drpGuests.DataSource = table;
        drpGuests.DataTextField = table.Columns["FirstName"].ToString();
        drpGuests.DataValueField = table.Columns["Guest_ID"].ToString();
        drpGuests.DataBind();
    }

    private void BindRoomTypes()
    {
        DataTable table = new RoomTypes().SelectAll();
        drpRoomTypesList.DataSource = table;
        drpRoomTypesList.DataTextField = table.Columns["RoomType_EN"].ToString();
        drpRoomTypesList.DataValueField = table.Columns["RoomType_ID"].ToString();
        drpRoomTypesList.DataBind();
    }

    private void BindRooms()
    {
        DataTable table = new Rooms().SelectAll();
        drpRoomsList.DataSource = table;
        drpRoomsList.DataTextField = table.Columns["RoomName_EN"].ToString();
        drpRoomsList.DataValueField = table.Columns["Room_ID"].ToString();
        drpRoomsList.DataBind();
    }

    private void BindBookingStatuses()
    {
        DataTable table = new BookingStatuses().SelectAll();
        drpBookingStatus.DataSource = table;
        drpBookingStatus.DataTextField = table.Columns["BookingStatus_EN"].ToString();
        drpBookingStatus.DataValueField = table.Columns["BookingStatus_ID"].ToString();
        drpBookingStatus.DataBind();
    }


    private void BindPaymentModes()
    {
        DataTable table = new PaymentModes().SelectAll();
        drpPaymentModes.DataSource = table;
        drpPaymentModes.DataTextField = table.Columns["PaymentMode"].ToString();
        drpPaymentModes.DataValueField = table.Columns["PaymentMode_ID"].ToString();
        drpPaymentModes.DataBind();
        
    }


    protected void btnSaveBooking_Click(object sender, EventArgs e)
    {
        if (!CalculateTotalAmount())
            return;

        SqlMoney paidAmount = new SqlMoney(0.00);
        if (txtPaidAmount.Text != null && txtPaidAmount.Text != "" && txtPaidAmount.Text != string.Empty)
            paidAmount = SqlMoney.Parse(txtPaidAmount.Text);
        SqlMoney totalAmount = SqlMoney.Parse(lblTotalAmount.Text);

        SqlMoney alreadyPaid = new SqlMoney(0.00);
        if (hidPaidAmount.Value != null && hidPaidAmount.Value != "" && hidPaidAmount.Value != string.Empty)
            alreadyPaid = SqlMoney.Parse(hidPaidAmount.Value);

        if (paidAmount < alreadyPaid)
        {
            lblStatus.Text = "Payment Amount must be less than Paid amount";
            DisplayHidden();
            return;
        }

        if (paidAmount > totalAmount)
        {
            lblStatus.Text = "Payment Amount must be less than or equal to total amount";
            DisplayHidden();
            return;
        }

        Bookings booking = new Bookings();
        booking.Booking_Personnel = 1;
        booking.BookingStatus = SqlInt32.Parse(drpBookingStatus.SelectedValue);
        
        DateTime fromDate = DateTime.Parse(hidFromDate.Value);
        DateTime toDate = DateTime.Parse(hidToDate.Value);
        
        if (booking.BookingStatus!=BookingStatus.CANCELLED)
        {
            if (fromDate.Date < DateTime.Now.Date)
            {
                lblStatus.Text = "From date is before today!!!";
                return;
            }
            if (fromDate.Date > toDate.Date)
            {
                lblStatus.Text = "From date is after To Date!!!";
                return;
            }
        }
        booking.RoomType_ID = SqlInt32.Parse(hidRoomTypeId.Value);
        booking.Room_ID = SqlInt32.Parse(hidRoomId.Value);
        booking.LastModifiedDate = SqlDateTime.Parse(DateTime.Now.ToString());
        booking.LastModifiedUser = SqlInt32.Parse(lblSalesPerson.InnerText);
        
        booking.BookingDate = SqlDateTime.Parse(DateTime.Now.ToString());
        booking.FromDate = SqlDateTime.Parse(fromDate.ToString());
        booking.ToDate = SqlDateTime.Parse(toDate.ToString());
        booking.Rate_ID = SqlInt32.Parse(drpRatesApplicable.SelectedValue);
        booking.Rate = SqlMoney.Parse(lblRate.Text);
        booking.Discount = hidEmployeeDiscount.Value == string.Empty ? 0 : SqlMoney.Parse(hidEmployeeDiscount.Value);
        booking.DiscountOffered = ((hidTotalDiscount.Value != null || hidTotalDiscount.Value != string.Empty) && hidTotalDiscount.Value != "") ? SqlMoney.Parse(hidTotalDiscount.Value) : 0;
        booking.Cost_After_Discount = SqlMoney.Parse(lblTotalAmount.Text);
        
        booking.Amount_Paid = paidAmount;
       
      

        booking.Amount_PendingPayment = (totalAmount - paidAmount);
        
        if (booking.Amount_Paid == booking.Cost_After_Discount)
            booking.PaymentStatus = PaymentStatus.FULLY_PAID;
        else
            booking.PaymentStatus = PaymentStatus.PARTIAL_PAID;

        booking.PaymentMode = SqlInt32.Parse(drpPaymentModes.SelectedValue);
        if (Session["Prop_Action"] == "U")
        {
            booking.Booking_ID = int.Parse(hidBookingID.Value);
            bool retval = booking.Update();
            if (retval)
                lblStatus.Text = "Successfully Updated!!";
        }else
        {
            if(booking.BookingStatus.Equals(BookingStatus.CANCELLED) || booking.BookingStatus.Equals(BookingStatus.CHECKED_IN) || booking.BookingStatus.Equals(BookingStatus.CHECKED_OUT))
            {
                lblStatus.Text = "Invalid Booking Status !!";
                return;
            }
            
            booking.Guest_ID = SqlInt32.Parse(drpGuests.SelectedValue);
            booking.Booking_Personnel = SqlInt32.Parse(lblSalesPerson.InnerText);
            bool retval = booking.Insert();
            if (retval)
                lblStatus.Text = "Successfully Booked!!!";
        }
        Response.Redirect("BookingsList.aspx", true);
    }
    


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Reservation.aspx", true);
    }
    protected void txtDiscountOffered_TextChanged(object sender, EventArgs e)
    {
        DisplayHidden();
        CalculateTotalAmount();

    }
    protected void drpRatesApplicable_SelectedIndexChanged(object sender, EventArgs e)
    {
        Rates rates = new Rates();
        rates.Rate_ID = SqlInt32.Parse(drpRatesApplicable.SelectedValue);
        rates.SelectOne();
        lblRate.Text = rates.Rate.ToString();
        lblTotalAmount.Text = string.Empty;
        DisplayHidden();
        CalculateTotalAmount();
    }

    private void DisplayHidden()
    {
        txtFromDate.Text = hidFromDate.Value;
        txtToDate.Text = hidToDate.Value;
        drpRoomTypesList.Items.FindByValue(hidRoomTypeId.Value).Selected = true;
        drpRoomsList.Items.FindByValue(hidRoomId.Value).Selected = true;
    }

    private bool CalculateTotalAmount()
    {
        bool retVal = false;

        double totalAmount = 0;
        double numberOfDays = 1;
        DateTime fromDate = new DateTime();
        DateTime toDate = new DateTime();
        if ((hidFromDate.Value != null || hidFromDate.Value != string.Empty) && hidFromDate.Value !="")
        {
            fromDate = DateTime.Parse(hidFromDate.Value).Date;
        }
        if ((hidToDate.Value != null || hidToDate.Value != string.Empty) && hidToDate.Value !="")
        {
            toDate = DateTime.Parse(hidToDate.Value).Date;
        }
        numberOfDays = toDate.Subtract(fromDate.Date).TotalDays + 1;
        lblNumDays.Text = numberOfDays.ToString();
        double rate = 0;
        if ((lblRate.Text != null || lblRate.Text != string.Empty) && lblRate.Text != "")
        {
            rate = Double.Parse(lblRate.Text);
            totalAmount = rate * numberOfDays;
        }
        double salesManDiscount = ((hidEmployeeDiscount.Value == null || hidEmployeeDiscount.Value == string.Empty) && (hidEmployeeDiscount.Value == "")) ? 0 : Double.Parse(hidEmployeeDiscount.Value);
        if (hidEmployeeDiscountUnit.Value == "2")
            salesManDiscount = (salesManDiscount / 100) * totalAmount;

        double discountOfferedPercentage = 0;
        double tempDiscount = 0;
        double totalDiscount= 0;
        if ((txtDiscountOfferedPercent.Text != null || txtDiscountOfferedPercent.Text != string.Empty) && txtDiscountOfferedPercent.Text != "")
        {
            discountOfferedPercentage = Double.Parse(txtDiscountOfferedPercent.Text);
            tempDiscount = ((discountOfferedPercentage / 100) * totalAmount);
            if (tempDiscount  > salesManDiscount)
            {
                lblStatus.Text = "Discount Offered is greater than allowed limit for the Salesman!!";
                retVal = false;
                return retVal;
            }
            else
            {
                totalDiscount = totalDiscount + tempDiscount;
                lblStatus.Text = "";
                totalAmount = totalAmount - ((discountOfferedPercentage / 100) * totalAmount);
                retVal = true;
            }
        }
       
        double discountOffered = 0;
        if ((txtDiscountOffered.Text != null || txtDiscountOffered.Text != string.Empty) && txtDiscountOffered.Text !=""){
            discountOffered = Double.Parse(txtDiscountOffered.Text);
            if (discountOffered > salesManDiscount)
            {
                lblStatus.Text = "Discount Offered is greater than allowed limit for the Salesman!!";
                retVal = false;
                return retVal;
            }
            else
            {
                totalDiscount = totalDiscount + discountOffered;
                lblStatus.Text = "";
                totalAmount = totalAmount - discountOffered;
                retVal = true;
            }
        }

        if (totalDiscount > salesManDiscount)
        {
            lblStatus.Text = "Discount Offered is greater than allowed limit for the Salesman!!";
            retVal = false;
            return retVal;
        }
        else
        {
            hidTotalDiscount.Value = totalDiscount.ToString();
            lblStatus.Text = "";
            lblTotalAmount.Text = Math.Round(totalAmount,3).ToString();
            retVal = true;
        }
        return retVal;
    }
    protected void txtPaidAmount_TextChanged(object sender, EventArgs e)
    {
        SqlMoney paidAmount = new SqlMoney(0.00);
        if (txtPaidAmount.Text != null && txtPaidAmount.Text != "" && txtPaidAmount.Text != string.Empty)
            paidAmount = SqlMoney.Parse(txtPaidAmount.Text);
        SqlMoney totalAmount = SqlMoney.Parse(lblTotalAmount.Text);
        SqlMoney alreadyPaid = new SqlMoney(0.00);
        if (hidPaidAmount.Value != null && hidPaidAmount.Value != "" && hidPaidAmount.Value != string.Empty)
            alreadyPaid = SqlMoney.Parse(hidPaidAmount.Value);

        if (paidAmount < alreadyPaid)
        {
            lblStatus.Text = "Payment Amount must be less than Paid amount";
        }
        if (paidAmount > totalAmount)
            lblStatus.Text = "Payment Amount must be less than or equal to total amount";
        DisplayHidden();
    }
}