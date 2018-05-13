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

public partial class Hotel_CheckOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["Reservation_ID"] != null){
                hidReservationId.Value = Request.Params["Reservation_ID"] != null || Request.Params["Reservation_ID"] != "" ? Request.Params["Reservation_ID"].ToString() : "0";
                ConfirmCheckOut(SqlInt32.Parse(hidReservationId.Value));
            }
            BindPaymentModes();
        }
        txtCheckOutDate.Text = DateTime.Today.ToString("MM/dd/yyyy");
    }

    private void BindPaymentModes()
    {
        DataTable table = new PaymentModes().SelectAll();
        drpPaymentModes.DataSource = table;
        drpPaymentModes.DataTextField = table.Columns["PaymentMode"].ToString();
        drpPaymentModes.DataValueField = table.Columns["PaymentMode_ID"].ToString();
        drpPaymentModes.DataBind();
        drpPaymentModes.Items.Insert(0, new ListItem("Select a Payment Mode...", "-1"));
    }


    private void ConfirmCheckOut(SqlInt32 reserationId)
    {
        if (reserationId == 0)
        {
            this.lblMsg.Text = "Invalid Reservation. Try Again";
            lblMsg.ForeColor = Color.Red;
            return;
        }

        Reservations r = new Reservations();
        r.Reservation_ID = reserationId;
        r.SelectOne();

        Reservation_Payments rps = new Reservation_Payments();
        rps.Reservation_ID = reserationId;
        DataTable rpsTable = rps.SelectAll();

        CheckIn chkIn = new CheckIn();
        chkIn.Reservation_ID = reserationId;
        chkIn.SelectOne();

        lblBookingFromDate.Text = r.FromDate.Value.ToString("MMMM d, yyyy");
        lblBookingToDate.Text = r.ToDate.Value.ToString("MMMM d, yyyy");
        int bookedDays = Utility.GetNumberOfDaysFromRange(r.FromDate.Value, r.ToDate.Value);
        lblBookedDays.Text = bookedDays.ToString();
        lblCheckInDate.Text = chkIn.CheckIn_Date.Value.ToString("MMMM d, yyyy");
        SqlDateTime chkOutDate = Utility.GetSqlCheckOutTimeFromDate(DateTime.Now);
        if(r.ToDate.Value >= DateTime.Now)
            chkOutDate = r.ToDate;

        lblCheckOutDate.Text = chkOutDate.Value.ToString("MMMM d, yyyy");
        int stayedDays = Utility.GetNumberOfDaysFromRange(r.FromDate.Value, chkOutDate.Value);
        lblStayedDays.Text = stayedDays.ToString();

        CheckOut chkOut = new CheckOut();
        chkOut.Reservation_ID = reserationId;
        DataTable table = chkOut.ConfirmCheckOut();
        grid.DataSource = table;
        grid.DataBind();

        SqlMoney pendingAmount =new SqlMoney(0.00);
        foreach (DataRow row in table.Rows)
        {
            SqlMoney amount = SqlMoney.Parse(row["PendingAmount"].ToString());
            pendingAmount = pendingAmount + amount;
        }
        if (stayedDays > bookedDays)
        {
           int difference = stayedDays - bookedDays;
           Rates rate = new Rates();
           rate.Rate_ID = r.Rate_ID;
           rate.SelectOne();
           pendingAmount = pendingAmount + (difference * rate.Rate);
        }
        this.lblPendingPayment.Text = pendingAmount.ToString();

    }
    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        Reservations r = new Reservations();
        r.Reservation_ID = SqlInt32.Parse(hidReservationId.Value);
        r.SelectOne();

        Reservation_Payments rps = new Reservation_Payments();
        rps.Reservation_ID = SqlInt32.Parse(hidReservationId.Value);
        DataTable rpsTable = rps.SelectAll();

        CheckIn chkIn = new CheckIn();
        chkIn.Reservation_ID = SqlInt32.Parse(hidReservationId.Value);
        chkIn.SelectOne();

        CheckOut chkOut = new CheckOut();
        chkOut.Reservation_ID = SqlInt32.Parse(hidReservationId.Value);
        chkOut.SelectOne();
        DataTable table = chkOut.ConfirmCheckOut();

        chkOut.CheckOut_Date = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
        chkOut.CheckIn_ID = chkIn.CheckIn_ID;
        chkOut.FinalSettlementAmount = SqlMoney.Parse(lblPendingPayment.Text);
        chkOut.Remarks = txtComments.Text;
        SqlMoney totalCostOfReservation = new SqlMoney(0.00);
        SqlMoney totalDiscountForReservation = new SqlMoney(0.00);
        SqlMoney totalCostOfReservationAfterDiscount = new SqlMoney(0.00);
        SqlMoney totalRcvdForReservation = new SqlMoney(0.00);
        SqlMoney totalCostOfServicesAmneities = new SqlMoney(0.00);
        SqlMoney totalDiscountForServicesAmneities = new SqlMoney(0.00);
        SqlMoney totalCostOfServicesAmneitiesAfterDiscount = new SqlMoney(0.00);
        SqlMoney totalRcvdForServicesAmneities = new SqlMoney(0.00);

        foreach (DataRow row in table.Rows)
        {
            if (row["ServiceType"].ToString().Equals("Reservation"))
            {
                totalCostOfReservation += SqlMoney.Parse(row["Total_Before_Discount"].ToString());
                totalDiscountForReservation += SqlMoney.Parse(row["DiscountOffered"].ToString());
                totalCostOfReservationAfterDiscount += SqlMoney.Parse(row["Cost_After_Discount"].ToString());
                totalRcvdForReservation += SqlMoney.Parse(row["AmountReceived"].ToString());
            }
            else
            {
                totalCostOfServicesAmneities += SqlMoney.Parse(row["Total_Before_Discount"].ToString());
                totalCostOfServicesAmneities += SqlMoney.Parse(row["DiscountOffered"].ToString());
                totalCostOfServicesAmneitiesAfterDiscount += SqlMoney.Parse(row["Cost_After_Discount"].ToString());
                totalRcvdForServicesAmneities += SqlMoney.Parse(row["AmountReceived"].ToString());
            }
        }
        SqlMoney pendingPayment = SqlMoney.Parse(lblPendingPayment.Text);
        chkOut.Cost_Of_Reservation = totalCostOfReservation;
        chkOut.DiscountOffered_For_Reservations = totalDiscountForReservation;
        chkOut.AmountReceived_For_Reservation = totalRcvdForReservation;

        chkOut.Cost_Of_ServicesAmenities = totalCostOfServicesAmneities;
        chkOut.DiscountOffered_For_ServicesAmenities = totalDiscountForServicesAmneities;
        chkOut.AmountReceived_For_ServicesAmenities = totalRcvdForServicesAmneities;

        chkOut.FinalSettlementAmount = pendingPayment;
        if (chkOut.FinalSettlementAmount > 0)
        {
            if (drpPaymentModes.SelectedValue == "-1")
            {
                lblMsg.Text = "Please select a Payment Mode";
                lblMsg.ForeColor = Color.Red;
                return;
            }else
                chkOut.PaymentMode = SqlInt32.Parse(drpPaymentModes.SelectedValue);
        }

        chkOut.CheckOut_Personnel = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
        if (chkOut.Insert())
        {
            hidCheckOutId.Value = chkOut.CheckIn_ID.ToString();
            
            //-------------INSERT TO iNVOICES TABLE TO GENERATE THE iNVOICE NO-------------

            chkOut.InsertInvoice();

            //-------------------------------------------------------------------------------
            lblMsg.Text = "Successfully Checked Out";
            lblMsg.ForeColor = Color.Green;
            
   
        }
        else
        {
            lblMsg.Text = "Error in Checking Out";
            lblMsg.ForeColor = Color.Red;
        }
    }
}