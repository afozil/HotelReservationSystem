using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using HotelReservationSystemDAL;

public partial class search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DisableCache();
        if (!Page.IsPostBack)
            CurrentPageIndex = 0;
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


    public int CurrentPageIndex
    {
        get
        {
            if (ViewState["pg"] == null)
                return 0;
            else
                return Convert.ToInt16(ViewState["pg"]);
        }
        set
        {
            ViewState["pg"] = value;
        }
    }

    protected RoomType_OnlineDetails GetRoomTypeOnlineDetails(int roomTypeId)
    {
        RoomType_OnlineDetails dtls = new RoomType_OnlineDetails();
        dtls.RoomType_ID = roomTypeId;
        dtls.SelectOne();
        return dtls;
    }

    protected DataTable GetRoomTypeImages(int roomTypeId)
    {
        RoomType_Image img = new RoomType_Image();
        img.RoomType_ID = roomTypeId;
        DataTable dt = img.SelectAll();
        return dt;
    }

    protected void roomTypesList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item ||
            e.Item.ItemType == ListItemType.AlternatingItem)
        {
            int roomTypeId = Convert.ToInt32(roomTypesList.DataKeys[e.Item.ItemIndex]);
            bool isOnline = Boolean.Parse(((HiddenField)e.Item.FindControl("hidIsOnline")).Value);
            DateTime fromDate = DateTime.Parse(txtFromDate.Text);
            DateTime toDate = DateTime.Parse(txtToDate.Text);
            if (isOnline)
            {
                RoomType_OnlineDetails dtls = GetRoomTypeOnlineDetails(roomTypeId);
                //Label lblDeatailsId = (Label)e.Item.FindControl("lblId");
                Label lblRooms = (Label)e.Item.FindControl("lblRooms");
                Label lblBedRooms = (Label)e.Item.FindControl("lblBedRooms");
                Label lblLivingRooms = (Label)e.Item.FindControl("lblRooms");
                Label lblBathRooms = (Label)e.Item.FindControl("lblBathRooms");
                Label lblKitchens = (Label)e.Item.FindControl("lblKitchens");
                Label lblDetails = (Label)e.Item.FindControl("lblDetails");
                //lblDeatailsId.Text = dtls.RoomType_Online_ID.ToString();
                //lblRooms.Text = dtls.Number_of_Rooms.ToString();
                //lblBedRooms.Text = dtls.Number_of_BedRooms.ToString();
                //lblLivingRooms.Text = dtls.Number_of_LivingRooms.ToString();
                //lblBathRooms.Text = dtls.Number_of_BathRooms.ToString();
                //lblKitchens.Text = dtls.Number_of_Kitchens.ToString();
                lblDetails.Text = dtls.Description.ToString();

                //Label lblRoomTypeId = (Label)e.Item.FindControl("lblRoomTypeId");
                //lblRoomTypeId.Text = roomTypeId.ToString();

                Bookings bookings = new Bookings();
                if(this.AvailableRooms == null)
                    this.AvailableRooms = bookings.SelectAvailableRooms(this.FromDate, this.ToDate, roomTypeId);
                    //Session.Add("AvailableRooms", this.AvailableRooms);
                
                if(this.AvailableRooms.Rows.Count > 0)
                {
                    Label lblRate = (Label)e.Item.FindControl("lblRate");
                    Double rate = Convert.ToDouble(this.AvailableRooms.Rows[0]["Rate"]);
                    lblRate.Text = "KD " + rate.ToString();
                    HiddenField hidRate = (HiddenField)e.Item.FindControl("hidRate");
                    hidRate.Value = rate.ToString();
                    HiddenField hidRateType = (HiddenField)e.Item.FindControl("hidRateType");
                    hidRateType.Value = this.AvailableRooms.Rows[0]["RateType_ID"].ToString();
                    HiddenField hidRateId = (HiddenField)e.Item.FindControl("hidRateId");
                    hidRateId.Value = this.AvailableRooms.Rows[0]["Rate_ID"].ToString();

                    Label lblBookingDays = (Label)e.Item.FindControl("lblBookingDays");
                    int numberOfDaysBooked = Utility.GetNumberOfDaysFromRange(fromDate, toDate);
                    lblBookingDays.Text = numberOfDaysBooked.ToString();
                    HiddenField hidBookingDays = (HiddenField)e.Item.FindControl("hidBookingDays");
                    hidBookingDays.Value = numberOfDaysBooked.ToString();
                    HiddenField hidRoomId = (HiddenField)e.Item.FindControl("hidRoomId");
                    hidRoomId.Value = this.AvailableRooms.Rows[0]["Room_ID"].ToString();

                    Label lblPrice = (Label)e.Item.FindControl("lblCostAfterDiscount");
                    Double totalCost = rate * numberOfDaysBooked;
                    lblPrice.Text = "KD " + totalCost.ToString();
                    HiddenField hidCostAfterDiscount = (HiddenField)e.Item.FindControl("hidCostAfterDiscount");
                    hidCostAfterDiscount.Value = totalCost.ToString();

                    HiddenField hidDiscountOffered = (HiddenField)e.Item.FindControl("hidDiscountOffered");
                    hidDiscountOffered.Value = "0";
                    HiddenField hidTotalCost = (HiddenField)e.Item.FindControl("hidTotalCost");
                    hidTotalCost.Value = totalCost.ToString();
                    HiddenField hidDiscountId = (HiddenField)e.Item.FindControl("hidDiscountId");
                    hidDiscountId.Value = "0";
                }

                DataTable dt = GetRoomTypeImages(roomTypeId);
                System.Web.UI.WebControls.Image defaultImage = (System.Web.UI.WebControls.Image)e.Item.FindControl("roomTypeDefaultImage");
                if (dt.Rows.Count > 0)
                {
                    defaultImage.ImageUrl = dt.Rows[0]["RoomType_ThumbnailPath"].ToString();
                    DataList rptr = (DataList)e.Item.FindControl("roomTypeImages");
                    rptr.DataSource = dt;
                    rptr.DataBind();
                }
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
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

        SetSearchCriteria();
        BindRoomTypes();
    }

    private void SetSearchCriteria()
    {
        DateTime fromDate = DateTime.Parse(txtFromDate.Text);
        DateTime toDate = DateTime.Parse(txtToDate.Text);
        SqlDateTime sFromDate = Utility.GetSqlDateTimeFromDateTime(fromDate);
        SqlDateTime sToDate = Utility.GetSqlDateTimeFromDateTime(toDate);
        //SqlInt32 numRooms = 1;// SqlInt32.Parse(drpNumberOfRooms.SelectedValue);
        SqlInt32 numAdults = SqlInt32.Parse(drpNumberOfAdults.SelectedValue);
        SqlInt32 numKids = SqlInt32.Parse(drpNumberOfChildren.SelectedValue);
        this.FromDate = sFromDate;
        this.ToDate = sToDate;
        //this.NumRooms = numRooms;
        this.NumAdults = numAdults;
        this.NumKids = numKids;
    }

    protected void BindRoomTypes()
    {
        Bookings bookings = new Bookings();
        this.NumRooms = this.NumAdults + this.NumKids;
        DataTable dt = new Bookings().SelectAvailableOnlineRoomTypes(this.FromDate, this.ToDate, this.NumRooms, this.NumAdults, this.NumKids);
        PagedDataSource pgd = new PagedDataSource();
        pgd.DataSource = dt.DefaultView;
        if (dt.Rows.Count > 0)
        {
            DataTable uniqueRoomType = dt.AsEnumerable()
                           .GroupBy(x => x.Field<Int32>("RoomType_ID"))
                           .Select(g => g.First()).CopyToDataTable();

            
            pgd.DataSource = uniqueRoomType.DefaultView;
            pgd.CurrentPageIndex = CurrentPageIndex;
            pgd.AllowPaging = true;
            pgd.PageSize = 2;

            int rowCount = uniqueRoomType.Rows.Count;
            int pageCount = pgd.PageCount;
            this.hidPageCount.Value = pageCount.ToString();
        }
        roomTypesList.DataSource = pgd;
        roomTypesList.DataBind();
    }

    protected void lnkNext_Click(object sender, EventArgs e)
    {
        int pageCount = Int32.Parse(this.hidPageCount.Value);
        int nextPageIndex = CurrentPageIndex + 1;
        if (nextPageIndex >= pageCount)
            return;

        CurrentPageIndex++;
        SetSearchCriteria();
        BindRoomTypes();
    }

    protected void lnkPrevious_Click(object sender, EventArgs e)
    {
        if (CurrentPageIndex <= 0)
            return;

        CurrentPageIndex--;
        SetSearchCriteria();
        BindRoomTypes();
    }

    protected void imgRoomType_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        DataListItem item = (DataListItem)btndetails.NamingContainer;
        HiddenField hidRoomType = (HiddenField)item.FindControl("hidRoomTypeId");
        int roomType = Int32.Parse(hidRoomType.Value);
        BindGallery(roomType);
        this.MyModalPopupExtender.Show();
    }

    protected void BindGallery(int roomType)
    {
        DataTable dt = GetRoomTypePictures(roomType);

        rptrImage.DataSource = dt;
        rptrImage.DataBind();

        rptrThumbnail.DataSource = dt;
        rptrThumbnail.DataBind();

    }

    protected DataTable GetRoomTypePictures(int roomType)
    {
        DataTable dt = new DataTable();
        RoomType_Image image = new RoomType_Image();
        image.RoomType_ID = roomType;
        dt = image.SelectAll();
        return dt;
    }

    private String _roomTypeName;
    private SqlInt32 _roomTypeId, _rooms, _adults,_kids, _roomId, _bookingDays, _rateType, _rateId, _discountId ;
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


    protected void roomTypesList_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if(e.CommandName== "BookNow")
            this.RoomType_ID = Convert.ToInt32(e.CommandArgument);

        SetSearchCriteria();
        if(this.AvailableRooms == null)
            this.AvailableRooms = new Bookings().SelectAvailableRooms(this.FromDate, this.ToDate, this.RoomType_ID);

        this.RoomType =  ((HiddenField)e.Item.FindControl("hidRoomType")).Value;
        this.Room_ID = SqlInt32.Parse(((HiddenField)e.Item.FindControl("hidRoomId")).Value);
        this.BookingDays = SqlInt32.Parse(((HiddenField)e.Item.FindControl("hidBookingDays")).Value);
        this.DiscountOffered = SqlMoney.Parse(((HiddenField)e.Item.FindControl("hidDiscountOffered")).Value);
        this.Discount_ID = SqlInt32.Parse(((HiddenField)e.Item.FindControl("hidDiscountId")).Value);
        this.TotalCostAfterDiscount = SqlMoney.Parse(((HiddenField)e.Item.FindControl("hidCostAfterDiscount")).Value);
        this.TotalCost = SqlMoney.Parse(((HiddenField)e.Item.FindControl("hidTotalCost")).Value);
        this.Rate = SqlMoney.Parse(((HiddenField)e.Item.FindControl("hidRate")).Value);
        this.Rate_ID = SqlInt32.Parse(((HiddenField)e.Item.FindControl("hidRateId")).Value);
        this.RateType = SqlInt32.Parse(((HiddenField)e.Item.FindControl("hidRateType")).Value);

        //Server.Transfer("confirmreservation.aspx", true);
        DataTable roomTbl = this.AvailableRooms;
        Session.Add("AvailableRooms", roomTbl);
        Session.Add("FromDate", this.FromDate);
        Session.Add("ToDate", this.ToDate);
        Session.Add("NumAdults", this.NumAdults);
        Session.Add("NumKids", this.NumKids);
        Session.Add("NumRooms", this.NumRooms);
        Session.Add("RoomType_ID", this.RoomType_ID);
        Session.Add("RoomType", this.RoomType);
        Session.Add("BookingDays", this.BookingDays);
        Session.Add("Room_ID", this.Room_ID);
        Session.Add("Rate", this.Rate);
        Session.Add("RateType", this.RateType);
        Session.Add("Rate_ID", this.Rate_ID);
        Session.Add("TotalCostAfterDiscount", this.TotalCostAfterDiscount);
        //Session.Add("TotalCostAfterDiscount", this.TotalCostAfterDiscount);
        Session.Add("DiscountOffered", this.DiscountOffered);
        Session.Add("TotalCost", this.TotalCost);
        Session.Add("Discount_ID", this.Discount_ID);
        Session.Add("CardType", 1);
        //Server.Transfer("reservation.aspx", true);
        Response.Redirect("reservation.aspx", true);

    }
}