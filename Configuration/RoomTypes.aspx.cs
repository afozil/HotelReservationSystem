using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Drawing;

public partial class Hotel_RoomTypes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindRoomTypes();
            BindGridView();
        }
    }

    private DataTable GetRoomTypes(int roomTypeId)
    {
        DataTable table = null;
        RoomTypes roomType = new RoomTypes();
        if (roomTypeId == 0)
            table = roomType.SelectAll();
        else
        {
            roomType.RoomType_ID = roomTypeId;
            table = roomType.SelectOne();
        }
        return table;
    }

    private void BindGridView()
    {
        int roomTypeId = Int32.Parse( drpRoomType.SelectedValue) == -1 ? 0 : Int32.Parse( drpRoomType.SelectedValue);
        DataTable table = GetRoomTypes(roomTypeId);
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
        drpRoomType.Items.Insert(0, new ListItem("Select a Room Type", "-1"));
    }

    protected void drpRoomType_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGridView();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("RoomTypes.aspx", true);
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        BindGridView();
    }

    protected void grid_Sorting(object sender, GridViewSortEventArgs e)
    {
        int roomTypeId = Int32.Parse(drpRoomType.SelectedValue) == -1 ? 0 : Int32.Parse(drpRoomType.SelectedValue);
        DataTable dt = GetRoomTypes(roomTypeId);
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


    protected void grid_RowDataBound(object sender,GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton l = (LinkButton)e.Row.FindControl("lnkDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete this record " +
            DataBinder.Eval(e.Row.DataItem, "RoomType_ID") + "')");
        }
    }

    protected void grid_RowCommand(object sender,GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int roomTypeId = Convert.ToInt32(e.CommandArgument);
            DeleteRomType(roomTypeId);
        }
    }

    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int roomTypeId = Int32.Parse(grid.Rows[e.RowIndex].Cells[0].Text);
            DeleteRomType(roomTypeId);
        }
        catch (Exception ex) { }
    }

    private void DeleteRomType(int roomTypeId)
    {
        RoomTypes room = new RoomTypes();
        room.RoomType_ID = roomTypeId;
        room.SelectOne();
        if(room.Delete())
            BindGridView();
        else
        {
            if (room.ErrorCode == -10)
                lblMsg.Text = "Cannot Delete. This Room Type is associated with Rates";
            else if (room.ErrorCode ==-20)
                lblMsg.Text = "Cannot Delete. This Room Type is associated with Rooms";
            lblMsg.ForeColor = Color.Red;
        }
    }
}