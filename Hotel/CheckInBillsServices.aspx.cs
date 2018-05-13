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

public partial class Hotel_CheckInBillsServices : System.Web.UI.Page
{
    private DataTable _checkedInRooms;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindCheckedInRooms();
            BindBillServices();
            BindPaymentModes();
        }

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


    private DataTable GetCheckedInRooms()
    {
        if (_checkedInRooms == null)
        {
            Reservations r = new Reservations();
            DataTable table = r.SelectAll();
            if (table != null)
            {
                IEnumerable<DataRow> query = (from reservationsRow in table.AsEnumerable()
                                              where reservationsRow.Field<Int32>("BookingStatus") == BookingStatus.CHECKED_IN
                                              select reservationsRow);
                try
                {
                    if (query != null)
                        _checkedInRooms = query.CopyToDataTable();
                }
                catch (Exception e)
                {

                }
            }
        }
        return _checkedInRooms;

    }

    private void BindCheckedInRooms()
    {
        DataTable table = GetCheckedInRooms();
        drpCheckIn.DataSource = table;
        drpCheckIn.DataTextField = "RoomName_EN";
        drpCheckIn.DataValueField = "Reservation_ID";
        drpCheckIn.DataBind();
        drpCheckIn.Items.Insert(0, new ListItem("Select a Checked In Room....", "-1"));
    }

    private void BindBillServices()
    {
        BillsServices bs = new BillsServices();
        DataTable table = bs.SelectAll();
        drpBillServices.DataSource = table;
        drpBillServices.DataTextField = "Name";
        drpBillServices.DataValueField = "BillsServices_ID";
        drpBillServices.DataBind();
        drpBillServices.Items.Insert(0, new ListItem("Select an Bills & Service....", "-1"));

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx", true);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(hidCheckInID.Value) || hidCheckInID.Value == "0")
        {
            lblStatus.Text = "The Reservation is invalid. Not Checked In"; return;
        }
        if (drpBillServices.SelectedValue == "-1")
        {
            lblStatus.Text = "Please choose a Bill Service"; return;
        }
        if (drpCheckIn.SelectedValue == "-1")
        {
            lblStatus.Text = "Please Bill Service"; return;
        }
        Reservation_Payments rp = new Reservation_Payments();
        rp.Reservation_ID = SqlInt32.Parse(drpCheckIn.SelectedValue);
        rp.CreatedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Today);
        rp.PaymentPersonnel = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
        rp.AvailedService_Type = PAYMENT_AVAILED_SERVICETYPES.BILLS_SERVICES;
        rp.Rate_ID = SqlInt32.Parse(drpBillServices.SelectedValue);
        rp.UnitsConsumed = SqlInt32.Parse(txtQuantity.Text);
        rp.TotalCost_Before_Discount = SqlMoney.Parse(txtPrice.Text);
        rp.Invoice = txtInvoice.Text == string.Empty ? string.Empty : txtInvoice.Text;
        rp.PaymentStatus = 1;//Active;
        rp.Discount_Offered = txtDiscount.Text == string.Empty ? 0 : SqlMoney.Parse(txtDiscount.Text);
        rp.Cost_After_Discount = rp.Discount_Offered == 0 ? rp.TotalCost_Before_Discount : SqlMoney.Parse(lblAfterDiscount.Text);
        rp.AmountReceived = txtAmountReceived.Text == string.Empty ? 0 : SqlMoney.Parse(txtAmountReceived.Text);
        if (rp.AmountReceived > 0)
        {
            if (drpPaymentModes.SelectedValue == "-1")
            {
                lblStatus.Text = "Please select a Payment Mode";
                lblStatus.ForeColor = Color.Red;
                return;
            }
            else
                rp.PaymentMode = SqlInt32.Parse(drpPaymentModes.SelectedValue);
        }
        if (rp.Insert())
        {
            rp.InsertServiceInvoice();

            lblStatus.Text = "Payment Saved";
            lblStatus.ForeColor = Color.Green;
           // return;
            //---------------for Printing the Amenity invoice----------------------------------------
            DataTable amenitytbl = new DataTable();
            DataColumn Id = new DataColumn("ID", typeof(int));
            DataColumn ReservationID = new DataColumn("ReservationID", typeof(int));
            DataColumn RoomId = new DataColumn("RoomID", typeof(string));
            DataColumn ServiceName = new DataColumn("ServiceName", typeof(string));
            DataColumn Invoice = new DataColumn("Invoice", typeof(string));
            DataColumn Cost = new DataColumn("Cost", typeof(double));
            DataColumn Qty = new DataColumn("Quantity", typeof(int));
            DataColumn TotCost = new DataColumn("TotCost", typeof(double));
            DataColumn Discount = new DataColumn("Discount", typeof(double));
            DataColumn AfterDiscount = new DataColumn("AfterDiscount", typeof(double));
            DataColumn AmountReceived = new DataColumn("AmountRecevied", typeof(double));
            DataColumn PaymentMode = new DataColumn("PaymentMode", typeof(string));
            DataColumn CreatedBy = new DataColumn("CreatedBy", typeof(string));
            DataColumn InvoiceNo = new DataColumn("InvoiceNo", typeof(string));

            amenitytbl.Columns.Add(Id);
            amenitytbl.Columns.Add(ReservationID);
            amenitytbl.Columns.Add(RoomId);
            amenitytbl.Columns.Add(ServiceName);
            amenitytbl.Columns.Add(Invoice);
            amenitytbl.Columns.Add(Cost);
            amenitytbl.Columns.Add(Qty);
            amenitytbl.Columns.Add(TotCost);
            amenitytbl.Columns.Add(Discount);
            amenitytbl.Columns.Add(AfterDiscount);
            amenitytbl.Columns.Add(AmountReceived);
            amenitytbl.Columns.Add(PaymentMode);
            amenitytbl.Columns.Add(CreatedBy);
            amenitytbl.Columns.Add(InvoiceNo);

            DataRow row = amenitytbl.NewRow();
            row["Id"] = 1;
            row["ReservationID"] = Int32.Parse(rp.Reservation_ID.ToString());
            row["ServiceName"] = drpBillServices.SelectedItem.Text;
            row["Invoice"] = txtInvoice.Text;
            row["Cost"] = double.Parse(lblPrice.Text);
            row["Quantity"] = int.Parse(rp.UnitsConsumed.ToString());
            row["TotCost"] = double.Parse(rp.TotalCost_Before_Discount.ToString());
            row["Discount"] = double.Parse(rp.Discount_Offered.ToString());
            row["AfterDiscount"] = double.Parse(rp.Cost_After_Discount.ToString());
            row["AmountRecevied"] = double.Parse(rp.AmountReceived.ToString());
            row["PaymentMode"] = drpPaymentModes.SelectedItem.Text;
            row["CreatedBy"] = HttpContext.Current.User.Identity.Name;
            row["InvoiceNo"] = rp.ServiceNo.ToString();

            amenitytbl.Rows.Add(row);
            Session["Inv"] = amenitytbl;
            string popupScript = "<script language='javascript'>" +
                              "window.open('AmenityInvView.aspx','ThisPopUp1', " +
                              "'left = 300, top=150,  " +
                              "menubar=no, scrollbars=yes, resizable=yes')" +
                              "</script>";
            Page.ClientScript.RegisterStartupScript(GetType(), "PopupScript", popupScript);
            //----------------------------------------------------------------------------------

        }
        else
        {
            lblStatus.Text = rp.ErrorDesc.ToString() + " Error Playment Not saved !!!";
            lblStatus.ForeColor = Color.Red;
            return;
        }

    }

    protected void txtQuantity_TextChanged(object sender, EventArgs e)
    {
        calculateTotal();
    }

    private void calculateTotal()
    {
        int qty = 0;
        if (!string.IsNullOrEmpty(txtQuantity.Text))
        {
            try
            {
                qty = int.Parse(txtQuantity.Text);
            }
            catch (Exception ex) { }

            SqlMoney price = 0;
            if (drpBillServices.SelectedValue != "-1")
            {
                BillsServices bs = new BillsServices();
                bs.BillsServices_ID = int.Parse(drpBillServices.SelectedValue);
                bs.SelectOne();
                price = bs.Price;
                SqlMoney totalAmt = qty * price;
                txtPrice.Text = totalAmt.ToString();
            }

        }
    }
    protected void drpBillServices_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpBillServices.SelectedValue == "-1")
        {
            lblStatus.Text = "Please select an Amenity";
            return;
        }
        lblStatus.Text = "";
        SqlMoney price = 0;
        BillsServices bs = new BillsServices ();
        bs.BillsServices_ID = Int32.Parse(drpBillServices.SelectedValue);
        bs.SelectOne();
        price = bs.Price;
        lblPrice.Text = price.ToString();
        calculateTotal();
    }

    protected void txtDiscount_TextChanged(object sender, EventArgs e)
    {
        lblStatus.Text = "";
        Double discount = 0.00;
        if (txtDiscount.Text.Trim() != string.Empty)
            discount = Double.Parse(txtDiscount.Text.Trim());

        Double cost = Double.Parse(txtPrice.Text);
        if (discount < cost)
        {
            Double costAfterDiscount = cost - discount;
            lblAfterDiscount.Text = costAfterDiscount.ToString();
            txtAmountReceived.Text = costAfterDiscount.ToString();
            return;
        }
        else
        {
            lblStatus.Text = "Discount is >= Cost!!";
            lblStatus.ForeColor = Color.Red;
            return;
        }

    }


    protected void drpCheckIn_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpCheckIn.SelectedValue == "-1")
        {
            lblStatus.Text = "Please select a checked in Room";
            return;
        }
        lblStatus.Text = "";
        Reservations chekin = new Reservations();
        try
        {
            chekin.Reservation_ID = int.Parse(drpCheckIn.SelectedValue);
            DataTable table = chekin.SelectOne();
            if (chekin != null)
            {
                btnSave.Enabled = true;
                hidCheckInID.Value = table.Rows[0]["CheckIn_ID"].ToString();
            }
            else
            {
                btnSave.Enabled = false;
                lblStatus.Text = "Room not assigned."; return;
            }
        }
        catch (Exception ex) { }

    }






}