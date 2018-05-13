using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;

using System.Data;
using System.Data.SqlTypes;

public partial class Hotel_ReservationsList : System.Web.UI.Page
{
    private DataTable _allReservations;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindGridView();
            BindPaymentStatus();
        }
    }

    private DataTable GetAllReservations()
    {
        if (_allReservations == null)
            _allReservations = new Reservations().SelectAll();

        return _allReservations;
    }

    private void BindPaymentStatus()
    {
        _allReservations = GetOccupancyList();
        try
        {
            DataView dv = new DataView(_allReservations);
            DataTable bookingStatusTable = dv.ToTable(true, "PaymentStatus", "PaymentStatus_EN");
            drpPaymentStatus.DataSource = bookingStatusTable;
            drpPaymentStatus.DataTextField = "PaymentStatus_EN";
            drpPaymentStatus.DataValueField = "PaymentStatus";
            drpPaymentStatus.DataBind();
        }
        catch (Exception ex) { }
        drpPaymentStatus.Items.Insert(0, new ListItem("Select a Payment Status...", "-1"));
    }

    private DataTable GetOccupancyList()
    {
        DataTable table = GetAllReservations();
        DataTable bookingStatusTbl = new DataTable();
        if (table != null)
        {
            IEnumerable<DataRow> query = (from reservationsRow in table.AsEnumerable()
                                          where reservationsRow.Field<Int32>("BookingStatus") == BookingStatus.CONFIRMED
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
        grid.DataSource = GetOccupancyList();
        grid.DataBind();
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        BindGridView();
    }

    protected void grid_Sorting(object sender, GridViewSortEventArgs e)
    {

        DataTable dt = GetOccupancyList();
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

    protected void txtCheckInDate_TextChanged(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtCheckInDate.Text))
            return;
        _allReservations = GetOccupancyList();
        IEnumerable<DataRow> query = (from reservationsRow in _allReservations.AsEnumerable()
                                      where reservationsRow.Field<Int32>("BookingStatus") == BookingStatus.CONFIRMED &&
                                      reservationsRow.Field<DateTime>("CheckIn_Date") == DateTime.Parse(txtCheckInDate.Text)
                                      select reservationsRow);
        DataTable bookingStatusTbl = new DataTable();
        try
        {
            if (query != null)
                bookingStatusTbl = query.CopyToDataTable();
        }
        catch (Exception ex) { }
        grid.DataSource = bookingStatusTbl;
        grid.DataBind();
    }
    protected void drpPaymentStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpPaymentStatus.SelectedValue == "-1")
            return;
        _allReservations = GetAllReservations();
        if (_allReservations == null || _allReservations.Rows.Count <= 0)
            return;


        IEnumerable<DataRow> query = (from reservationsRow in _allReservations.AsEnumerable()
                                      where reservationsRow.Field<Int32>("BookingStatus") == BookingStatus.CONFIRMED &&
                                      reservationsRow.Field<Int32>("PaymentStatus") == Int32.Parse(drpPaymentStatus.SelectedValue)
                                      select reservationsRow);

        DataTable bookingStatusTbl = query.CopyToDataTable();
        grid.DataSource = bookingStatusTbl;
        grid.DataBind();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReservationsList.aspx", true);
    }
}