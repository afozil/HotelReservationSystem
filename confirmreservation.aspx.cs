using System;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlTypes;
using HotelReservationSystemDAL;
using System.IO;
using System.Configuration;

public partial class confirmreservation : System.Web.UI.Page
{
    DataTable roomTbl = null;
    DataTable reservationPaymentsTbl = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        //DisableCache();
        /*
        try {
            if (Page.PreviousPage == null)
                Response.Redirect("booking.aspx", true);
        }catch(Exception ex)
        {
            Response.Redirect("booking.aspx", true);
        }*/
        if (!Page.IsPostBack)
        {
            SetPreviousPageProperties();
        }
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

    protected void SetPreviousPageProperties()
    {
        //Guest Info;
        Guests guest = (Guests)Session["Guest"];
        this.lblGuestName.Text = (guest.FirstName + " " + guest.MiddleName + " " + guest.LastName).ToString() ;
        this.lblGuestMobile.Text = guest.MobileNumber.ToString();
        this.lblGuestCvd.Text = guest.Civil_ID.ToString();
        this.lblGuestEmail.Text = guest.Email.ToString();
        this.hidGuestId.Value = guest.Guest_ID.ToString();
        this.Guest_ID = guest.Guest_ID;

        //Reservation Info;
        Reservations reservation = (Reservations)Session["Reservation"];
        this.hidFromDate.Value = reservation.FromDate.ToString();
        this.lblFromDate.Text = "<span class=\"glyphicon glyphicon-calendar\" aria-hidden=\"true\"></span> " + Utility.GetDateTimeFromSqlDateTime(reservation.FromDate).ToString("dd/MM/yyyy");
        this.FromDate = reservation.FromDate;
        this.hidToDate.Value = reservation.ToDate.ToString();
        this.lblToDate.Text = "<span class=\"glyphicon glyphicon-calendar\" aria-hidden=\"true\"></span> " + Utility.GetDateTimeFromSqlDateTime(reservation.ToDate).ToString("dd/MM/yyyy");
        this.ToDate = reservation.ToDate;
        
        this.hidNumAdults.Value = Session["NumAdults"].ToString();
        this.lblAdults.Text = Session["NumAdults"].ToString();
        this.NumAdults = (SqlInt32)Session["NumAdults"];
        this.hidNumKids.Value = Session["NumKids"].ToString();
        this.lblKids.Text = Session["NumKids"].ToString(); 
        this.NumKids = (SqlInt32)Session["NumKids"];
        this.hidBookingDays.Value = Session["BookingDays"].ToString();
        this.lblDays.Text = Session["BookingDays"].ToString();
        this.BookingDays = (SqlInt32)Session["BookingDays"];

        this.NumRooms = (SqlInt32)Session["NumRooms"];
        this.hidNumRooms.Value = Session["NumRooms"].ToString();

        this.lblRoomType.Text = Session["RoomType"].ToString();
        this.hidRoomType.Value = Session["RoomType"].ToString();
        this.RoomType = Session["RoomType"].ToString();
        this.hidRoomTypeId.Value = Session["RoomType_ID"].ToString();
        this.RoomType_ID = (SqlInt32)Session["RoomType_ID"];
        this.hidRoomId.Value = Session["Room_ID"].ToString();
        this.Room_ID = (SqlInt32)Session["Room_ID"];
        this.hidRate.Value = Session["Rate"].ToString();
        this.Rate = (SqlMoney)Session["Rate"];
        this.hidRateType.Value = Session["RateType"].ToString();
        this.RateType = (SqlInt32)Session["RateType"];
        this.hidRateId.Value = Session["Rate_ID"].ToString();
        this.Rate_ID = (SqlInt32)Session["Rate_ID"];
        this.TotalCostAfterDiscount = (SqlMoney)Session["TotalCostAfterDiscount"];
        this.hidDiscountOffered.Value = Session["DiscountOffered"].ToString();
        this.DiscountOffered = (SqlMoney)Session["DiscountOffered"];
        this.hidTotalCost.Value = Session["TotalCost"].ToString();
        this.TotalCost = (SqlMoney)Session["TotalCost"];
        this.hidDiscountId.Value = Session["Discount_ID"].ToString();
        this.Discount_ID = (SqlInt32)Session["Discount_ID"];
        this.hidReservationId.Value = Session["ReservationID"].ToString();
        this.Reservation_ID = (SqlInt32)Session["ReservationID"];
        this.hidPaymentId.Value = Session["PaymentID"].ToString();
        this.Payment_ID = (SqlInt32)Session["PaymentID"];
        
        //Payment Info
        Reservation_Payments pay = (Reservation_Payments)Session["Reservation_Payments"];
        this.lblRoomCharges.Text = pay.Cost_After_Discount.ToString();
        this.hidRoomCharges.Value = pay.Cost_After_Discount.ToString();
        this.hidCostAfterDiscount.Value = pay.Cost_After_Discount.ToString();

        SqlMoney totalRoomCost = new SqlMoney(0.00);
        SqlMoney totalFerryCost = new SqlMoney(0.00);
        SqlMoney kidsFerryCost = new SqlMoney(0.00);
        SqlMoney adultsFerryCost = new SqlMoney(0.00);
        SqlMoney totalCost = new SqlMoney(0.00);
        GetReservationPayment(reservation.Reservation_ID);
        if(reservationPaymentsTbl != null)
        {
            foreach(DataRow r in reservationPaymentsTbl.Rows)
            {
                if ((Int32)r["AvailedService_Type"] == PAYMENT_AVAILED_SERVICETYPES.FERRY_KIDS)
                    kidsFerryCost = (Decimal)r["Cost_After_Discount"];
                if((Int32)r["AvailedService_Type"] == PAYMENT_AVAILED_SERVICETYPES.FERRY_ADULTS)
                    adultsFerryCost = (Decimal)r["Cost_After_Discount"];
                if((Int32)r["AvailedService_Type"] == PAYMENT_AVAILED_SERVICETYPES.RESERVATION)
                    totalRoomCost = (Decimal)r["Cost_After_Discount"];
            }
        }
        totalFerryCost = (adultsFerryCost + kidsFerryCost);
        totalCost = (totalFerryCost + totalRoomCost);


        /*
        //Ferry Ticket Info
        bool wantFerry = (bool)Session["WantFerry"];
        if (wantFerry)
        {
            Ferry ferry = (Ferry)Session["Ferry"];
            if (ferry != null)
            {
                this.lblFerryAdults.Text = ferry.NumberOfAdults.ToString();
                this.lblFerryKids.Text = ferry.NumberOfKids.ToString();
                this.lblFerryAdultsValidity.Text = Utility.GetDateTimeFromSqlDateTime(reservation.FromDate).ToString("dd/MM/yyyy");
                this.lblFerryKidsValidity.Text = Utility.GetDateTimeFromSqlDateTime(reservation.FromDate).ToString("dd/MM/yyyy");
                this.lblDepartureDate.Text = Utility.GetDateTimeFromSqlDateTime(reservation.ToDate).ToString("dd/MM/yyyy");
                this.lblDepartureTickets.Text = (ferry.NumberOfAdults + ferry.NumberOfKids).ToString();
                this.lblFerryCharges.Text = totalFerryCost.ToString();//ferry.Total_Cost.ToString();
                this.lblTotalCharges.Text = totalCost.ToString();//(pay.Cost_After_Discount + ferry.Total_Cost).ToString();
                this.hidCostAfterDiscount.Value = totalCost.ToString();//(pay.Cost_After_Discount + ferry.Total_Cost).ToString();
            }
        }
        else
        {
            this.lblFerryAdults.Text = "0";
            this.lblFerryKids.Text = "0";
            this.lblFerryAdultsValidity.Text = "N/A";
            this.lblFerryKidsValidity.Text = "N/A";
            this.lblDepartureDate.Text = "N/A";
            this.lblDepartureTickets.Text = "0";
            this.lblFerryCharges.Text = "0.00";
            this.lblTotalCharges.Text = (pay.Cost_After_Discount).ToString();
        }
        */
        this.lblTotalCharges.Text = (pay.Cost_After_Discount).ToString();
        roomTbl =  (DataTable)Session["AvailableRooms"];//PreviousPage.AvailableRooms;
    }

    private void GetReservationPayment(SqlInt32 reservationId)
    {
        if (reservationPaymentsTbl == null)
        {
            Reservation_Payments rpay = new Reservation_Payments();
            rpay.Reservation_ID = reservationId;
            reservationPaymentsTbl = rpay.SelectAll();
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("reservation.aspx?back=-1", true);
    }

    private String _roomTypeName;
    private SqlInt32 _roomTypeId, _rooms, _adults, _kids, _roomId, _bookingDays, _rateType, _rateId, _discountId, _guestId, _paymentId, _reservationId;
    private SqlDateTime _fromDate, _toDate;
    private DataTable _availableRooms;
    private SqlMoney _rate, _totalCost, _discountOffered, _totalCostAfterDiscount;

    public String RoomType
    {
        get { return _roomTypeName; }
        set { _roomTypeName = value; }
    }

    public SqlInt32 Room_ID
    {
        get { return _roomId; }
        set { _roomId = value; }
    }
    public SqlInt32 BookingDays
    {
        get { return _bookingDays; }
        set { _bookingDays = value; }
    }
    public SqlInt32 RateType
    {
        get { return _rateType; }
        set { _rateType = value; }
    }
    public SqlInt32 Rate_ID
    {
        get { return _rateId; }
        set { _rateId = value; }
    }
    public SqlInt32 Discount_ID
    {
        get { return _discountId; }
        set { _discountId = value; }
    }
    public SqlMoney Rate
    {
        get { return _rate; }
        set { _rate = value; }
    }
    public SqlMoney DiscountOffered
    {
        get { return _discountOffered; }
        set { _discountOffered = value; }
    }
    public SqlMoney TotalCostAfterDiscount
    {
        get { return _totalCostAfterDiscount; }
        set { _totalCostAfterDiscount = value; }
    }
    public SqlMoney TotalCost
    {
        get { return _totalCost; }
        set { _totalCost = value; }
    }

    public SqlInt32 RoomType_ID
    {
        get { return _roomTypeId; }
        set { _roomTypeId = value; }
    }
    public SqlInt32 NumRooms
    {
        get { return _rooms; }
        set { _rooms = value; }
    }
    public SqlInt32 NumAdults
    {
        get { return _adults; }
        set { _adults = value; }
    }
    public SqlInt32 NumKids
    {
        get { return _adults; }
        set { _adults = value; }
    }
    public SqlDateTime FromDate
    {
        get { return _fromDate; }
        set { _fromDate = value; }
    }
    public SqlDateTime ToDate
    {
        get { return _toDate; }
        set { _toDate = value; }
    }

    public DataTable AvailableRooms
    {
        get { return _availableRooms; }
        set { _availableRooms = value; }
    }

    public SqlInt32 Reservation_ID
    {
        get { return _reservationId; }
        set { _reservationId = value; }
    }
    public SqlInt32 Guest_ID
    {
        get { return _guestId; }
        set { _guestId = value; }
    }
    public SqlInt32 Payment_ID
    {
        get { return _paymentId; }
        set { _paymentId = value; }
    }


    protected void btnConfirmBooking_Click(object sender, EventArgs e)
    {
        if (!this.chkTerms.Checked)
        {
            this.pnlStatus.Visible = true;
            this.pnlStatus.CssClass = "alert alert-danger";
            this.lblStatus.Text = "Please agree to the Terms and Conditions";
            return;
        }

        ASCIIEncoding encoding = new ASCIIEncoding();
        StringBuilder sbPostData = new StringBuilder();
        AppSettingsReader _configReader = new AppSettingsReader();
        /*
        sbPostData.Append("id=340301");
        sbPostData.Append("&password=340301");
        sbPostData.Append("&action=1");
        sbPostData.Append("&alias=safir");
        sbPostData.Append("&amt=" + this.hidCostAfterDiscount.Value); 
        sbPostData.Append("&currencycode=414");
        sbPostData.Append("&langid=ENG");
        sbPostData.Append("&responseURL=https://www.failakaonline.com/app/response");
        sbPostData.Append("&errorurl=https://www.failakaonline.com/app/error");
        sbPostData.Append("&trackId=" + (new Random().Next(10000000) + 1).ToString() );
        */
        sbPostData.Append(KNET_AppSettingsNames.ID + "=" + _configReader.GetValue(KNET_AppSettingsNames.ID, typeof(string)).ToString());
        sbPostData.Append("&" + KNET_AppSettingsNames.PASSWORD + "=" + _configReader.GetValue(KNET_AppSettingsNames.PASSWORD, typeof(string)).ToString());
        sbPostData.Append("&" + KNET_AppSettingsNames.ACTION + "=" + _configReader.GetValue(KNET_AppSettingsNames.ACTION, typeof(string)).ToString());
        sbPostData.Append("&" + KNET_AppSettingsNames.ALIAS + "=" + _configReader.GetValue(KNET_AppSettingsNames.ALIAS, typeof(string)).ToString());
        sbPostData.Append("&amt=" + this.hidCostAfterDiscount.Value);
        sbPostData.Append("&" + KNET_AppSettingsNames.CURRENCY_CODE + "=" + _configReader.GetValue(KNET_AppSettingsNames.CURRENCY_CODE, typeof(string)).ToString());
        sbPostData.Append("&" + KNET_AppSettingsNames.LANGUAGE_ID + "=" + _configReader.GetValue(KNET_AppSettingsNames.LANGUAGE_ID, typeof(string)).ToString());
        sbPostData.Append("&" + KNET_AppSettingsNames.RESPONSE_URL + "=" + _configReader.GetValue(KNET_AppSettingsNames.RESPONSE_URL, typeof(string)).ToString());
        sbPostData.Append("&" + KNET_AppSettingsNames.ERROR_URL + "=" + _configReader.GetValue(KNET_AppSettingsNames.ERROR_URL, typeof(string)).ToString());
        sbPostData.Append("&" + KNET_AppSettingsNames.TRACK_ID + "=" + (new Random().Next(10000000) + 1).ToString());
        sbPostData.Append("&udf1=" + this.hidReservationId.Value);

        string postData = sbPostData.ToString();
        byte[] data = encoding.GetBytes(postData);
        string resp = string.Empty;
        try
        {
            // Prepare web request...
            //HttpWebRequest knetRequest = (HttpWebRequest)WebRequest.Create("https://www.knetpaytest.com.kw/CGW302/servlet/PaymentInitHTTPServlet");
            string knet = _configReader.GetValue(KNET_AppSettingsNames.KNET_URL, typeof(string)).ToString();
            HttpWebRequest knetRequest = (HttpWebRequest)WebRequest.Create(knet);
            knetRequest.Method = "POST";
            knetRequest.ContentType = "application/x-www-form-urlencoded";
            knetRequest.ContentLength = data.Length;

          //  Certificates.Instance.GetCertificatesAutomatically();


            //----added by benoy---------
            ServicePointManager.SecurityProtocol =  (SecurityProtocolType)3072;
            ServicePointManager.ServerCertificateValidationCallback += delegate { return true; };

            //---------//

            Stream newStream = knetRequest.GetRequestStream();
            // Send the data.
            newStream.Write(data, 0, data.Length);
            newStream.Close();
            WebResponse response = knetRequest.GetResponse();
            StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
            resp = reader.ReadToEnd();
            reader.Close();
            response.Close();
            if(resp != string.Empty)
            {
               int paymentIdIndex = resp.IndexOf(':');
               string paymentId = resp.Substring(0, paymentIdIndex);
               string knetUrl = resp.Substring((paymentIdIndex + 1), (resp.Length - (paymentIdIndex + 1)));
               knetUrl = knetUrl + "PaymentID=" + paymentId;
                if (ProcessKNET(paymentId))
                    Response.Redirect(knetUrl, true);
                else
                    this.lblStatus.Text = "Error in Initiating KNET Transaction. Payment ID " + paymentId;
            }

        }catch(Exception ex)
        {
            lblStatus.Text = ex.StackTrace;
        }
      }

    private bool ProcessKNET(string knetPaymentId)
    {
        KNET_Payments knet = new KNET_Payments();
        knet.Payment_ID = ((Reservation_Payments)Session["Reservation_Payments"]).Payment_ID;//(SqlInt32)Session["PaymentID"];
        knet.Reservation_ID = ((Reservations)Session["Reservation"]).Reservation_ID;//(SqlInt32)Session["ReservationID"];
        knet.Guest_ID = ((Guests)Session["Guest"]).Guest_ID;//(SqlInt32)Session["GuestID"];
        knet.KNET_Payment_ID = knetPaymentId;
        knet.PaymentSatus = PaymentStatus.KNET_PROCESSING; //Purchase Initiation
        knet.CreatedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
        string remarks, rate, qty, total; // Declaration of variables
        remarks = "Hotel Reservation for " + this.hidBookingDays.Value + " days";
        rate = this.hidRate.Value;
        qty = this.hidBookingDays.Value;
        total = this.hidCostAfterDiscount.Value;
        knet.PaymentAmount = SqlMoney.Parse(this.hidCostAfterDiscount.Value);
        knet.Remarks = remarks + "@ Rate" + this.hidRate.Value;
        knet.TransVal = "0";
        knet.Track_ID = "0";
        ClearSessionObjects();
        return knet.Insert();
    }

    

    private void ClearSessionObjects()
    {
        Session.RemoveAll();
    }

    protected void chkTerms_CheckedChanged(object sender, EventArgs e)
    {
        if (this.chkTerms.Checked)
            this.btnConfirmBooking.Enabled = true;
        else
            this.btnConfirmBooking.Enabled = false;
    }
}