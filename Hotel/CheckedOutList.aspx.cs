using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Data.SqlTypes;

public partial class Hotel_CheckedOutList : System.Web.UI.Page
{
    private DataTable _allReservations;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindGridView();
        }
    }

    private DataTable GetAllReservations()
    {
        if (_allReservations == null)
            _allReservations = new Reservations().SelectAll();

        return _allReservations;
    }

    private DataTable GetCheckedOutList()
    {
        DataTable table = GetAllReservations();
        DataTable bookingStatusTbl = new DataTable();
        if (table != null)
        {
            IEnumerable<DataRow> query = (from reservationsRow in table.AsEnumerable()
                                          where reservationsRow.Field<Int32>("BookingStatus") == BookingStatus.CHECKED_OUT
                                          select reservationsRow);
            try
            {
                if (query != null)
                    bookingStatusTbl = query.CopyToDataTable();
            }
            catch (Exception e)
            {

            }
        }
        return bookingStatusTbl;
    }

    private void BindGridView()
    {
        grid.DataSource = GetCheckedOutList();
        grid.DataBind();
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        BindGridView();
    }

    protected void grid_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dt = GetCheckedOutList();
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
}