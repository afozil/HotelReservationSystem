using System;
using System.Data;
using System.Data.SqlTypes;
using HotelReservationSystemDAL;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myreservation : System.Web.UI.Page
{
    DataTable tbl;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            
        }
    }

    protected void hlnkKnetPaymentId_Click(object sender, EventArgs e)
    {
        ClearBinding();
        this.pnlSearchResult.Visible = false;
        if (!string.IsNullOrEmpty(this.txtSearchTerm.Text) && Utility.IsNumeric(this.txtSearchTerm.Text.Trim()))
        {
            KNET_Payments knet = GetKnetPayment(this.txtSearchTerm.Text.Trim());
            if (knet != null)
            {
                Reservations reservation = GetReservations(knet.Reservation_ID);
                Guests guest = GetGuest(reservation.Guest_ID);
                BindReservation(knet, reservation, guest);
                this.lblResult.Text = "";
                this.pnlSearchResult.Visible = true;
            }
            else
            {
                this.lblResult.Text = "No Records !!!";
                this.pnlSearchResult.Visible = false;
            }
        }
        else
        {
            this.lblResult.Text = "Seach Term is invalid !!!";
            this.pnlSearchResult.Visible = false;
        }
    }

    protected void hlnkReservationId_Click(object sender, EventArgs e)
    {
        ClearBinding();
        this.pnlSearchResult.Visible = false;
        if (!string.IsNullOrEmpty(this.txtSearchTerm.Text) && Utility.IsNumeric(this.txtSearchTerm.Text.Trim()))
        {
            KNET_Payments knet = GetKnetPaymentByReservationId(SqlInt32.Parse(this.txtSearchTerm.Text.Trim()));
            if (knet != null)
            {
                Reservations reservation = GetReservations(knet.Reservation_ID);
                Guests guest = GetGuest(reservation.Guest_ID);
                BindReservation(knet, reservation, guest);
                this.lblResult.Text = "";
                this.pnlSearchResult.Visible = true;
            }
            else
            {
                this.lblResult.Text = "No Records !!!";
                this.pnlSearchResult.Visible = false;
            }
        }
        else
        {
            this.lblResult.Text = "Seach Term is invalid !!!";
            this.pnlSearchResult.Visible = false;
        }
    }

    protected void hlnkMobile_Click(object sender, EventArgs e)
    {
        ClearBinding();
        this.pnlSearchResult.Visible = false;
        if (!string.IsNullOrEmpty(this.txtSearchTerm.Text) && Utility.IsNumeric(this.txtSearchTerm.Text.Trim()))
        {
            tbl = Search(searchCriteria: "2", searchTerm: txtSearchTerm.Text.Trim());
            if (tbl.Rows.Count > 0)
            {
                SqlInt32 reservationId = (Int32)tbl.Rows[0]["Reservation_ID"];
                KNET_Payments knet = GetKnetPaymentByReservationId(reservationId);
                Reservations reservation = GetReservations(knet.Reservation_ID);
                Guests guest = GetGuest(reservation.Guest_ID);
                BindReservation(knet, reservation, guest);
                this.lblResult.Text = "";
                this.pnlSearchResult.Visible = true;
            }
            else
            {
                this.lblResult.Text = "No Records !!!";
                this.pnlSearchResult.Visible = false;
            }
        }
        else
        {
            this.lblResult.Text = "Seach Term is invalid !!!";
            this.pnlSearchResult.Visible = false;
        }

    }

    protected void hlnkCivilId_Click(object sender, EventArgs e)
    {
        ClearBinding();
        this.pnlSearchResult.Visible = false;
        if (!string.IsNullOrEmpty(this.txtSearchTerm.Text) && Utility.IsNumeric(this.txtSearchTerm.Text.Trim()))
        {
            tbl = Search(searchCriteria: "3", searchTerm: txtSearchTerm.Text.Trim());
            if (tbl.Rows.Count > 0)
            {
                SqlInt32 reservationId = (Int32)tbl.Rows[0]["Reservation_ID"];
                KNET_Payments knet = GetKnetPaymentByReservationId(reservationId);
                Reservations reservation = GetReservations(knet.Reservation_ID);
                Guests guest = GetGuest(reservation.Guest_ID);
                BindReservation(knet, reservation, guest);
                this.lblResult.Text = "";
                this.pnlSearchResult.Visible = true;
            }
            else
            {
                this.lblResult.Text = "No Records !!!";
                this.pnlSearchResult.Visible = false;
            }
        }
        else
        {
            this.lblResult.Text = "Seach Term is invalid !!!";
            this.pnlSearchResult.Visible = false;
        }
    }

    private DataTable Search(string searchCriteria, string searchTerm, string tableName = "Reservations")
    {
        tbl = new Reservations().Search(tableName, searchCriteria, searchTerm);
        return tbl;
    }

    private void ClearBinding()
    {
        this.lblFromDate.Text = string.Empty;
        this.lblToDate.Text = string.Empty;
    }

    private void BindReservation(KNET_Payments knet, Reservations reservation,Guests guest)
    {
        this.lblKnetPaymentId.Text = knet.KNET_Payment_ID;
        this.lblKnetReference.Text = knet.Ref;

        Reservation_Payments payments = new Reservation_Payments();
        payments.Reservation_ID = knet.Reservation_ID;
        DataTable pays = payments.SelectAll();
        int numKidsFerry = 0, numAdultsFerry = 0, numDays = 0;
        SqlMoney roomCharges = new SqlMoney(0.00);
        SqlMoney ferryCharges = new SqlMoney(0.00);
        SqlMoney kidsFerryCost = new SqlMoney(0.00);
        SqlMoney adultsFerryCost = new SqlMoney(0.00);
        SqlMoney totalCost = new SqlMoney(0.00);
        if (pays.Rows.Count > 0)
        {
            foreach (DataRow r in pays.Rows)
            {
                if ((Int32)r["AvailedService_Type"] == PAYMENT_AVAILED_SERVICETYPES.FERRY_KIDS)
                {
                    numKidsFerry = (Int32)r["UnitsConsumed"];
                    kidsFerryCost = (Decimal)r["Cost_After_Discount"];
                }
                if ((Int32)r["AvailedService_Type"] == PAYMENT_AVAILED_SERVICETYPES.FERRY_ADULTS)
                {
                    numAdultsFerry = (Int32)r["UnitsConsumed"];
                    adultsFerryCost = (Decimal)r["Cost_After_Discount"];
                }
                if ((Int32)r["AvailedService_Type"] == PAYMENT_AVAILED_SERVICETYPES.RESERVATION)
                {
                    numDays = (Int32)r["UnitsConsumed"];
                    roomCharges = (Decimal)r["Cost_After_Discount"];
                }
            }
        }
        ferryCharges = (adultsFerryCost + kidsFerryCost);
        totalCost = (ferryCharges + roomCharges);
        this.lblRoomCharges.Text = roomCharges.ToString();
        this.lblFerryCharges.Text = ferryCharges.ToString();
        this.lblTotalCharges.Text = totalCost.ToString();

        this.lblDays.Text = numDays.ToString();
        this.lblFerryKids.Text = numKidsFerry.ToString();
        this.lblFerryAdults.Text = numAdultsFerry.ToString();

        
        reservation.Reservation_ID = knet.Reservation_ID;
        reservation.SelectOne();
        this.lblFromDate.Text = Utility.GetDateTimeFromSqlDateTime(reservation.FromDate).ToString("dd/MM/yyyy");
        this.lblToDate.Text = Utility.GetDateTimeFromSqlDateTime(reservation.ToDate).ToString("dd/MM/yyyy");
        this.lblRoomType.Text = reservation.RoomType_ID.ToString();
        this.lblFerryKidsValidity.Text = Utility.GetDateTimeFromSqlDateTime(reservation.FromDate).ToString("dd/MM/yyyy");
        this.lblFerryAdultsValidity.Text = Utility.GetDateTimeFromSqlDateTime(reservation.FromDate).ToString("dd/MM/yyyy");
        this.lblDepartureTickets.Text = (numKidsFerry + numAdultsFerry).ToString();
        this.lblDepartureDate.Text = Utility.GetDateTimeFromSqlDateTime(reservation.ToDate).ToString("dd/MM/yyyy");

        
        this.lblGuestFirstName.Text = guest.FirstName.ToString();
        this.lblGuestMiddleName.Text = guest.MiddleName.ToString();
        this.lblGuestLastName.Text = guest.LastName.ToString();
        this.lblGuestEmail.Text = guest.Email.ToString();
        this.lblGuestMobile.Text = guest.MobileNumber.ToString();
        this.lblGuestCvd.Text = guest.Civil_ID.ToString();
    }

    private  KNET_Payments GetKnetPayment(string knetPaymentId)
    {
        KNET_Payments knet = new KNET_Payments();
        knet.KNET_Payment_ID = knetPaymentId;
        knet.SelectOne();
        return knet;
    }
    private KNET_Payments GetKnetPaymentByReservationId(SqlInt32 reservationId)
    {
        KNET_Payments knet = new KNET_Payments();
        knet.Reservation_ID = reservationId;
        knet.SelectByReservation();
        return knet;
    }
    private  Reservations GetReservations(SqlInt32 reservationId)
    {
        Reservations reservation = new Reservations();
        reservation.Reservation_ID = reservationId;
        reservation.SelectOne();
        return reservation;
    }
    private Guests GetGuest(SqlInt32 guestId)
    {
        Guests guest = new Guests();
        guest.Guest_ID = guestId;
        guest.SelectOne();
        return guest;
    }
}