using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;
using HotelReservationSystemDAL;

public partial class Hotel_ChangeRoom : System.Web.UI.Page
{
    private int reservationId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["ReservationID"] != null)
            {
                reservationId = Request.Params["ReservationID"] != null || Request.Params["ReservationID"] != "" ? Int32.Parse(Request.Params["ReservationID"].ToString()) : 0;
                this.hidReservationId.Value = reservationId.ToString();
                if (hidReservationId.Value != "")
                {
                    BindReservation(reservationId);
                }
            }
        }

       }

    protected void BindReservation(int reservation)
    {
        Reservations rsvtn = new Reservations();
        rsvtn.Reservation_ID = reservationId;
        DataTable reservationTbl = rsvtn.SelectOne();
        foreach(DataRow row in reservationTbl.Rows)
        {
            this.lblReservationID.Text = row["Reservation_ID"].ToString();
            this.lblFromDate.Text = DateTime.Parse(row["FromDate"].ToString()).ToString("MM/dd/yyyy");
            this.lblToDate.Text = DateTime.Parse(row["ToDate"].ToString()).ToString("MM/dd/yyyy");
            this.lblRoomType.Text = row["RoomType_EN"].ToString();
            this.lblBookedRoom.Text = row["RoomName_EN"].ToString();
            BindAvailableRooms(rsvtn.FromDate, rsvtn.ToDate, rsvtn.RoomType_ID);
            this.lstSelectedRoom.SelectedValue = rsvtn.Room_ID.ToString();
        }
    }
    protected void BindAvailableRooms(SqlDateTime sFromDate, SqlDateTime stoDate, SqlInt32 roomType)
    {
        DataTable table = new Bookings().SelectAvailableRooms(sFromDate, stoDate, roomType);
        this.lstSelectedRoom.DataSource = table;
        this.lstSelectedRoom.DataTextField = "RoomName_EN";
        this.lstSelectedRoom.DataValueField = "Room_ID";
        this.lstSelectedRoom.DataBind();

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("BookingsList.aspx", true);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Reservations rsvtn = new Reservations();
        rsvtn.Reservation_ID = SqlInt32.Parse(this.hidReservationId.Value);
        rsvtn.Room_ID = SqlInt32.Parse(this.lstSelectedRoom.SelectedValue);
        if (rsvtn.ChangeRoom())
            Response.Redirect("BookingsList.aspx", true);
    }
}