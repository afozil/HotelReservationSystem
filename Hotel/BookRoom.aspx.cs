using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlTypes;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.Services;
using HotelReservationSystemDAL;
using System.Threading;
public partial class Hotel_BookRoom : System.Web.UI.Page
{
    private DataTable availableRooms;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindRoomTypes();
            BindPaymentModes();
            BindEmployeeDiscount();
            BindGuests();
            
        }
    }

    private void BindEmployeeDiscount()
    {
        EmployeeDiscounts discount = new EmployeeDiscounts();
        discount.EmployeeID = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name); 
        DataTable table = discount.SelectOneByEmployeeID();
        if (table.Rows.Count > 0)
        {
            Double availableDiscount = (discount.Discount == SqlMoney.Null) ? 0.00 : discount.Discount.ToDouble();
            lblEmployeeDiscount.Text = "Employee Discount: " + discount.Discount.ToString();
            hidEmployeeDiscount.Value = availableDiscount.ToString();
            hidDiscountId.Value = discount.DiscountID.ToString();
            string discUnit = (discount.UnitOfDiscount != SqlInt32.Null || discount.UnitOfDiscount != 0) ? discount.UnitOfDiscount.ToString() : "2" ;
            switch(discUnit) {
                case "1":
                    lblEmployeeDiscountUnit.Text = "KD";
                    hidEmployeeDiscountUnit.Value = "1";
                    break;
            case "2" :
                    lblEmployeeDiscountUnit.Text = "%";
                    hidEmployeeDiscountUnit.Value = "2";
                    break;
                default:
                    lblEmployeeDiscountUnit.Text = "KD";
                    hidEmployeeDiscountUnit.Value = "1";
                    break;
            }
        }
    }

    private void BindRoomTypes()
    {
        DataTable table = new RoomTypes().SelectAll();
        drpRoomTypes.DataSource = table;
        drpRoomTypes.DataTextField = table.Columns["RoomType_EN"].ToString();
        drpRoomTypes.DataValueField = table.Columns["RoomType_ID"].ToString();
        drpRoomTypes.DataBind();
        drpRoomTypes.Items.Insert(0, new ListItem("Select a Room Type...", "-1"));
    }

    private void BindPaymentModes()
    {
        DataTable table = new PaymentModes().SelectAll();
        drpPaymentModes.DataSource = table;
        drpPaymentModes.DataTextField = table.Columns["PaymentMode"].ToString();
        drpPaymentModes.DataValueField = table.Columns["PaymentMode_ID"].ToString();
        drpPaymentModes.DataBind();
        drpPaymentModes.Items.Insert(0, new ListItem("Select a Payment Mode...", "-1"));
    }

    private void BindGuests()
    {
        DataTable table = new Guests().SelectAll();
        drpGuests.DataSource = table;
        drpGuests.DataTextField = table.Columns["FirstName"].ToString();
        drpGuests.DataValueField = table.Columns["Guest_ID"].ToString();
        drpGuests.DataBind();
        drpGuests.Items.Insert(0, new ListItem("Select a Guest...", "-1"));
    }

    protected void btnChkReservation_Click(object sender, EventArgs e)
    {
        lblMsg.Text = string.Empty;
        DateTime fromDate = DateTime.Parse(txtFromDate.Text);
        DateTime toDate = DateTime.Parse(txtToDate.Text);
        
        if (txtFromDate.Text.Trim() == "" || txtToDate.Text.Trim() == "")
        {
            lblMsg.Text = "From & To dates cannot be empty";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        if (fromDate < DateTime.Now.Date)
        {
            lblMsg.Text = "Booking date cannot be before today";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        if (fromDate > toDate)
        {
            lblMsg.Text = "Check-In date seems to be after Check-Out date";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        if (drpRoomTypes.SelectedValue == "-1")
        {
            lblMsg.Text = "Please select a Room Type";
            lblMsg.ForeColor = Color.Red;
            return;
        }
       if(isRoomAvailable()){
            BindAvailableRateTypes();
            lblBookingDays.Text = "Number of days: " + Utility.GetNumberOfDaysFromRange(fromDate,toDate).ToString();
            hidBookingDays.Value = Utility.GetNumberOfDaysFromRange(fromDate, toDate).ToString();
       }
    }

    private void Reset()
    {
        Response.Redirect("BookRoom.aspx", true);
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Reset();
    }

    private bool isRoomAvailable()
    {
        bool retVal= true;
        DateTime fromDate = DateTime.Parse(txtFromDate.Text);
        DateTime toDate = DateTime.Parse(txtToDate.Text);
        SqlInt32 roomType = SqlInt32.Parse(drpRoomTypes.SelectedValue);
        SqlDateTime sFromDate = Utility.GetSqlDateTimeFromDateTime(fromDate);
        SqlDateTime stoDate = Utility.GetSqlDateTimeFromDateTime(toDate);
        Bookings bookings = new Bookings();
        availableRooms = bookings.SelectAvailableRooms(sFromDate, stoDate, roomType);
        if (bookings.ErrorCode != 0)
        {
            lblMsg.Text = bookings.ErrorDesc.ToString();
            lblMsg.ForeColor = Color.Red;
            return false;
        }
        if (availableRooms.Rows.Count <= 0)
        {
            lblMsg.Text = "There are no Rooms available for the date Range";
            lblMsg.ForeColor = Color.Red;
            ClearLists();
            retVal = false;
        }
        return retVal;
    }

    private void ClearLists()
    {
        drpRateTypes.Items.Clear();
        drpRatesAvailable.Items.Clear();
        drpAvailableRooms.Items.Clear();
    }

    private void BindAvailableRateTypes()
    {
        lblMsg.Text = string.Empty;
        if (isRoomAvailable())
        {
            DataView dv = new DataView(availableRooms);
            DataTable rateTypeTable = dv.ToTable(true, "RateType_ID", "RateType");
            drpRateTypes.DataSource = rateTypeTable;
            drpRateTypes.DataTextField = "RateType";
            drpRateTypes.DataValueField = "RateType_ID";
            drpRateTypes.DataBind();
            drpRateTypes.Items.Insert(0, new ListItem("Select a Rate Type...", "-1"));
        }
    }

    private void BindAvailableRates(int selectedRateType)
    {
        lblMsg.Text = string.Empty;
        if (!isRoomAvailable())
        {
            lblMsg.Text = "No data. Please check availability again";
            lblMsg.ForeColor = Color.Red;
            return;
        }

        DateTime fromDate = DateTime.Parse(txtFromDate.Text);
        DateTime toDate = DateTime.Parse(txtToDate.Text);
        SqlInt32 roomType = SqlInt32.Parse(drpRoomTypes.SelectedValue);
        SqlDateTime sFromDate = Utility.GetSqlDateTimeFromDateTime(fromDate);
        SqlDateTime stoDate = Utility.GetSqlDateTimeFromDateTime(toDate);
        /*
        DataTable rateTable = new DataTable();
        rateTable.Columns.Add("Rate_ID");
        rateTable.Columns.Add("RateDescription_EN");
        foreach (DataRow row in availableRooms.Rows)
        {
            if(row["RateType_ID"].ToString() == selectedRateType.ToString() && 
                row["RoomType_ID"].ToString() == roomType.ToString() &&
                 Convert.ToDateTime(row["FromDate"]).Date ==  sFromDate.Value.Date &&
                 Convert.ToDateTime(row["ToDate"]).Date == stoDate.Value.Date
                )
            {
                DataRow r = rateTable.NewRow();
                r["Rate_ID"] = row["Rate_ID"];
                r["RateDescription_EN"] = row["RateDescription_EN"];
               rateTable.Rows.Add(r);
            }
        }
        */
       
        
        DataTable rateTable = null;
        try
            {
                IEnumerable<DataRow> query = (from rateTypeRow in availableRooms.AsEnumerable()
                                              where rateTypeRow.Field<Int32>("RateType_ID") == Int32.Parse(selectedRateType.ToString())
                                              /*
                                              && rateTypeRow.Field<Int32>("RoomType_ID") == Int32.Parse(roomType.ToString())
                                              && rateTypeRow.Field<DateTime>("FromDate") <= sFromDate.Value.Date && rateTypeRow.Field<DateTime>("ToDate") >= stoDate.Value.Date
                                              */
                                              select rateTypeRow);

                DataTable rateTable1 = query.CopyToDataTable();
                DataView dv = new DataView(rateTable1);
                rateTable = dv.ToTable(true, "Rate_ID", "RateDescription_EN");
            }
            catch (Exception ex){
                lblMsg.Text = "There are no Rates for this Rate Type availability again";
                lblMsg.ForeColor = Color.Red;
                return;
            }
            drpRatesAvailable.DataSource = rateTable;
            drpRatesAvailable.DataTextField = "RateDescription_EN";
            drpRatesAvailable.DataValueField = "Rate_ID";
            drpRatesAvailable.DataBind();
            drpRatesAvailable.Items.Insert(0, new ListItem("Select a Rate...", "-1"));
    }

    protected void drpRatesAvailable_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMsg.Text = string.Empty;
        if (drpRatesAvailable.SelectedValue == "-1")
        {
            lblMsg.Text = "Please select a rate";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        int selectedRate = Int32.Parse(drpRatesAvailable.SelectedValue);
        BindRateInfo(selectedRate);
        BindAvailableRooms(selectedRate);
    }

    private void BindAvailableRooms(int rateId)
    {
        if (!isRoomAvailable())
        {
            lblMsg.Text = "No data. Please check availability again";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        IEnumerable<DataRow> query = from roomRow in availableRooms.AsEnumerable()
                                      where roomRow.Field<int>("Rate_ID") == rateId
                                     select roomRow;

        DataTable roomTable = query.CopyToDataTable<DataRow>();
        drpAvailableRooms.DataSource = roomTable;
        drpAvailableRooms.DataTextField = "RoomName_EN";
        drpAvailableRooms.DataValueField = "Room_ID";
        drpAvailableRooms.DataBind();
        drpAvailableRooms.Items.Insert(0, new ListItem("Select a Room...", "-1"));
    
    }

    protected void drpAvailableRooms_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMsg.Text = string.Empty;
        if (drpAvailableRooms.SelectedValue == "-1")
        {
            lblMsg.Text = "Please select a Room";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        int selectedRoom = Int32.Parse(drpAvailableRooms.SelectedValue);
        BindRoomInfo(selectedRoom);
    }

    protected void drpRateTypes_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMsg.Text = string.Empty;
        if (drpRateTypes.SelectedValue == "-1")
        {
            lblMsg.Text = "Please select a rate type";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        int selectedRateType = Int32.Parse(drpRateTypes.SelectedValue);
        BindAvailableRates(selectedRateType);
    }

    protected void btnSaveBooking_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtFromDate.Text) || string.IsNullOrEmpty(txtToDate.Text)
            || drpRoomTypes.SelectedValue.Equals("-1")  || drpRateTypes.SelectedValue.Equals("-1")
            || drpRatesAvailable.SelectedValue.Equals("-1") || drpAvailableRooms.SelectedValue.Equals("-1")
            )
        {
            lblMsg.Text = "Please select all the Booking fields";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        if (string.IsNullOrEmpty(txtBookingAmount.Text))
        {
            lblMsg.Text = "Please calculate your booking amount";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        if(string.IsNullOrEmpty(hidNewGuestId.Value)){
            lblMsg.Text = "Please select a Guest";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        
        
        lblMsg.Text = string.Empty;
        Reservations r = new Reservations();
        r.ReservationDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Today);
        r.FromDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Parse(txtFromDate.Text));
        r.ToDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Parse(txtToDate.Text));
        r.ReservationPersonnel = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
        r.RateType=SqlInt32.Parse(drpRateTypes.SelectedValue);
        SqlInt32 rateId=SqlInt32.Parse(drpRatesAvailable.SelectedValue);
        r.Rate_ID=rateId;
        r.RoomType_ID=SqlInt32.Parse(drpRoomTypes.SelectedValue);
        r.Room_ID=SqlInt32.Parse(drpAvailableRooms.SelectedValue);
        r.Parent_Reservation_ID=0;
        r.Connected_Room_ID= 0;
        r.Guest_ID=SqlInt32.Parse(hidNewGuestId.Value);
        r.BookingStatus=BookingStatus.CONFIRMED;
        r.Remarks = string.Empty;
            Reservation_Payments pay = new Reservation_Payments();
            pay.PaymentPersonnel = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
            pay.CreatedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Today);
            pay.Discount_ID = SqlInt32.Parse(hidDiscountId.Value);
            pay.AvailedService_Type = 1; //1=Reservation;2=Bills & Services;3=Amenities
            pay.Rate_ID = rateId;
            pay.UnitsConsumed = SqlInt32.Parse(hidBookingDays.Value);
            pay.Discount_Offered=SqlMoney.Parse(hidDiscountOffered.Value);
            pay.TotalCost_Before_Discount = SqlMoney.Parse(hidTotalCost.Value);
            pay.Cost_After_Discount = SqlMoney.Parse(hidCostAfterDiscount.Value);
            pay.AmountReceived = SqlMoney.Parse(txtBookingAmount.Text);
            if (pay.AmountReceived < pay.Cost_After_Discount)
            {
                r.PaymentStatus = PaymentStatus.PARTIAL_PAID;
                r.PendingAmount = pay.Cost_After_Discount - pay.AmountReceived;
            }
            else if (pay.AmountReceived == pay.Cost_After_Discount)
                r.PaymentStatus = PaymentStatus.FULLY_PAID;
            else
            {
                lblMsg.Text = "Booking Must be Less than or Equal to Cost after Discount";
                lblMsg.ForeColor = Color.Red;
                return;
            }
            if (pay.AmountReceived != 0)
            {
                if (drpPaymentModes.SelectedValue == "-1")
                {
                    lblMsg.Text = "Please select a Payment Mode";
                    lblMsg.ForeColor = Color.Red;
                    return;
                }
                else pay.PaymentMode = SqlInt32.Parse(drpPaymentModes.SelectedValue);
            }
            pay.Remarks=r.Remarks;
            pay.PaymentStatus = 1;//Active
            
            if (r.Insert())
            {
                pay.Reservation_ID = r.Reservation_ID;
                if (pay.Insert())
                {

                    // DataTable resevePay = pay.GetReservationPayment();
                    //Session["resevePay"] = resevePay;

                    //string popupScript = "<script language='javascript'>" +
                    //               "window.open('ReservConfirm.aspx','ThisPopUp', " +
                    //               "'left = 300, top=150,  " +
                    //               "menubar=no, scrollbars=yes, resizable=yes')" +
                    //               "</script>";
                    //Page.ClientScript.RegisterStartupScript(GetType(), "PopupScript", popupScript);
                  
                    Response.Redirect("Reservation.aspx?Reservation_ID=" + r.Reservation_ID.ToString(), true);
                }
                else
                {
                    lblMsg.Text = "Reservation was saved. However, there was a problem in saving the Payment";
                    lblMsg.ForeColor = Color.Red;
                    return;
                }
            }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Reset();
    }

    protected void btnCalculateBookingAmount_Click(object sender, EventArgs e)
    {
        lblMsg.Text = string.Empty;
        if (drpRatesAvailable.SelectedValue == "-1")
        {
            lblMsg.Text = "Please select a rate";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        if(string.IsNullOrEmpty(hidRate.Value))
        {
            lblMsg.Text = "Please Select a Rate";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        BindPaymentInfo();
    }

    private void BindRateInfo(int selectedRate)
    {
        if (!isRoomAvailable())
        {
            lblMsg.Text = "No data. Please check availability again";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        IEnumerable<DataRow> query = from rateRow in availableRooms.AsEnumerable()
                                     where rateRow.Field<int>("Rate_ID") == selectedRate
                                     select rateRow;

        foreach (DataRow row in query)
        {
            lblRateType.Text =  "Type: " + row["RateType"].ToString();
            lblRateDescription.Text = "Desc: " + row["RateDescription_EN"].ToString();
            lblRateFrom.Text = "From: " + Convert.ToDateTime(row["FromDate"]).ToString("MMMM d, yyyy");
            lblRateTo.Text = "To: " + Convert.ToDateTime(row["ToDate"]).ToString("MMMM d, yyyy");
            lblRate.Text = "Rate: " + row["Rate"].ToString();
            hidRate.Value = row["Rate"].ToString();
        }
    }

    private void BindRoomInfo(int selectedRoom)
    {
        if (!isRoomAvailable())
        {
            lblMsg.Text = "No data. Please check availability again";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        IEnumerable<DataRow> query = from roomRow in availableRooms.AsEnumerable()
                                     where roomRow.Field<int>("Room_ID") == selectedRoom
                                     select roomRow;

        foreach (DataRow row in query)
        {
            lblRoomNumber.Text = "Room#: " + row["RoomNumber"].ToString();
            lblRoomType.Text = "Type: " + row["RoomTypeDescription"].ToString();
            lblRoomDescription.Text = "Desc: " + row["RoomName_EN"].ToString();
            lblMaxOccupancy.Text = "Occupancy: " + row["MaximumOccupancy_Allowed"].ToString();
            lblMaxGents.Text = "Max. Gents: " + row["MaximumGents_Allowed"].ToString();
            lblMaxKids.Text = "Max. Kids: " + row["MaximumKids_Allowed"].ToString();
            lblMaxBedRooms.Text = "Bedrooms: " + row["Number_Of_BedRooms"].ToString();
            lblMaxBeds.Text = "Beds: " + row["Number_Of_Beds"].ToString();
            lblMaxKitchens.Text = "Kitchens: " + row["Number_Of_Kitchen"].ToString();
            lblReferigerator.Text = "Referigerator: " + row["IsRefregerator_Available"].ToString();
            lblCookingFacility.Text = "Cooking: " + row["IsCookingFacility_Available"].ToString();
            lblMaxTV.Text = "TV: " + row["Number_Of_TV"].ToString();
            lblMaxLivingRoooms.Text = "Living Rooms: " + row["Number_Of_LivingRooms"].ToString();
        }
    }

    private void BindPaymentInfo()
    {
        Double employeeDiscount = Double.Parse(hidEmployeeDiscount.Value);
        string employeeDiscountUnit = hidEmployeeDiscountUnit.Value;
        Int32 numberOfDaysBooked = Int32.Parse(hidBookingDays.Value);
        Double rate = Double.Parse(hidRate.Value);
        Double totalCost = rate * numberOfDaysBooked;
        hidTotalCost.Value = totalCost.ToString();
        Double employeeDiscountInKD = 0.00;
        switch (employeeDiscountUnit)
        {
            case "1":
                employeeDiscountInKD = employeeDiscount;
                lblEmployeeDiscountInKD.Text = employeeDiscountInKD.ToString();
                break;
            case "2":
                employeeDiscountInKD = employeeDiscount;
                employeeDiscountInKD = ((employeeDiscountInKD / 100) * totalCost);
                lblEmployeeDiscountInKD.Text = employeeDiscountInKD.ToString();
                break;
            default:
                employeeDiscountInKD = employeeDiscount;
                lblEmployeeDiscountInKD.Text = employeeDiscountInKD.ToString();
                break;
        }

        Double discountOffered = 0;
        if (txtDiscountOffered.Text != string.Empty || txtDiscountOffered.Text.Trim() != "")
        {
            switch (drpDiscountUnit.SelectedValue)
            {
                case "1":
                    discountOffered = Double.Parse(txtDiscountOffered.Text);
                    break;
                case "2":
                    discountOffered = ((Double.Parse(txtDiscountOffered.Text)) / 100) * totalCost;
                    break;
                default:
                    discountOffered = Double.Parse(txtDiscountOffered.Text);
                    break;
            }
        }
        hidDiscountOffered.Value = discountOffered.ToString();
        if (discountOffered > employeeDiscountInKD)
        {
            lblMsg.Text = "Discount offered is greater than employee discount";
            lblMsg.ForeColor = Color.Red;
            return;
        }

        Double costAfterDiscount = (totalCost - discountOffered);
        hidCostAfterDiscount.Value = costAfterDiscount.ToString();
        lblDiscountOffered.Text = "Discount Offered: " + discountOffered.ToString();
        lblTotalCost.Text = "Total Cost: " + totalCost.ToString();
        lblCostAfterDiscount.Text = "Total after Discount: " + costAfterDiscount.ToString();
        txtBookingAmount.Text = costAfterDiscount.ToString();
    }

    protected void drpGuests_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMsg.Text = string.Empty;
        if (drpGuests.SelectedValue != "-1")
        {
            SqlInt32 newGuestId = SqlInt32.Parse(drpGuests.SelectedValue);
            BindNewGuest(newGuestId);
        }
    }

    protected void btnShowPopup_Click(object sender, EventArgs e)
    {
        string popupScript = "<script language='javascript'>" +
                        "window.open('AddGuest.aspx', 'ThisPopUp', " +
                        "'left = 300, top=150, width=750, height=600, " + 
                        "menubar=no, scrollbars=yes, resizable=no')" +
                        "</script>";
        Page.ClientScript.RegisterStartupScript(GetType(), "PopupScript", popupScript);

    }

    protected void btnHidden_Click(object sender, EventArgs e)
    {
        SqlInt32 newGuestId = SqlInt32.Parse(hidNewGuestId.Value);
        BindNewGuest(newGuestId);
    }

    private void BindNewGuest(SqlInt32 newGuestId)
    {
        BindGuests();
        Guests guest = new Guests();
        guest.Guest_ID = newGuestId;
        DataTable table = guest.SelectOne();
        grid.DataSource = table;
        grid.DataBind();
        hidNewGuestId.Value = newGuestId.ToString();
    }

    protected void btnSrchGuest_Click(object sender, EventArgs e)
    {
        string selectedValue = drpSrchCriteria.SelectedValue;
        string columnName = string.Empty;
        switch (selectedValue)
        {
            case "1":
                columnName = "FirstName";
                break;
            case "2":
                columnName = "MobileNumber";
                break;
            case "3":
                columnName = "Civil_ID";
                break;
            default:
                columnName = "FirstName";
                break;
        }
        string searchValue = txtSrchValue.Text;
        DataTable table = new Guests().Search("Guests",columnName, searchValue);
        drpGuests.Items.Clear();
        drpGuests.DataSource = table;
        drpGuests.DataTextField = "FirstName";
        drpGuests.DataValueField = "Guest_ID";
        drpGuests.DataBind();
        drpGuests.Items.Insert(0, new ListItem("Select a Guest...", "-1"));
        return;
    }
}