using System;
using System.Data;
using HotelReservationSystemDAL;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mybooking : System.Web.UI.Page
{
    DataTable tbl;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void hlnkReservationNumber_Click(object sender, EventArgs e)
    {
        ClearBinding();
        tbl = Search(searchCriteria: "1", searchTerm: txtSearchTerm.Text.Trim());
        BindReservationDetails(tbl);
    }

    protected void hlnkMobile_Click(object sender, EventArgs e)
    {
        ClearBinding();
        tbl = Search(searchCriteria: "2", searchTerm: txtSearchTerm.Text.Trim());
        BindReservationDetails(tbl);
    }

    protected void hlnkCivilId_Click(object sender, EventArgs e)
    {
        ClearBinding();
        tbl = Search(searchCriteria: "3", searchTerm: txtSearchTerm.Text.Trim());
        BindReservationDetails(tbl);
    }

    private DataTable Search(string searchCriteria, string searchTerm, string tableName = "Reservations")
    {
        tbl = new Reservations().Search(tableName, searchCriteria, searchTerm);
        return tbl;
    }

    private void BindReservationDetails(DataTable tbl)
    {
        if (tbl != null && tbl.Rows.Count > 0)
        {
            this.lblReservationDate.Text = ((DateTime)tbl.Rows[0]["ReservationDate"]).ToString("dd-MMM-yyyy");
            this.lblReservationNumber.Text = tbl.Rows[0]["Reservation_ID"].ToString();
            this.lblFromDate.Text = ((DateTime)tbl.Rows[0]["FromDate"]).ToString("dd-MMM-yyyy");
            this.lblToDate.Text = ((DateTime)tbl.Rows[0]["ToDate"]).ToString("dd-MMM-yyyy");
            this.lblGuest.Text = tbl.Rows[0]["Guest"].ToString();
            this.lblMobileNumber.Text = tbl.Rows[0]["MobileNumber"].ToString();
            this.lblCivilId.Text = tbl.Rows[0]["Civil_ID"].ToString();
            this.lblPassportNumber.Text = tbl.Rows[0]["PassportNumber"].ToString();
            this.lblPaymentStatus.Text = tbl.Rows[0]["PaymentStatus_EN"].ToString();
            this.lblBookingStatus.Text = tbl.Rows[0]["BookingStatus_EN"].ToString();
            this.lblPaymentId.Text = tbl.Rows[0]["Payment_ID"].ToString();
            this.lblRate.Text = tbl.Rows[0]["Rate"].ToString();
            this.lblCostAfterDiscount.Text = tbl.Rows[0]["TotalCost_After_Discount"].ToString();
            this.lblBookingDays.Text = tbl.Rows[0]["UnitsConsumed"].ToString();

        }
    }
    private void ClearBinding()
    {
        this.lblReservationDate.Text = string.Empty;
        this.lblReservationNumber.Text = string.Empty;
        this.lblFromDate.Text = string.Empty;
        this.lblToDate.Text = string.Empty;
        this.lblGuest.Text = string.Empty;
        this.lblMobileNumber.Text = string.Empty;
        this.lblCivilId.Text = string.Empty;
        this.lblPassportNumber.Text = string.Empty;
        this.lblPaymentStatus.Text = string.Empty;
        this.lblBookingStatus.Text = string.Empty;
        this.lblPaymentId.Text = string.Empty;
        this.lblRate.Text = string.Empty;
        this.lblCostAfterDiscount.Text = string.Empty;
        this.lblBookingDays.Text = string.Empty;
    }
}