using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;
using HotelReservationSystemDAL;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            CurrentPageIndex = 0;
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


    protected void BindRoomTypes()
    {
        DataTable dt = new RoomTypes().SelectAll();
        PagedDataSource pgd = new PagedDataSource();
        pgd.DataSource = dt.DefaultView;
        pgd.CurrentPageIndex = CurrentPageIndex;
        pgd.AllowPaging = true;
        pgd.PageSize = 5;

        int rowCount = dt.Rows.Count;
        roomTypesList.DataSource = pgd;
        roomTypesList.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindRoomTypes();
    }

    protected void roomTypesList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item ||
            e.Item.ItemType == ListItemType.AlternatingItem)
        {
            int roomTypeId = Convert.ToInt32(roomTypesList.DataKeys[e.Item.ItemIndex]);
            bool isOnline = Boolean.Parse(((HiddenField)e.Item.FindControl("hidIsOnline")).Value);
            if (isOnline)
            {
                RoomType_OnlineDetails dtls = GetRoomTypeOnlineDetails(roomTypeId);
                Label lblDeatailsId = (Label)e.Item.FindControl("lblId");
                Label lblRooms = (Label)e.Item.FindControl("lblRooms");
                Label lblBedRooms = (Label)e.Item.FindControl("lblRooms");
                Label lblLivingRooms = (Label)e.Item.FindControl("lblRooms");
                Label lblBathRooms = (Label)e.Item.FindControl("lblRooms");
                Label lblKitchens = (Label)e.Item.FindControl("lblKitchens");
                Label lblDetails = (Label)e.Item.FindControl("lblDetails");
                lblDeatailsId.Text = dtls.RoomType_Online_ID.ToString();
                lblRooms.Text = dtls.Number_of_Rooms.ToString();
                lblBedRooms.Text = dtls.Number_of_BedRooms.ToString();
                lblLivingRooms.Text = dtls.Number_of_LivingRooms.ToString();
                lblBathRooms.Text = dtls.Number_of_BathRooms.ToString();
                lblKitchens.Text = dtls.Number_of_Kitchens.ToString();
                lblDetails.Text = dtls.Description.ToString();

                Label lblRoomTypeId = (Label)e.Item.FindControl("lblRoomTypeId");
                lblRoomTypeId.Text = roomTypeId.ToString();

                DataTable dt = GetRoomTypeImages(roomTypeId);
                Image defaultImage = (Image)e.Item.FindControl("roomTypeDefaultImage");
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

    protected void lnkNext_Click(object sender, EventArgs e)
    {
        CurrentPageIndex++;
        BindRoomTypes();
    }

    protected void lnkPrevious_Click(object sender, EventArgs e)
    {
        CurrentPageIndex--;
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

}