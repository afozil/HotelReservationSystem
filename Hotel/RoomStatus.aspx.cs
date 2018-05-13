using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;

public partial class Hotel_RoomStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindGridView();
        }

    }

    private void BindGridView()
    {
        DataTable table = new RoomStatuses().SelectAll();
        grid.DataSource = table;
        grid.DataBind();
    }
    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        try
        {
            string strRoomID = grid.Rows[e.RowIndex].Cells[0].Text;
            RoomStatuses room = new RoomStatuses();
            room.RoomStatus_ID = int.Parse(strRoomID);
            room.SelectOne();
            room.Delete();
            // bool retval=new Rooms().Delete(room.Room_ID)

            BindGridView();
        }
        catch (Exception ex) { }
    }


}