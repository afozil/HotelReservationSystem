using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;

public partial class Hotel_RoomTypes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindGridView(0);
            BindRoomTypes();
        }

    }

    private void BindGridView(int roomTypeId)
    {
        DataTable table = null;
        RoomTypes roomType = new RoomTypes();
        if (roomTypeId == 0)
        {
            table = roomType.SelectAll();
        }
        else
        {
            roomType.RoomType_ID = roomTypeId;
            table = roomType.SelectOne();
        }

        grid.DataSource = table;
        grid.DataBind();

    }

    private void BindRoomTypes()
    {
        DataTable table = new RoomTypes().SelectAll();
        drpRoomType.DataSource = table;
        drpRoomType.DataTextField = table.Columns["RoomType_EN"].ToString();
        drpRoomType.DataValueField = table.Columns["RoomType_ID"].ToString();
        drpRoomType.DataBind();
    }



    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        try
        {
            string strRoomID = grid.Rows[e.RowIndex].Cells[0].Text;
            RoomTypes room = new RoomTypes();
            room.RoomType_ID = int.Parse(strRoomID);
            room.SelectOne();
            room.Delete();
            // bool retval=new Rooms().Delete(room.Room_ID)

            BindGridView(0);
        }
        catch (Exception ex) { }
    }



    protected void drpRoomType_SelectedIndexChanged(object sender, EventArgs e)
    {
        int roomTypeId = Int32.Parse(drpRoomType.SelectedValue);
        BindGridView(roomTypeId);
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("RoomTypes.aspx", true);
    }
}