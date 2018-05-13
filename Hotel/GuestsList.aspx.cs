using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Drawing;

public partial class Hotel_GuestsList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindGridView();
        }
    }

    private DataTable GetGuests()
    {
        DataTable table = new Guests().SelectAll();
        return table;
    }

    private void BindGridView()
    {
        DataTable table = GetGuests();
        grid.DataSource = table;
        grid.DataBind();
    }

    protected void btnSrchGuest_Click(object sender, EventArgs e)
    {
        string selectedValue = drpSrchCriteria.SelectedValue;
        string columnName = string.Empty;
        switch (selectedValue)
        {
            case "1":
                columnName = "FirstName";
                break;
            case "2":
                columnName = "MobileNumber";
                break;
            case "3":
                columnName = "Civil_ID";
                break;
            default:
                columnName = "FirstName";
                    break;
        }
        string searchValue = txtSrchValue.Text;
        DataTable table = new Guests().Search("Guests",columnName, searchValue);
        grid.DataSource = table;
        grid.DataBind();
    }


    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("GuestsList.aspx", true);
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        BindGridView();
    }

    protected void grid_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dt = GetGuests();
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
            LinkButton l = (LinkButton)e.Row.FindControl("lnkDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete this record " +
            DataBinder.Eval(e.Row.DataItem, "Guest_ID") + "')");
        }
    }

    protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int guestId = Convert.ToInt32(e.CommandArgument);
            DeleteGuest(guestId);
        }
    }

    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int guestId = Int32.Parse(grid.Rows[e.RowIndex].Cells[0].Text);
            DeleteGuest(guestId);
        }
        catch (Exception ex) { }
    }

    private void DeleteGuest(int guestId)
    {
        Guests guest = new Guests();
        guest.Guest_ID = guestId;
        guest.SelectOne();
        if(guest.Delete())
        BindGridView();
        else if (guest.ErrorCode == -10)
        {
            lblMsg.Text = "Cannot Delete. Guest has active reservations";
            lblMsg.ForeColor = Color.Red;
        }
    }
}