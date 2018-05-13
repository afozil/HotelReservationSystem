using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Data.SqlTypes;
using System.Data.SqlClient;

public partial class Hotel_Arrivals : System.Web.UI.Page
{
    private DataTable allReservations;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            
            BindGridView();
            BindBookingStatus();
        }
    }

    private DataTable GetAllReservations()
    {
        if(allReservations == null)
            allReservations = new Reservations().SelectAll();

        return allReservations;

    }
    
    private void BindGridView()
    {
        reservationsGrid.DataSource = GetArrivals();
        reservationsGrid.DataBind();
    }

    private void BindBookingStatus()
    {
        allReservations = GetArrivals();
        DataView dv = new DataView(allReservations);
        DataTable bookingStatusTable = dv.ToTable(true, "BookingStatus", "BookingStatus_EN");
        drpBookingStatus.DataSource = bookingStatusTable;
        drpBookingStatus.DataTextField = "BookingStatus_EN";
        drpBookingStatus.DataValueField = "BookingStatus";
        drpBookingStatus.DataBind();
        drpBookingStatus.Items.Insert(0, new ListItem("Select a Booking Status...", "-1"));
    }

    private DataTable GetArrivals()
    {
        DataTable table = GetAllReservations();
        DataTable bookingStatusTbl = new DataTable();
        if (table != null)
        {
            IEnumerable<DataRow> query = (from reservationsRow in table.AsEnumerable()
                                          where 
                                          reservationsRow.Field<Int32>("BookingStatus") == BookingStatus.CONFIRMED ||
                                          reservationsRow.Field<Int32>("BookingStatus") == BookingStatus.TENTATIVE &&
                                          reservationsRow.Field<DateTime>("ReservationDate") <= DateTime.Today 
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


    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("Arrivals.aspx", true);
    }


    protected void drpBookingStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(drpBookingStatus.SelectedValue == "-1")
            return;
        allReservations = GetArrivals();
        if (allReservations == null || allReservations.Rows.Count <= 0)
            return;


        IEnumerable<DataRow> query = (from reservationsRow in allReservations.AsEnumerable()
                                      where reservationsRow.Field<Int32>("BookingStatus") == Int32.Parse(drpBookingStatus.SelectedValue)
                                      select reservationsRow);

        DataTable bookingStatusTbl = query.CopyToDataTable();
        reservationsGrid.DataSource = bookingStatusTbl;
        reservationsGrid.DataBind();
    }

    protected void reservationsGrid_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        reservationsGrid.PageIndex = e.NewPageIndex;
        BindGridView();
    }

    protected void reservationsGrid_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dt = GetArrivals();
        if (dt != null)
        {
            dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
            reservationsGrid.DataSource = dt;
            reservationsGrid.DataBind();
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


    protected void txtBookingDate_TextChanged(object sender, EventArgs e)
    {
        if(string.IsNullOrEmpty(txtBookingDate.Text))
            return;

        if (DateTime.Parse(txtBookingDate.Text) > DateTime.Today)
            return;

        allReservations = GetArrivals();
        IEnumerable<DataRow> query = (from reservationsRow in allReservations.AsEnumerable()
                                      where reservationsRow.Field<Int32>("BookingStatus") == BookingStatus.CONFIRMED ||
                                          reservationsRow.Field<Int32>("BookingStatus") == BookingStatus.TENTATIVE &&
                                      reservationsRow.Field<DateTime>("ReservationDate") == DateTime.Parse(txtBookingDate.Text) 
                                      select reservationsRow);
        DataTable bookingStatusTbl = new DataTable();
        try
        {
            if (query != null)
                bookingStatusTbl = query.CopyToDataTable();
        }
        catch (Exception ex){}
        reservationsGrid.DataSource = bookingStatusTbl;
        reservationsGrid.DataBind();
    }
}