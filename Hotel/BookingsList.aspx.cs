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

public partial class Hotel_BookingsList : System.Web.UI.Page
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
        reservationsGrid.DataSource = GetAllReservations();
        reservationsGrid.DataBind();
    }

    private void BindBookingStatus()
    {
        allReservations = GetAllReservations();
        DataView dv = new DataView(allReservations);
        DataTable bookingStatusTable = dv.ToTable(true, "BookingStatus", "BookingStatus_EN");
        drpBookingStatus.DataSource = bookingStatusTable;
        drpBookingStatus.DataTextField = "BookingStatus_EN";
        drpBookingStatus.DataValueField = "BookingStatus";
        drpBookingStatus.DataBind();
        drpBookingStatus.Items.Insert(0, new ListItem("Select a Booking Status...", "-1"));
    }


    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("BookingsList.aspx", true);
    }


    protected void drpBookingStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(drpBookingStatus.SelectedValue == "-1")
            return;
        allReservations = GetAllReservations();
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
        DataTable dt = GetAllReservations();
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
        DateTime rsrvDate = DateTime.Parse(txtBookingDate.Text);
        
        allReservations = GetAllReservations();
        IEnumerable<DataRow> query = (from reservationsRow in allReservations.AsEnumerable()
                                      where reservationsRow.Field<DateTime>("ReservationDate").Date == rsrvDate.Date
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