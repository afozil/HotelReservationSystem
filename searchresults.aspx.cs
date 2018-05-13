using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Drawing;
using HotelReservationSystemDAL;
using AjaxControlToolkit;

public partial class searchresults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                string checkInTime, checkOutTime, numAdults, numKids;
                CurrentPageIndex = 0;
                if (!String.IsNullOrEmpty(Request.QueryString["txtFromDate"].ToString()))
                {
                    checkInTime = Request.QueryString["txtFromDate"].ToString();
                    this.txtFromDate.Text = checkInTime;
                }
                if (!String.IsNullOrEmpty(Request.QueryString["txtToDate"].ToString()))
                {
                    checkOutTime = Request.QueryString["txtToDate"].ToString();
                    this.txtToDate.Text = checkOutTime;
                }
                if (!String.IsNullOrEmpty(Request.QueryString["drpNumberOfAdults"].ToString()))
                {
                    numAdults = Request.QueryString["drpNumberOfAdults"].ToString();
                    this.drpNumberOfAdults.SelectedValue = numAdults;
                }
                if (!String.IsNullOrEmpty(Request.QueryString["drpNumberOfChildren"].ToString()))
                {
                    numKids = Request.QueryString["drpNumberOfChildren"].ToString();
                    this.drpNumberOfChildren.SelectedValue = numKids;
                }
                btnSearch_Click(this.btnSearch, null);
            }
            catch (Exception ex) { }
        }
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

    protected void roomTypesList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int roomTypeId = Convert.ToInt32(roomTypesList.DataKeys[e.Row.RowIndex].Values[0].ToString());
            bool isOnline = Boolean.Parse(((HiddenField)e.Row.FindControl("hidIsOnline")).Value);
            DateTime fromDate = DateTime.Parse(txtFromDate.Text);
            DateTime toDate = DateTime.Parse(txtToDate.Text);
            SqlDateTime sFromDate = Utility.GetSqlDateTimeFromDateTime(fromDate);
            SqlDateTime sToDate = Utility.GetSqlDateTimeFromDateTime(toDate);
            if (isOnline)
            {
                RoomType_OnlineDetails dtls = GetRoomTypeOnlineDetails(roomTypeId);
                //Label lblDeatailsId = (Label)e.Item.FindControl("lblId");
                Label lblRooms = (Label)e.Row.FindControl("lblRooms");
                Label lblBedRooms = (Label)e.Row.FindControl("lblBedRooms");
                Label lblLivingRooms = (Label)e.Row.FindControl("lblRooms");
                Label lblBathRooms = (Label)e.Row.FindControl("lblBathRooms");
                Label lblKitchens = (Label)e.Row.FindControl("lblKitchens");
                Label lblDetails = (Label)e.Row.FindControl("lblDetails");
                lblDetails.Text = dtls.Description.ToString();
                Bookings bookings = new Bookings();
                DataTable availableRooms = new DataTable();
                if (Session["AvailableRooms"] == null)
                    availableRooms = bookings.SelectAvailableRooms(sFromDate, sToDate, roomTypeId);

                if (availableRooms.Rows.Count > 0)
                {
                    Label lblRate = (Label)e.Row.FindControl("lblRate");
                    Double rate = Convert.ToDouble(availableRooms.Rows[0]["Rate"]);
                    lblRate.Text = "KD " + rate.ToString();
                    HiddenField hidRate = (HiddenField)e.Row.FindControl("hidRate");
                    hidRate.Value = rate.ToString();
                    HiddenField hidRateType = (HiddenField)e.Row.FindControl("hidRateType");
                    hidRateType.Value = availableRooms.Rows[0]["RateType_ID"].ToString();
                    HiddenField hidRateId = (HiddenField)e.Row.FindControl("hidRateId");
                    hidRateId.Value = availableRooms.Rows[0]["Rate_ID"].ToString();

                    Label lblBookingDays = (Label)e.Row.FindControl("lblBookingDays");
                    int numberOfDaysBooked = Utility.GetNumberOfDaysFromRange(fromDate, toDate);
                    lblBookingDays.Text = numberOfDaysBooked.ToString();
                    HiddenField hidBookingDays = (HiddenField)e.Row.FindControl("hidBookingDays");
                    hidBookingDays.Value = numberOfDaysBooked.ToString();
                    HiddenField hidRoomId = (HiddenField)e.Row.FindControl("hidRoomId");
                    hidRoomId.Value = availableRooms.Rows[0]["Room_ID"].ToString();

                    Label lblPrice = (Label)e.Row.FindControl("lblCostAfterDiscount");
                    Double totalCost = rate * numberOfDaysBooked;
                    lblPrice.Text = "KD " + totalCost.ToString();
                    HiddenField hidCostAfterDiscount = (HiddenField)e.Row.FindControl("hidCostAfterDiscount");
                    hidCostAfterDiscount.Value = totalCost.ToString();

                    HiddenField hidDiscountOffered = (HiddenField)e.Row.FindControl("hidDiscountOffered");
                    hidDiscountOffered.Value = "0";
                    HiddenField hidTotalCost = (HiddenField)e.Row.FindControl("hidTotalCost");
                    hidTotalCost.Value = totalCost.ToString();
                    HiddenField hidDiscountId = (HiddenField)e.Row.FindControl("hidDiscountId");
                    hidDiscountId.Value = "0";
                }
                DataTable dt = GetRoomTypeImages(roomTypeId);
                DataList rptr = (DataList)e.Row.FindControl("roomTypeImages");
                //Repeater rptr = (Repeater)e.Row.FindControl("roomTypeImages");
                System.Web.UI.WebControls.Image defaultImage = (System.Web.UI.WebControls.Image)e.Row.FindControl("roomTypeDefaultImage");
                if (dt.Rows.Count > 0)
                {
                    defaultImage.ImageUrl = dt.Rows[0]["RoomType_ThumbnailPath"].ToString();
                    rptr.DataSource = dt;
                    rptr.DataBind();
                }

                /*
                CollapsiblePanelExtender cpe = new CollapsiblePanelExtender();
                cpe.ID = "cpeDemo";
                cpe.CollapseControlID = "roomTypeDefaultImage";
                cpe.Collapsed = true;
                cpe.CollapsedImage = "~/images/expand_blue.jpg";
                cpe.CollapsedText = "(Show Pictures...)";
                cpe.ExpandControlID = "roomTypeDefaultImage";
                cpe.ExpandedImage = "~/images/collapse_blue.jpg";
                cpe.ExpandedText = "(Hide Pictures...)";
                cpe.ImageControlID = "Image1";
                cpe.SuppressPostBack = true;
                cpe.TargetControlID = "imagePanel";
                cpe.TextLabelID = "Label1";

                Panel imagePanel = new Panel();
                imagePanel.ID = "imagePanel";
                imagePanel.CssClass = "collapsePanel";
                imagePanel.Height = 0;

                DataList roomTypeImages = new DataList();
                roomTypeImages.ID = "roomTypeImages";
                roomTypeImages.RepeatDirection = System.Web.UI.WebControls.RepeatDirection.Horizontal;
                roomTypeImages.RepeatLayout = RepeatLayout.Flow;

                HiddenField hidRoomTypeId = new HiddenField();
                hidRoomTypeId.ID = "hidRoomTypeId";
                hidRoomTypeId.Value = roomTypeId.ToString();

                ImageButton imgRoomType = new ImageButton();
                imgRoomType.ID = "imgRoomType";
                imgRoomType.Height = 100;

                DataTable dt = GetRoomTypeImages(roomTypeId);
                //DataList rptr = (DataList)e.Row.FindControl("roomTypeImages");
                System.Web.UI.WebControls.Image defaultImage = (System.Web.UI.WebControls.Image)e.Row.FindControl("roomTypeDefaultImage");
                if (dt.Rows.Count > 0)
                {
                    defaultImage.ImageUrl = dt.Rows[0]["RoomType_ThumbnailPath"].ToString();
                    //imgRoomType.ImageUrl = "RoomType_ThumbnailPath";
                    roomTypeImages.Controls.Add(hidRoomTypeId);
                    roomTypeImages.Controls.Add(imgRoomType);
                    roomTypeImages.DataSource = dt;
                    roomTypeImages.DataBind();
                }
                imagePanel.Controls.Add(roomTypeImages);


                TableCell tc = new TableCell();
                tc.Text = "&nbsp;";
                //tc.Height = Unit.Pixel(10);//you can change this to adjust to the space you want
                GridView gv = (GridView)sender;
                tc.ColumnSpan = gv.Columns.Count;
                tc.Controls.Add(cpe);
                tc.Controls.Add(imagePanel);
                tc.Controls.Add(imagePanel);

                GridViewRow gr = new GridViewRow(-1, -1, DataControlRowType.DataRow, DataControlRowState.Normal);
                gr.Cells.Add(tc);

                Table gvTable = (Table)e.Row.Parent;
                gvTable.Controls.Add(gr);
                */
            }
        }
    }

    

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //System.Threading.Thread.Sleep(3000);
        pnlResults.Visible = true;
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

        SqlInt32 numAdults = SqlInt32.Parse(drpNumberOfAdults.SelectedValue);
        SqlInt32 numKids = SqlInt32.Parse(drpNumberOfChildren.SelectedValue);
        this.hidFromDate.Value = sFromDate.ToString();
        this.hidToDate.Value = sToDate.ToString();

        this.hidNumberOfAdults.Value = numAdults.ToString();
        this.hidNumberOfChildren.Value = numKids.ToString();
        SqlInt32 numRooms = SqlInt32.Parse(this.hidNumberOfAdults.Value) + SqlInt32.Parse(this.hidNumberOfChildren.Value);
        this.hidNumberOfRooms.Value = numRooms.ToString();
    }

    private DataTable GetRoomTypes()
    {
        Bookings bookings = new Bookings();
        DateTime fromDate = DateTime.Parse(this.hidFromDate.Value);
        DateTime toDate = DateTime.Parse(this.hidToDate.Value);
        SqlDateTime sFromDate = Utility.GetSqlDateTimeFromDateTime(fromDate);
        SqlDateTime sToDate = Utility.GetSqlDateTimeFromDateTime(toDate);
        SqlInt32 numAdults = SqlInt32.Parse(this.hidNumberOfAdults.Value);
        SqlInt32 numKids = SqlInt32.Parse(this.hidNumberOfChildren.Value);
        SqlInt32 numRooms = SqlInt32.Parse(this.hidNumberOfRooms.Value);
        DataTable dt = new Bookings().SelectAvailableOnlineRoomTypes(sFromDate,
            sToDate, numRooms, numAdults, numKids);
        DataTable uniqueRoomType = new DataTable();
        if (dt.Rows.Count > 0)
        {
            uniqueRoomType = dt.AsEnumerable()
                           .GroupBy(x => x.Field<Int32>("RoomType_ID"))
                           .Select(g => g.First()).CopyToDataTable();
        }
            return uniqueRoomType;
    }

    protected void BindRoomTypes()
    {
        DataTable dt = GetRoomTypes();
        roomTypesList.DataSource = dt.DefaultView;
        roomTypesList.DataBind();
    }

    protected void roomTypesList_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.roomTypesList.PageIndex = e.NewPageIndex;
        BindRoomTypes();
    }

    protected void roomTypesList_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dt = GetRoomTypes();
        if (dt != null)
        {
            dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
            roomTypesList.DataSource = dt;
            roomTypesList.DataBind();
        }

    }

    private string GetSortDirection(string column)
    {
        string sortDirection = "ASC";
        string sortExpression = ViewState["SortExpression"] as string;
        if (sortExpression != null)
        {
            if (sortExpression == column)
            {
                string lastDirection = ViewState["SortDirection"] as string;
                if ((lastDirection != null) && (lastDirection == "ASC"))
                {
                    sortDirection = "DESC";
                }
            }
        }
        ViewState["SortDirection"] = sortDirection;
        ViewState["SortExpression"] = column;
        return sortDirection;
    }

    protected void imgRoomType_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btndetails = sender as ImageButton;
        DataListItem item = (DataListItem)btndetails.NamingContainer;
        HiddenField hidRoomType = (HiddenField)item.FindControl("hidRoomTypeId");
        int roomType = Int32.Parse(hidRoomType.Value);
        BindGallery(roomType);
    }

    protected void BindGallery(int roomType)
    {
        DataTable dt = GetRoomTypePictures(roomType);


    }

    protected DataTable GetRoomTypePictures(int roomType)
    {
        DataTable dt = new DataTable();
        RoomType_Image image = new RoomType_Image();
        image.RoomType_ID = roomType;
        dt = image.SelectAll();
        return dt;
    }


    protected void roomTypesList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int RoomTypeId = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "DefaultImageClick")
        {
            GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
            ModalPopupExtender mpe = (ModalPopupExtender)row.FindControl("ModalPopupExtender1");
            mpe.Show();

        }
        if (e.CommandName == "BookNow")
        {
            SetSearchCriteria();

            Response.Redirect("reservation.aspx", true);
        }
    }
}