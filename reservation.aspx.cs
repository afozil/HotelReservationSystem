using System;
using System.Data;
using System.Data.SqlTypes;
using System.Collections.Specialized;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using HotelReservationSystemDAL;

public partial class reservation : System.Web.UI.Page
{
    DataTable roomTbl = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        //DisableCache();
        if (!Page.IsPostBack)
        {
            BindCountries();
            try
            {
              SetPreviousFormProperties();
            }
            catch (Exception ex)
            { }
            
        }
    }

    protected void BindReservation()
    {
        //Guest Info;
        Guests guest = (Guests)Session["Guest"];
        this.txtFirstName.Text = guest.FirstName.ToString();
        this.txtMiddleName.Text = guest.MiddleName.ToString();
        this.txtLastName.Text = guest.LastName.ToString();
        this.txtMobileNumber.Text = guest.MobileNumber.ToString();
        this.txtCivilId.Text = guest.Civil_ID.ToString();
        this.txtEmail.Text = guest.Email.ToString();
        this.drpNationality.SelectedValue = guest.Nationality.ToString();
        //this.Guest_ID = guest.Guest_ID;

        //Reservation Info;
        Reservations reservation = (Reservations)Session["Reservation"];
        roomTbl = (DataTable)Session["AvailableRooms"];//PreviousPage.AvailableRooms;
    }

    private void DisableCache()
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache); //Cache-Control : no-cache, Pragma : no-cache
        Response.Cache.SetExpires(DateTime.Now.AddDays(-1)); //Expires : date time
        Response.Cache.SetNoStore(); //Cache-Control :  no-store
        Response.Cache.SetProxyMaxAge(new TimeSpan(0, 0, 0)); //Cache-Control: s-maxage=0
        Response.Cache.SetValidUntilExpires(false);
        Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);//Cache-Control:  must-revalidate
    }

    protected void SetPreviousFormProperties()
    {
        roomTbl = (DataTable)Session["AvailableRooms"];
        this.hidFromDate.Value = Session["FromDate"].ToString(); //Request.Form["hidFromDate"].ToString();
        this.hidToDate.Value = Session["ToDate"].ToString();
        this.hidNumAdults.Value = Session["NumAdults"].ToString();
        this.hidNumKids.Value = Session["NumKids"].ToString();
        this.hidNumRooms.Value = Session["NumRooms"].ToString();
        this.hidRoomTypeId.Value = Session["RoomType_ID"].ToString();
        this.hidRoomType.Value = Session["RoomType"].ToString();
        this.hidBookingDays.Value = Session["BookingDays"].ToString();
        this.hidRoomId.Value = Session["Room_ID"].ToString();
        this.hidRate.Value = Session["Rate"].ToString();
        this.hidRateType.Value = Session["RateType"].ToString();
        this.hidRateId.Value = Session["Rate_ID"].ToString();
        this.hidCostAfterDiscount.Value = Session["TotalCostAfterDiscount"].ToString();
        this.hidDiscountOffered.Value = Session["DiscountOffered"].ToString();
        this.hidTotalCost.Value = Session["TotalCost"].ToString();
        this.hidDiscountId.Value = Session["Discount_ID"].ToString();
        this.hidSelectedCardType.Value = Session["CardType"].ToString();
        this.hidAmountToPay.Value = Session["TotalCostAfterDiscount"].ToString();
        this.hidRoomCharges.Value = Session["TotalCostAfterDiscount"].ToString();
        this.hidPayableForFerry.Value = "0";
        BindCosts();
    }

    private void BindCountries()
    {
        DataTable table = new Countries().SelectAll();
        drpNationality.DataSource = table;
        drpNationality.DataTextField = table.Columns["CountryName_EN"].ToString();
        drpNationality.DataValueField = table.Columns["ISO_ALPHA3_Code"].ToString();
        drpNationality.DataBind();
        drpNationality.SelectedValue = "KWT";
    }

    private void BindCosts()
    {
        this.lblRoomCharges.Text = this.hidRoomCharges.Value;
        //this.lblFerryCharges.Text = this.hidPayableForFerry.Value;
        this.lblAmountToPay.Text = this.hidAmountToPay.Value;
        string cardType = this.hidSelectedCardType.Value == "1" ? "K-NET" : "Unknown";
        this.lblCardType.Text = "<span class=\"glyphicon glyphicon-credit-card\" aria-hidden=\"true\"></span> " + cardType;
    }

    private SqlInt32 SaveGuest()
    {
        try
        {
            Guests guest = new Guests();
            guest.LastModifiedUser = 0;//Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
            guest.LastModifiedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
            guest.LastBookingDate = SqlDateTime.Parse(DateTime.Now.ToString());
            guest.Email = txtEmail.Text;
            guest.FirstName = txtFirstName.Text;
            guest.MiddleName = txtMiddleName.Text;
            guest.LastName = txtLastName.Text;
            //Session.Add("Guest_Name", guest.FirstName + " " + guest.MiddleName + " " + guest.LastName);
            guest.MobileNumber = txtMobileNumber.Text;
            //Session.Add("Postal", guest.MobileNumber);
            guest.Civil_ID = txtCivilId.Text;
            DateTime date = DateTime.Parse(txtDOB.Text);
            String.Format("0:u", date);
            guest.DateOfBirth = Utility.GetSqlDateTimeFromDateTime(DateTime.Parse(txtDOB.Text));//SqlDateTime.Parse(txtDOB.Text);
            guest.PassportNumber = txtPassportNumber.Text;
            guest.Preferrences = string.Empty;
            guest.Nationality = drpNationality.SelectedValue;
            //Session.Add("Address", drpNationality.SelectedItem.Text);
            guest.Salutation = SqlInt32.Parse(drpSalutation.SelectedValue);
            guest.IsBlackListed = 0;
            guest.Category = GuestCategories.INTERNET; //GuestCategories.INTERNET;
            guest.Gender = 1;
            //bool retval = false;
            if (string.IsNullOrEmpty(this.hidGuestId.Value))
            {
                guest.CreatedUser = 0;//Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
                guest.CreatedDate = guest.LastModifiedDate;
                try
                {
                    if (!guest.Insert())
                    {
                        this.pnlStatus.Visible = true;
                        this.pnlStatus.CssClass = "alert alert-danger";
                        this.lblMsg.Text = guest.ErrorDesc.ToString();
                        return 0;
                    }
                }catch (Exception ex)
                {
                    this.pnlStatus.Visible = true;
                    this.pnlStatus.CssClass = "alert alert-danger";
                    this.lblMsg.Text = guest.ErrorDesc.ToString() + " - " + ex.Message;
                    return 0;
                }
            }
            else
            {
                guest.Guest_ID = SqlInt32.Parse(this.hidGuestId.Value);
                try
                {
                    if (!guest.Update())
                    {
                        this.pnlStatus.Visible = true;
                        this.pnlStatus.CssClass = "alert alert-danger";
                        this.lblMsg.Text = guest.ErrorDesc.ToString();
                        return 0;
                    }
                }
                catch (Exception ex)
                {
                    this.pnlStatus.Visible = true;
                    this.pnlStatus.CssClass = "alert alert-danger";
                    this.lblMsg.Text = guest.ErrorDesc.ToString() + " - " + ex.Message;
                    return 0;
                }
            }
            Session.Add("Guest", guest);
            return guest.Guest_ID;
        }
        catch (Exception ex)
        {
            return 0;
        }
    }

    private void SaveBooking(SqlInt32 guestId, out SqlInt32 paymentId, out SqlInt32 reservationId)
    {
        paymentId = -1;
        reservationId = -1;
        Reservations r = new Reservations();
        r.ReservationDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Today);
        r.FromDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Parse(this.hidFromDate.Value));
        r.ToDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Parse(this.hidToDate.Value));
        r.ReservationPersonnel = 0; //Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
        r.RateType = SqlInt32.Parse(this.hidRateType.Value);
        SqlInt32 rateId = SqlInt32.Parse(this.hidRateId.Value);
        r.Rate_ID = rateId;
        r.RoomType_ID = SqlInt32.Parse(this.hidRoomTypeId.Value);
        r.Room_ID = SqlInt32.Parse(this.hidRoomId.Value);
        r.Parent_Reservation_ID = 0;
        r.Connected_Room_ID = 0;
        r.Guest_ID = guestId;
        r.BookingStatus = BookingStatus.CONFIRMED;
        r.Remarks = string.Empty;
        Reservation_Payments pay = new Reservation_Payments();
        pay.PaymentPersonnel = 0;//Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
        pay.CreatedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Today);
        pay.Discount_ID = SqlInt32.Parse(this.hidDiscountId.Value);
        pay.AvailedService_Type = PAYMENT_AVAILED_SERVICETYPES.RESERVATION; //1=Reservation;2=Bills & Services;3=Amenities
        pay.Rate_ID = rateId; 
        pay.UnitsConsumed = SqlInt32.Parse(this.hidBookingDays.Value);
        pay.Discount_Offered = SqlMoney.Parse(this.hidDiscountOffered.Value);
        pay.TotalCost_Before_Discount = SqlMoney.Parse(this.hidTotalCost.Value);
        SqlMoney costAfterDiscount = SqlMoney.Parse(this.hidCostAfterDiscount.Value); ;
        pay.Cost_After_Discount = costAfterDiscount;
        pay.AmountReceived = 0;
        if (pay.AmountReceived==0)
        {
            r.PaymentStatus = PaymentStatus.NOT_PAID;
            r.PendingAmount = pay.Cost_After_Discount - pay.AmountReceived;
        }
        else
        {
            this.pnlStatus.Visible = true;
            this.pnlStatus.CssClass = "alert alert-danger";
            lblMsg.Text = "Booking Must be Less than or Equal to Cost after Discount";
            return ;
        }
        if (pay.AmountReceived != 0)
        {
           pay.PaymentMode = SqlInt32.Parse(this.hidSelectedCardType.Value);
        }
        pay.Remarks = r.Remarks;
        pay.PaymentStatus = 1;//Active
        
        if (r.Insert())
        {
            pay.Reservation_ID = r.Reservation_ID;
            reservationId = r.Reservation_ID;
            Session.Add("ReservationID", reservationId);
            Session.Add("Reservation", r);
            if (pay.Insert())
            {
                this.pnlStatus.Visible = true;
                this.pnlStatus.CssClass = "alert alert-danger";
                lblMsg.Text = "Reservation & Payment was successfully saved.";
                paymentId = pay.Payment_ID;
                Session.Add("PaymentID", paymentId);
                Session.Add("Reservation_Payments", pay);
                /*
                //Insert Ferry Payment as well
                //Ferry
                Ferry ferry = new Ferry();
                Session.Add("WantFerry", false);
                if (this.chkWantFerry.Checked)
                {
                    Session.Add("WantFerry", true);
                    DataTable toReturn = ferry.SelectAll();
                    ferry.Ferry_ID =  (Int32)toReturn.Rows[0]["Ferry_ID"];
                    ferry.SelectOne();
                    ferry.NumberOfAdults = SqlInt32.Parse(this.drpNumberOfAdults.SelectedValue);
                    ferry.NumberOfKids = SqlInt32.Parse(this.drpNumberOfChildren.SelectedValue);
                    Session.Add("Ferry", ferry);
                    bool saveFerry = false;
                    if(Int32.Parse(drpNumberOfAdults.SelectedValue) > 0)
                        saveFerry=SaveReservationPayment(r.Reservation_ID, ferry, PAYMENT_AVAILED_SERVICETYPES.FERRY_ADULTS);
                    if (Int32.Parse(drpNumberOfChildren.SelectedValue) > 0)
                        saveFerry=SaveReservationPayment(r.Reservation_ID, ferry, PAYMENT_AVAILED_SERVICETYPES.FERRY_KIDS);
                    if (!saveFerry)
                    {
                        this.pnlStatus.Visible = true;
                        this.pnlStatus.CssClass = "alert alert-danger";
                        lblMsg.Text =  "There was a problem in saving the Ferry";
                        lblMsg.ForeColor = Color.Red;
                        return;
                    }
                }
                */
                return;
            }
            else
            {
                this.pnlStatus.Visible = true;
                this.pnlStatus.CssClass = "alert alert-danger";
                lblMsg.Text = "Reservation was saved. However, there was a problem in saving the Payment";
                lblMsg.ForeColor = Color.Red;
                return;
            }
        }
        else{
                this.pnlStatus.Visible = true;
                this.pnlStatus.CssClass = "alert alert-danger";
                lblMsg.Text = "There was a problem. Could not save Reservation";
                lblMsg.ForeColor = Color.Red;
                return;
            }
    }

    private bool SaveReservationPayment(SqlInt32 reservationId, Ferry ferry, int ferryAdultOrChild)
    {
        Reservation_Payments pay = new Reservation_Payments();
        pay.Reservation_ID = reservationId;
        pay.PaymentPersonnel = 0;//Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
        pay.CreatedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Today);
        pay.Discount_ID = SqlInt32.Parse(this.hidDiscountId.Value);
        pay.AvailedService_Type = ferryAdultOrChild; //1=Reservation;2=Bills & Services;3=Amenities
        pay.Discount_Offered = new SqlMoney(0.00);
        pay.Rate_ID = (SqlInt32)ferry.Ferry_ID;
        pay.PaymentStatus = PaymentStatus.NOT_PAID;
        /*
        if (ferryAdultOrChild == PAYMENT_AVAILED_SERVICETYPES.FERRY_ADULTS)
        {
            pay.UnitsConsumed = SqlInt32.Parse(this.drpNumberOfAdults.SelectedValue);
            pay.TotalCost_Before_Discount = (ferry.Cost_For_Adults * pay.UnitsConsumed);
            SqlMoney costAfterDiscount = (pay.TotalCost_Before_Discount - pay.Discount_Offered);
            pay.Cost_After_Discount = costAfterDiscount;
        }
        else if (ferryAdultOrChild == PAYMENT_AVAILED_SERVICETYPES.FERRY_KIDS)
        {
            pay.UnitsConsumed = SqlInt32.Parse(this.drpNumberOfChildren.SelectedValue);
            pay.TotalCost_Before_Discount = (ferry.Cost_For_Kids * pay.UnitsConsumed);
            SqlMoney costAfterDiscount = (pay.TotalCost_Before_Discount - pay.Discount_Offered);
            pay.Cost_After_Discount = costAfterDiscount;
        }
        */
        pay.AmountReceived = 0;
        return pay.Insert();
    }

    protected void btnSaveBooking_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(this.lblAmountToPay.Text))
        {
            this.lblMsg.Text = "Reservation Amount is empty. Please try searching again by Clicking 'Cancel' buttin";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        if (!Utility.IsValidCivilId(this.txtCivilId.Text))
        {
            this.lblMsg.Text = "Invalid Civil ID !!!";
            lblMsg.ForeColor = Color.Red;
            return;
        }
    
       SqlInt32 guestId = SaveGuest();
       SqlInt32 paymentId, reservationId;
        if (guestId > 0)
            SaveBooking(guestId, out paymentId, out reservationId);
        else
            return;
        
        Response.Redirect("confirmreservation.aspx", true);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("booking.aspx", true);
    }
    /*
    protected void chkWantFerry_CheckedChanged(object sender, EventArgs e)
    {
        if (chkWantFerry.Checked)
        {
            Ferry ferry = new Ferry();
            DataTable dt = ferry.SelectAll();
            if (dt.Rows.Count > 0)
            {
                Session.Add("Ferry_ID", dt.Rows[0]["Ferry_ID"].ToString());
                this.lblCostForAdults.Text = dt.Rows[0]["Cost_For_Adults"].ToString();
                this.lblCostForKids.Text = dt.Rows[0]["Cost_For_Kids"].ToString();
                ReCalculateAmountToBePaid();
                pnlFerry.Visible = true;
            }
        }
        else
        {
            ReCalculateAmountToBePaid();
            pnlFerry.Visible = false;
        }
            
    }
    */
    private void ReCalculateAmountToBePaid()
    {
        /*
        if (this.chkWantFerry.Checked)
        {
            SqlMoney origPayable = SqlMoney.Parse(this.hidRoomCharges.Value);
            int numAdults = Int32.Parse(this.drpNumberOfAdults.SelectedValue);
            int numKids = Int32.Parse(this.drpNumberOfChildren.SelectedValue);
            SqlMoney costForAdults = SqlMoney.Parse(this.lblCostForAdults.Text);
            SqlMoney costForKids = SqlMoney.Parse(this.lblCostForKids.Text);
            hidPayableForFerry.Value = ((numAdults * costForAdults) + (numKids * costForKids)).ToString();
            this.lblFerryCharges.Text = this.hidPayableForFerry.Value;
            SqlMoney newPayable= Decimal.Parse(this.hidRoomCharges.Value) + Decimal.Parse(hidPayableForFerry.Value);
            this.hidAmountToPay.Value = newPayable.ToString();
            this.lblAmountToPay.Text = this.hidAmountToPay.Value;
        }
        else
        {
            this.lblAmountToPay.Text = this.hidRoomCharges.Value;
            hidPayableForFerry.Value = "0";
            this.lblFerryCharges.Text = hidPayableForFerry.Value;
        }
        */
        this.lblAmountToPay.Text = this.hidRoomCharges.Value;
        hidPayableForFerry.Value = "0";
        //this.lblFerryCharges.Text = hidPayableForFerry.Value;
    }

    /*
    protected void drpNumberOfKids_SelectedIndexChanged(object sender, EventArgs e)
    {
        ReCalculateAmountToBePaid();
    }
    protected void drpNumberOfAdults_SelectedIndexChanged(object sender, EventArgs e)
    {
        ReCalculateAmountToBePaid();
    }
    */

    protected void Cvd_TextChanged(object sender, EventArgs e)
    {
        //System.Threading.Thread.Sleep(3000);
        if (Utility.IsValidCivilId(this.txtRetCvd.Text))
        {
            Guests guest = new Guests();
            DataTable dt = guest.Search("Guests", "Civil_ID", this.txtRetCvd.Text);
            if (dt.Rows.Count > 0)
                BindGuest(dt);
            else
            {
                ClearGuestBinding();
                this.txtCivilId.Text = this.txtRetCvd.Text;
                this.pnlStatus.Visible = true;
                this.pnlStatus.CssClass = "alert alert-danger";
                this.lblMsg.Text = "We do not have a record for this guest. Please enter the details below";
            }
        }
        else
        {
            ClearGuestBinding();
            this.hidInsertOrUpdateGuest.Value = "insert";
            return;
        }

    }

    private void BindGuest(DataTable dt)
    {
        this.hidGuestId.Value = dt.Rows[0]["Guest_ID"].ToString();
        this.drpSalutation.SelectedValue = dt.Rows[0]["Salutation"].ToString();
        this.txtFirstName.Text = dt.Rows[0]["FirstName"].ToString();
        this.txtMiddleName.Text = dt.Rows[0]["MiddleName"].ToString();
        this.txtLastName.Text = dt.Rows[0]["LastName"].ToString();
        this.txtDOB.Text = DateTime.Parse(dt.Rows[0]["DateOfBirth"].ToString()).ToString("MM/dd/yyyy");
        //DateTime.Parse(dt.Rows[0]["DateOfBirth"].ToString()).ToString("mm/dd/yyyy");
        this.txtCivilId.Text = dt.Rows[0]["Civil_ID"].ToString();
        this.drpNationality.SelectedValue = dt.Rows[0]["Nationality"].ToString();
        this.txtPassportNumber.Text = dt.Rows[0]["PassportNumber"].ToString();
        this.txtMobileNumber.Text = dt.Rows[0]["MobileNumber"].ToString();
        this.txtEmail.Text = dt.Rows[0]["Email"].ToString();
        this.hidInsertOrUpdateGuest.Value = "update";
    }

    private void ClearGuestBinding()
    {
        this.hidGuestId.Value = string.Empty;
        this.drpSalutation.SelectedIndex = 0 ;
        this.txtFirstName.Text = String.Empty;
        this.txtMiddleName.Text = String.Empty;
        this.txtLastName.Text = String.Empty;
        this.txtDOB.Text = String.Empty;
        this.txtCivilId.Text = String.Empty;
        this.drpNationality.SelectedIndex = 0;
        this.txtPassportNumber.Text = String.Empty;
        this.txtMobileNumber.Text = String.Empty;
        this.txtEmail.Text = String.Empty;
    }
}
