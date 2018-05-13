using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Data.SqlTypes;
using System.Drawing;


public partial class Hotel_UpdateRoomStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int roomId = 0;
         int roomStatusId=0;
        if (!Page.IsPostBack)
        {
            BindRooms();
            BindRoomStatuses();
            drpRooms.Items.Insert(0, new ListItem("Select a Room...", "-1"));
            drpStatus.Items.Insert(0, new ListItem("Select a Room Status...", "-1"));
            roomId = (Request.Params["Room_ID"] == null || Request.Params["Room_ID"].Equals(string.Empty)) ? 0 : Int32.Parse(Request.Params["Room_ID"]);
            roomStatusId = (Request.Params["RoomStatus"] == null || Request.Params["RoomStatus"].Equals(string.Empty)) ? 0 : Int32.Parse(Request.Params["RoomStatus"]);
        }
        if (roomId != 0)
            BindRoom(roomId);

    }

    protected void BindRoom(int roomId)
    {
        Rooms room = new Rooms();
        room.Room_ID = roomId;
        DataTable table = room.SelectOne();
        drpRooms.ClearSelection();
        drpRooms.Items.FindByValue(roomId.ToString()).Selected = true;
        ltrlNumber.Text = room.RoomNumber.ToString();
        ltrlCurrentStatus.Text = room.RoomStatus_STR.ToString();
        ltrlProperty.Text = room.Property_STR.ToString();
        ltrlRoomType.Text = room.RoomType_STR.ToString();
        txtRemarks.Text = room.Remarks.ToString();
        drpStatus.ClearSelection();
        drpStatus.Items.FindByValue(room.RoomStatus_ID.ToString()).Selected = true;

    }

    protected void BindRooms()
    {
        DataTable table = new Rooms().SelectAll();
        drpRooms.DataSource = table;
        drpRooms.DataTextField = table.Columns["RoomName_EN"].ToString();
        drpRooms.DataValueField = table.Columns["Room_ID"].ToString();
        drpRooms.DataBind();
        
    }
    protected void BindRoomStatuses()
    {
        DataTable table = new RoomStatuses().SelectAll();
        drpStatus.DataSource = table;
        drpStatus.DataTextField = table.Columns["RoomStatus_EN"].ToString();
        drpStatus.DataValueField = table.Columns["RoomStatus_ID"].ToString();
        drpStatus.DataBind();
        
    }
    protected void drpRooms_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMsg.Text = string.Empty;
        int roomId = Int32.Parse(drpRooms.SelectedValue);
        if (roomId != -1)
            BindRoom(roomId);
        else
        {
            drpRooms.ClearSelection();
            ltrlNumber.Text =string.Empty;
            ltrlCurrentStatus.Text = string.Empty;
            ltrlProperty.Text = string.Empty;
            ltrlRoomType.Text = string.Empty;
            txtRemarks.Text = string.Empty;
            drpStatus.ClearSelection();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Rooms room = new Rooms();
        if (!drpRooms.SelectedValue.Equals("-1"))
            room.Room_ID = Int32.Parse(drpRooms.SelectedValue);
       
        if (!drpStatus.SelectedValue.Equals("-1")) 
            room.RoomStatus_ID = Int32.Parse(drpStatus.SelectedValue);
        room.LastModifiedDate = new SqlDateTime(DateTime.Now);
        room.LastModifiedUser = 1;
        room.Is_Out_Of_Order = 0;
        room.Remarks = txtRemarks.Text;
        if (room.RoomStatus_STR.Equals("OUT_OF_ORDER"))
        {
            room.Is_Out_Of_Order = 1;
            room.Out_Of_Order_FromDate = new SqlDateTime(DateTime.Now);
            room.Out_Of_Order_MarkedBy = 1;
            room.Out_Of_Order_ToDate = new SqlDateTime(DateTime.Now);
        }
        if (room.UpdateStatus())
        {
            if (User.IsInRole(Roles.HOUSE_KEEPING))
            {
                lblMsg.Text = "Successfully updated";
                lblMsg.ForeColor = Color.Green;
            }else
                Response.Redirect("~/Configuration/Rooms.aspx", true);
        }
        else
        {
            lblMsg.Text = "Failed to update";
            lblMsg.ForeColor = Color.Red;
        }
            
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("UpdateRoomStatus.aspx", true);
    }
    protected void cstmValdStatus_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (drpStatus.SelectedValue.Equals("-1"))
            args.IsValid = false;
    }
}