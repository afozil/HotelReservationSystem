using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
public partial class Hotel_Rooms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindGridView();
            BindRoomTypes();
            BindRoomStatuses();
            BindProperties();
        }
    }

    private void BindGridView()
    {
        DataTable table = new Rooms().SelectAll();
        grid.DataSource = table;
        grid.DataBind();
    }

    private void BindRoomTypes(){
        DataTable table = new RoomTypes().SelectAll();
        drpRoomType.DataSource = table;
        drpRoomType.DataTextField = table.Columns["RoomType_EN"].ToString();
        drpRoomType.DataValueField = table.Columns["RoomType_ID"].ToString();
        drpRoomType.DataBind();
    }
    private void BindRoomStatuses(){
        DataTable table = new RoomStatuses().SelectAll();
        drpRoomStatus.DataSource = table;
        drpRoomStatus.DataTextField = table.Columns["RoomStatus_EN"].ToString();
        drpRoomStatus.DataValueField = table.Columns["RoomStatus_ID"].ToString();
        drpRoomStatus.DataBind();
    }          
     private void BindProperties(){
         DataTable table = new Properties().SelectAll();
         drpProperty.DataSource = table;
         drpProperty.DataTextField = table.Columns["PropertyName_EN"].ToString();
         drpProperty.DataValueField = table.Columns["PropertyID"].ToString();
         drpProperty.DataBind();
    }             
    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        try
        {
            string strRoomID = grid.Rows[e.RowIndex].Cells[0].Text;
            Rooms room = new Rooms();
            room.Room_ID = int.Parse(strRoomID);
            room.SelectOne();
            room.Delete();
            CurrentRoomStatus crRmStatus = new CurrentRoomStatus();

            crRmStatus.RoomStatus = Int32.Parse(grid.Rows[e.RowIndex].Cells[6].Text);
            crRmStatus.Room_ID=room.Room_ID;
            crRmStatus.Delete();

            // bool retval=new Rooms().Delete(room.Room_ID)

            BindGridView();
        }
        catch (Exception ex) { }
    }

}