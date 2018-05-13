using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;
using HotelReservationSystemDAL;

public partial class CheckAvailability : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
            BindRoomTypes();
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
    protected void lnkSearch_Click(object sender, EventArgs e)
    {
 
        DateTime fromDate = DateTime.Parse(txtFromDate.Text);
        DateTime toDate = DateTime.Parse(txtToDate.Text);
        lblError.Text = string.Empty;
        if (fromDate < DateTime.Now.Date)
        {
            lblError.Text = "Booking date cannot be before today";
            return;
        }
        if (fromDate > toDate)
        {
            lblError.Text = "Check-In date seems to be after Check-Out date";
            return;
        }

        SqlDateTime sFromDate = new SqlDateTime(fromDate);
        SqlDateTime stoDate = new SqlDateTime(toDate);
        DataTable table;
        if(drpRoomTypes.SelectedValue=="-1")
            table =  new Bookings().SelectAvailableRoomTypes(sFromDate, stoDate);
        else
        {
            SqlInt32 roomType = SqlInt32.Parse(drpRoomTypes.SelectedValue);
            table = new Bookings().SelectAvailableRooms(sFromDate, stoDate, roomType);
        }
           
        RoomTypesList.DataSource = table;
        RoomTypesList.DataBind();
       


    }
    protected void lnkBookNow_Click(object sender, EventArgs e)
    {
        string roomId = ((LinkButton)sender).CommandArgument;
        Rooms room = new Rooms();
        room.Room_ID = Int32.Parse(roomId);
        room.SelectOne();
        Response.Redirect("BookRoom.aspx?Room_ID=" + room.Room_ID + "&RoomType_ID=" + room.RoomType_ID + "&FromDate=" + txtFromDate.Text + "&ToDate=" + txtToDate.Text, true);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckAvailability.aspx", true);
    }
}