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

public partial class Hotel_Rooms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.IsInRole(Roles.HOUSE_KEEPING))
            Response.Redirect("~/Hotel/UpdateRoomStatus.aspx", true);

        if (!Page.IsPostBack)
        {
            BindGridView(1);
            BindRoomTypes();
            BindRoomStatuses();
        }
    }

    private DataTable GetAllRooms()
    {
        DataTable table = new Rooms().SelectAll();
        return table;
    }

    private DataTable GetRoomsByType()
    {
        Rooms room = new Rooms();
        room.RoomType_ID = SqlInt32.Parse(drpRoomType.SelectedValue);
        DataTable table = room.SelectByType();
        return table;
    }

    private DataTable GetRoomsByStatus()
    {
        Rooms room = new Rooms();
        room.RoomStatus_ID = SqlInt32.Parse(drpRoomStatus.SelectedValue);
        DataTable table = room.SelectByStatus();
        return table;
    }

    private void BindGridView(int filter)
    {
        DataTable table = null;
        switch (filter){
            case 1:
                table = GetAllRooms();
                break;
            case 2:
                table = GetRoomsByType();
                break;
            case 3:
                table = GetRoomsByStatus();
                break;
            default:
                table = GetAllRooms();
                break;
        }
       
        grid.DataSource = table;
        grid.DataBind();
    }

    private void BindRoomTypes(){
        DataTable table = new RoomTypes().SelectAll();
        drpRoomType.DataSource = table;
        drpRoomType.DataTextField = table.Columns["RoomType_EN"].ToString();
        drpRoomType.DataValueField = table.Columns["RoomType_ID"].ToString();
        drpRoomType.DataBind();
        drpRoomType.Items.Insert(0, new ListItem("Select a Room Type...", "-1"));
    }

    private void BindRoomStatuses(){
        DataTable table = new RoomStatuses().SelectAll();
        drpRoomStatus.DataSource = table;
        drpRoomStatus.DataTextField = table.Columns["RoomStatus_EN"].ToString();
        drpRoomStatus.DataValueField = table.Columns["RoomStatus_ID"].ToString();
        drpRoomStatus.DataBind();
        drpRoomStatus.Items.Insert(0, new ListItem("Select a Room Status...", "-1"));
    }  

    protected void drpRoomType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpRoomType.SelectedValue == "-1")
            return;

        BindGridView(2);

    }
    protected void drpRoomStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpRoomStatus.SelectedValue == "-1")
            return;

        BindGridView(3);

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Rooms.aspx", true);
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        if(drpRoomType.SelectedValue != "-1")
            BindGridView(2);
        else if (drpRoomStatus.SelectedValue != "-1")
            BindGridView(3);
        else
            BindGridView(1);

    }

    protected void grid_Sorting(object sender, GridViewSortEventArgs e)
    {
        int roomTypeId = Int32.Parse(drpRoomType.SelectedValue) == -1 ? -1 : Int32.Parse(drpRoomType.SelectedValue);
        int roomStatus = Int32.Parse(drpRoomStatus.SelectedValue) == -1 ? -1 : Int32.Parse(drpRoomStatus.SelectedValue);
        DataTable dt = null;
        if(roomTypeId != -1)
            dt = GetRoomsByType();
        else if (roomStatus != -1)
             dt = GetRoomsByStatus();
        else
            dt = GetAllRooms();

        if (dt != null)
        {
            dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
            grid.DataSource = dt;
            grid.DataBind();
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


    protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            /* Commented out due to Delete button being disabled. Uncomment when decided to go with delete
            LinkButton l = (LinkButton)e.Row.FindControl("lnkDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete this record " +
            DataBinder.Eval(e.Row.DataItem, "RoomType_ID") + "')");
             * */
        }
    }

    protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int roomId = Convert.ToInt32(e.CommandArgument);
            DeleteRoom(roomId);
        }
    }
    
    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int roomId = Int32.Parse( grid.Rows[e.RowIndex].Cells[0].Text);
            DeleteRoom(roomId);
        }
        catch (Exception ex) { }
    }

    private void DeleteRoom(int roomId)
    {
        Rooms room = new Rooms();
        room.Room_ID = roomId;
        room.SelectOne();
        if (room.Delete())
        {
            CurrentRoomStatus crRmStatus = new CurrentRoomStatus();
            crRmStatus.RoomStatus = 1 /*Int32.Parse(grid.Rows[e.RowIndex].Cells[6].Text)*/;
            crRmStatus.Room_ID = room.Room_ID;
            crRmStatus.Delete();
            BindGridView(1);
        }else {
            if (room.ErrorCode == -10)
            {
                lblMsg.Text = "Cannot Delete. There is an active Reservation for this Room";
                lblMsg.ForeColor = Color.Red;
                return;
            }
         }
    }

}