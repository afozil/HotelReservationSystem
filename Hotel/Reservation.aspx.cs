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

public partial class Hotel_Reservation : System.Web.UI.Page
{
    private int  reservationId = 0;
    private DataTable reservationTbl;
    private DataTable paymentsTbl;
    private DataTable secGuestsTbl;
    private DataTable amenitiesTbl;
    private DataTable billsServicesTbl;
    private DataTable ferryTbl;
    private DataTable knetPayTbl;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["Reservation_ID"] != null)
            {
                reservationId = Request.Params["Reservation_ID"] != null || Request.Params["Reservation_ID"] != "" ? Int32.Parse(Request.Params["Reservation_ID"].ToString()) : 0;
                hidReservationId.Value = reservationId.ToString();
                if(hidReservationId.Value!="")
                {
                    btnPrintReservationConfirm.Visible = true;
                }
            }
            BindPaymentModes();
            BindReservation(reservationId);
            BindReservationPayments(reservationId);
            BindSecondaryGuests();
            BindRelationships();
            BindKnetPayment(reservationId);
            ApplyRolePermissions();
        }
        
    }

    private void ApplyRolePermissions()
    {
        //if (User.IsInRole(Roles.SALES) || User.IsInRole(Roles.CONFIG_MANAGER) || User.IsInRole(Roles.HOUSE_KEEPING))
        //Sales Man to have access to Payment based on Roy's call on 18-Nov-2015
        if (User.IsInRole(Roles.CONFIG_MANAGER) || User.IsInRole(Roles.HOUSE_KEEPING))
        {
            MyAccordion.Panes["ReservationPane"].Visible = false;
            MyAccordion.Panes["PaymentsPane"].Visible = false;
            btnRegCard.Visible = false;
            btnWelcomeLetter.Visible = false;
        }
        if (User.IsInRole(Roles.CONFIG_MANAGER))
            MyAccordion.Panes["AccompanyingGuestsPane"].Visible = false;

        if (User.IsInRole(Roles.HOUSE_KEEPING))
            pnlAddSecondaryGuest.Visible = false;

        if (!String.IsNullOrEmpty(hidReservationStatus.Value))
        {
            if (User.IsInRole(Roles.SALES) && hidReservationStatus.Value == BookingStatus.CHECKED_IN.ToString())
            {
                pnlAddSecondaryGuest.Visible = false;
            }
            if (hidReservationStatus.Value == BookingStatus.CANCELLED.ToString() || hidReservationStatus.Value == BookingStatus.CHECKED_OUT.ToString())
            {
                pnlAddPayments.Visible = false;
                pnlAddSecondaryGuest.Visible = false;
            }
            if (hidReservationStatus.Value == BookingStatus.CANCELLED.ToString() || 
                hidReservationStatus.Value == BookingStatus.CHECKED_OUT.ToString() ||
                hidReservationStatus.Value == BookingStatus.CONFIRMED.ToString()
                )
            {
                btnRegCard.Visible = false;
                btnWelcomeLetter.Visible = false;
            }
        }
         
        if (hidCheckOutId.Value != "")
            btnPrint.Visible = true;
        else
            btnPrint.Visible = false;
        /*
        btnPrintReservationConfirm.Visible = false;
        btnRegCard.Visible = false;
        btnWelcomeLetter.Visible = false;
         */ 
    }

    private void GetReservation(int reservationId, ref DataTable reservationTbl)
    {
        Reservations rsvtn = new Reservations();
        rsvtn.Reservation_ID = reservationId;
        reservationTbl = rsvtn.SelectOne();

    }

    private void BindReservation(int reservationId)
    {
        Reservations rsvtn = new Reservations();
        rsvtn.Reservation_ID = reservationId;
        reservationTbl = rsvtn.SelectOne();
        reservationsGrid.DataSource = reservationTbl;
        reservationsGrid.DataBind();
        hidReservationStatus.Value = rsvtn.BookingStatus.ToString();
        if (reservationTbl.Rows.Count > 0)
        {
            hidGuestId.Value = reservationTbl.Rows[0].Field<int>("Guest_ID").ToString();
            Rooms room = new Rooms();
            room.Room_ID = reservationTbl.Rows[0].Field<int>("Room_ID");
            DataTable rmRable = room.SelectOne();
            if (rmRable.Rows.Count > 0)
                hidMaxOccupancy.Value = rmRable.Rows[0].Field<int>("MaximumOccupancy_Allowed").ToString();

            if (rsvtn.ReservationPersonnel == 0 && rsvtn.BookingStatus == BookingStatus.CONFIRMED)
            {
                this.btnChangeRoom.Visible = true;
                MyAccordion.Panes["KNETPaymentPane"].Visible = true;
            }
            else
            {
                this.btnChangeRoom.Visible = false;
                MyAccordion.Panes["KNETPaymentPane"].Visible = false;
            }

            if (rsvtn.BookingStatus == BookingStatus.CHECKED_IN)
            {
                btnRegCard.Visible = true;
                btnWelcomeLetter.Visible = true;
            }
               // btnSavePayment.Visible = false;
            

            if (rsvtn.BookingStatus == BookingStatus.CHECKED_OUT)
            {
                /*
                btnSavePayment.Visible = false;
                btnSave.Visible = false;
                 * */
                //---------------Checking for checkout-id---------
                DataTable tbcheckOut = new CheckOut().GetInvoiceByCheckOutReservationID(reservationId.ToString());
                if (tbcheckOut.Rows.Count>0)
                {
                    foreach (DataRow row in tbcheckOut.Rows)
                    {
                        hidCheckOutId.Value = row["CheckOut_ID"].ToString();
                        btnPrint.Visible = true;
                    }

                }

            }

           
        }
        else
        {
            /*
            btnSavePayment.Visible = false;
            btnSave.Visible = false;
             * */
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

    private void GetReservationPayments(int reservationId, ref DataTable paymentsTbl)
    {
        Reservation_Payments payments = new Reservation_Payments();
        payments.Reservation_ID = reservationId;
        paymentsTbl = payments.SelectAll();
        /*if (Session["ReservationPaymentsTable"] == null)
        {
            Reservation_Payments payments = new Reservation_Payments();
            payments.Reservation_ID = reservationId;
            paymentsTbl = payments.SelectAll();
            Session.Add("ReservationPaymentsTable", paymentsTbl);
        }
        else
            paymentsTbl = (DataTable)Session["ReservationPaymentsTable"];
         */
    }

    private void BindReservationPayments(int reservationId)
    {
        //GetReservationPayments(reservationId, ref  paymentsTbl);
        Reservation_Payments payments = new Reservation_Payments();
        payments.Reservation_ID = reservationId;
        paymentsTbl = payments.SelectAll();
        paymentsGrid.DataSource = paymentsTbl;
        paymentsGrid.DataBind();
    }

    private DataTable GetSecondaryGuests()
    {
        int reservationId = hidReservationId.Value == string.Empty ? 0 : Int32.Parse(hidReservationId.Value);
        SecondaryGuests sg = new SecondaryGuests();
        sg.Reservation_ID = reservationId;
        secGuestsTbl = sg.SelectAll();

        return secGuestsTbl;
    }

    private void BindSecondaryGuests()
    {
        secGuestsGrid.DataSource = GetSecondaryGuests(); 
        secGuestsGrid.DataBind();
        hidCurrentOccupancy.Value = secGuestsTbl.Rows.Count.ToString();
    }

    private void BindRelationships()
    {
        DataTable table = new RelationShips().SelectAll();
        drpRelationShip.DataSource = table;
        drpRelationShip.DataTextField = "RelationShip";
        drpRelationShip.DataValueField = "RelationShip_ID";
        drpRelationShip.DataBind();
        drpRelationShip.Items.Insert(0, new ListItem("Select a Relationship...", "-1"));
    }

    protected void btnSavePayment_Click(object sender, EventArgs e)
    {
        if(drpServiceType.SelectedValue == "-1"){
            lblPaymentMsg.Text = "Please select a Service Type";
            lblPaymentMsg.ForeColor = Color.Red;
            return;
        }

        if (drpService.SelectedValue == "-1")
        {
            lblPaymentMsg.Text = "Please select a Service Type";
            lblPaymentMsg.ForeColor = Color.Red;
            return;
        }
        Reservation_Payments rp = new Reservation_Payments();
        rp.Reservation_ID = SqlInt32.Parse(hidReservationId.Value);
        rp.CreatedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Today);
        rp.PaymentPersonnel = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
        rp.AvailedService_Type = SqlInt32.Parse(drpServiceType.SelectedValue);
        Reservations r = new Reservations();
        r.Reservation_ID = SqlInt32.Parse(hidReservationId.Value);
        r.SelectOne();
        if (drpServiceType.SelectedValue.Equals("1"))//If type reservation
        {
            if(r.PendingAmount <= 0)
            {
                lblPaymentMsg.Text = "There are no more Pending amounts to be paid for the reservation";
                lblPaymentMsg.ForeColor = Color.Red;
                return;
            }
            if (string.IsNullOrEmpty(lblCost.Text) || SqlMoney.Parse(lblCost.Text) == 0)
            {
                lblPaymentMsg.Text = "There are no more Pending amounts to be paid for the reservation";
                lblPaymentMsg.ForeColor = Color.Red;
                return;
            }
            if (SqlMoney.Parse(lblCost.Text) != 0)
            {
                SqlMoney toPay = SqlMoney.Parse(lblCost.Text);
                SqlMoney amountReceived = SqlMoney.Parse(txtAmountReceived.Text);
                if (amountReceived < toPay || amountReceived > toPay)
                {
                    lblPaymentMsg.Text = "Please pay only the Pending Reservation Amount to confirm reservation";
                    lblPaymentMsg.ForeColor = Color.Red;
                    return;
                }
                r.PendingAmount = new SqlMoney(0.00);//SqlMoney.Parse(lblCost.Text);
                r.BookingStatus = BookingStatus.CONFIRMED;
                r.PaymentStatus = PaymentStatus.FULLY_PAID;
                r.Update();
            }
            rp.Rate_ID = r.Rate_ID;
            rp.UnitsConsumed = 0;
            rp.TotalCost_Before_Discount = r.PendingAmount;
            
        }
        else
        {
            if (r.BookingStatus != BookingStatus.CHECKED_IN)
            {
                lblPaymentMsg.Text = "Cannot Save Payment. Not yet Checked In";
                lblPaymentMsg.ForeColor = Color.Red;
                return;
            }
            if (String.IsNullOrEmpty(txtUnits.Text))
            {
                lblPaymentMsg.Text = "Please enter Units consumed";
                lblPaymentMsg.ForeColor = Color.Red;
                return;
            }
            rp.Rate_ID = SqlInt32.Parse(drpService.SelectedValue);
            rp.UnitsConsumed = SqlInt32.Parse(txtUnits.Text);
            rp.TotalCost_Before_Discount = SqlMoney.Parse(lblCost.Text);
        }
        if (drpPaymentModes.SelectedValue == "-1")
        {
            lblPaymentMsg.Text = "Please select a Payment Mode";
            lblPaymentMsg.ForeColor = Color.Red;
            return;
        }
        rp.Invoice = txtInvoice.Text == string.Empty ? string.Empty : txtInvoice.Text;
        rp.PaymentStatus = 1;//Active;
        rp.Discount_Offered = txtDiscount.Text ==  string.Empty ? 0 : SqlMoney.Parse(txtDiscount.Text) ;
        rp.Cost_After_Discount = rp.Discount_Offered==0? rp.TotalCost_Before_Discount: SqlMoney.Parse(lblAfterDiscount.Text);
        rp.AmountReceived = txtAmountReceived.Text == string.Empty ? 0 : SqlMoney.Parse(txtAmountReceived.Text);
        rp.PaymentMode = SqlInt32.Parse(drpPaymentModes.SelectedValue);
        if (rp.Insert()){
            Response.Redirect("Reservation.aspx?Reservation_ID=" + hidReservationId.Value, true);
        }
        else
        {
            lblPaymentMsg.Text = rp.ErrorDesc.ToString() + " Error Playment Not saved !!!";
            lblPaymentMsg.ForeColor = Color.Green;
            return;
        }
    }

    private void ClearPaymentFields()
    {
        txtDiscount.Text = string.Empty;
        txtInvoice.Text = string.Empty;
        lblRate.Text = string.Empty;
        txtUnits.Text = string.Empty;
        lblCost.Text = string.Empty;
        txtDiscount.Text = string.Empty;
        lblAfterDiscount.Text = string.Empty;
        txtAmountReceived.Text = string.Empty;
    }

    protected void drpServiceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        ClearPaymentFields();
        drpService.Items.Clear();
        int serviceType = Int32.Parse(drpServiceType.SelectedValue);
        if (serviceType == -1){
            lblPaymentMsg.Text = "Please select a Service Type";
            lblPaymentMsg.ForeColor = Color.Red;
            return;
        }
       
        switch (serviceType)
        {
            case 1:
                BindReservations();
                break;
            case 2:
                BindBillServices();
                break;
            case 3:
                BindAmenities();
                break;
            case 4:
                BindFerry();
                break;
            case 5:
                BindFerry();
                break;
            default :
                BindAmenities();
                break;
        }
    }

    protected void drpService_SelectedIndexChanged(object sender, EventArgs e)
    {
        ClearPaymentFields();
        int service = Int32.Parse(drpService.SelectedValue);
        if (service == -1 )
            return;
        int serviceType = Int32.Parse(drpServiceType.SelectedValue);
        switch (serviceType)
        {
            case 1:
                BindReservationRate();
                break;
            case 2:
                BindBillServiceRate(service);
                break;
            case 3:
                BindAmenitiesRate(service);
                break;
            case 4:
                BindFerryRate(service);
                break;
            case 5:
                BindFerryRate(service);
                break;
            default:
                BindAmenitiesRate(service);
                break;
        }
        
    }

    private void GetBillServices(ref DataTable billsServicesTbl)
    {
        if (Session["BillServiceTable"] == null)
        {
            BillsServices bs = new BillsServices();
            billsServicesTbl = bs.SelectAll();
            Session.Add("BillServiceTable", billsServicesTbl);
        }
        else billsServicesTbl = (DataTable)Session["BillServiceTable"];
    }

    private void GetAmenities(ref DataTable amenitiesTbl)
    {
        if (Session["AmenitiesTable"] == null)
        {
            Amenities am = new Amenities();
            amenitiesTbl = am.SelectAll();
            Session.Add("AmenitiesTable", amenitiesTbl);
        }
        else amenitiesTbl = (DataTable)Session["AmenitiesTable"];
    }

    private void GetFerry(ref DataTable ferryTbl)
    {
        if (Session["FerryTable"] == null)
        {
            Ferry ferry = new Ferry();
            ferryTbl = ferry.SelectAll();
            Session.Add("FerryTable", ferryTbl);
        }
        else ferryTbl = (DataTable)Session["FerryTable"];
    }

    private void BindBillServices()
    {
        GetBillServices(ref billsServicesTbl);
        drpService.DataSource = billsServicesTbl;
        drpService.DataTextField = "Name";
        drpService.DataValueField = "BillsServices_ID";
        drpService.DataBind();
        drpService.Items.Insert(0, new ListItem("Select a Bill Service...", "-1"));

    }

    private void BindAmenities()
    {
        GetAmenities(ref amenitiesTbl);
        drpService.DataSource = amenitiesTbl;
        drpService.DataTextField = "AmenitiesName";
        drpService.DataValueField = "AmenitiesID";
        drpService.DataBind();
        drpService.Items.Insert(0, new ListItem("Select an Amenity...", "-1"));
    }

    private void BindFerry()
    {
        GetFerry(ref ferryTbl);
        drpService.DataSource = ferryTbl;
        drpService.DataTextField = "FerryName_EN";
        drpService.DataValueField = "Ferry_ID";
        drpService.DataBind();
        drpService.Items.Insert(0, new ListItem("Select a Ferry...", "-1"));
    }

    private void BindReservations()
    {
        drpService.Items.Clear();
        drpService.Items.Insert(0, new ListItem("Select an Reservation Payment...", "-1"));
        drpService.Items.Insert(1, new ListItem("Pending Payment", "0"));

    }

    private void BindBillServiceRate(int service)
    {
        GetBillServices(ref billsServicesTbl);
        var query = from billServicesRow in billsServicesTbl.AsEnumerable()
                    where billServicesRow.Field<int>("BillsServices_ID") == service
                    select billServicesRow;
        DataTable table = query.CopyToDataTable();
        lblRate.Text = table.Rows[0].Field<Decimal>("Price").ToString();
    }

    private void BindAmenitiesRate(int service)
    {
        GetAmenities(ref amenitiesTbl);
        IEnumerable<DataRow> query = from amenitiesRow in amenitiesTbl.AsEnumerable()
                    where amenitiesRow.Field<int>("AmenitiesID") == service
                    select amenitiesRow;

       DataTable table =  query.CopyToDataTable();
       lblRate.Text = table.Rows[0].Field<Decimal>("Price").ToString();
        
    }

    private void BindReservationRate()
    {
        Reservations r = new Reservations();
        r.Reservation_ID = SqlInt32.Parse(hidReservationId.Value);
        r.SelectOne();
        lblCost.Text = r.PendingAmount.ToString();
        txtAmountReceived.Text = r.PendingAmount.ToString();
    }

    private void BindFerryRate(int service)
    {
        GetFerry(ref ferryTbl);
        IEnumerable<DataRow> query = from ferryRow in ferryTbl.AsEnumerable()
                                     where ferryRow.Field<int>("Ferry_ID") == service
                                     select ferryRow;
        int serviceType = Int32.Parse(drpServiceType.SelectedValue); 

        DataTable table = query.CopyToDataTable();
        switch (serviceType)
        {
            case 4:
                lblRate.Text = table.Rows[0].Field<Decimal>("Cost_For_Adults").ToString();
                break;
            case 5:
                lblRate.Text = table.Rows[0].Field<Decimal>("Cost_For_Kids").ToString();
                break;
            default:
                lblRate.Text = table.Rows[0].Field<Decimal>("Cost_For_Adults").ToString();
                break;
        }
    }

    protected void btnSaveGuest_Click(object sender, EventArgs e)
    {
        if(drpRelationShip.SelectedValue=="-1")
        {
            lblGstMsg.Text = "Please select a relationship";
            lblGstMsg.ForeColor = Color.Red;
            return;
        }
        if (txtFirstName.Text.Trim() == string.Empty || txtLastName.Text.Trim() == string.Empty)
        {
            lblGstMsg.Text = "Please enter First & Last Names";
            lblGstMsg.ForeColor = Color.Red;
            return;
        }
        if (txtCivilId.Text.Trim() == string.Empty)
        {
            lblGstMsg.Text = "Please enter Civil ID";
            lblGstMsg.ForeColor = Color.Red;
            return;
        }
        if (Int32.Parse(hidCurrentOccupancy.Value) == (Int32.Parse(hidMaxOccupancy.Value) + 2))
        {
            lblGstMsg.Text = "Maximum Occupancy with 2 additional guests already reached. ";
            lblGstMsg.ForeColor = Color.Red;
            return;
        }
        SecondaryGuests sg = new SecondaryGuests();
        sg.Reservation_ID = SqlInt32.Parse(hidReservationId.Value);
        sg.Guest_ID = SqlInt32.Parse(hidGuestId.Value);
        sg.RelationShip_ID = SqlInt32.Parse(drpRelationShip.SelectedValue);
        sg.Salutation = SqlInt32.Parse(drpSalutation.SelectedValue);
        sg.Gender = SqlInt32.Parse(drpGender.SelectedValue);
        sg.FirstName = txtFirstName.Text.Trim();
        sg.MiddleName = string.Empty;  //txtMiddleName.Text.Trim() == string.Empty ? string.Empty : txtMiddleName.Text.Trim();
        sg.LastName = txtLastName.Text.Trim();
        sg.Email = string.Empty; // txtEmail.Text.Trim() == string.Empty ? string.Empty : txtEmail.Text;
        sg.MobileNumber = txtMobileNumber.Text.Trim();
        sg.Civil_ID = txtCivilId.Text.Trim();
        sg.Age = 0;
        sg.LastModifiedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Today);
        sg.LastModifiedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
        if(sg.Insert()){
            ClearSessionObjects();
            Response.Redirect("Reservation.aspx?Reservation_ID=" + hidReservationId.Value, true);
        }
        else
        {
            lblGstMsg.Text = "Guest not saved. Please try again";
            lblGstMsg.ForeColor = Color.Red;
            return;
        }
    }

    protected void txtUnits_TextChanged(object sender, EventArgs e)
    {
        if (lblRate.Text != string.Empty)
        {
            Double rate = Double.Parse(lblRate.Text);
            Double units = Double.Parse(txtUnits.Text.Trim());
            Double cost = (rate * units);
            lblCost.Text = cost.ToString();
            lblAfterDiscount.Text = cost.ToString();
            txtAmountReceived.Text = cost.ToString();
        }
        else
        {
            lblPaymentMsg.Text = "Rate is Empty!!";
            lblPaymentMsg.ForeColor = Color.Red;
            return;
        }

    }
    protected void txtDiscount_TextChanged(object sender, EventArgs e)
    {
        Double discount = 0.00;
        if(txtDiscount.Text.Trim() != string.Empty)
            discount = Double.Parse(txtDiscount.Text.Trim());
            
        Double cost = Double.Parse(lblCost.Text);
            if (discount < cost)
            {
                Double costAfterDiscount = cost - discount;
                lblAfterDiscount.Text = costAfterDiscount.ToString();
                txtAmountReceived.Text = costAfterDiscount.ToString();
                return;
            }
            else
            {
                lblPaymentMsg.Text = "Discount is >= Cost!!";
                lblPaymentMsg.ForeColor = Color.Red;
                return;
            }
        
    }

    private void ClearSessionObjects()
    {
        Session.RemoveAll();
    }
    protected void paymentsGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton l = (LinkButton)e.Row.FindControl("lnkCancelButton");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to cancel this payment " +
            DataBinder.Eval(e.Row.DataItem, "Payment_ID") + "')");
        }
    }
    protected void paymentsGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            SqlInt32 paymentId = SqlInt32.Parse(e.CommandArgument.ToString());
            CancelPayment(paymentId);
        }
    }


    protected void paymentsGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlInt32 paymentId = SqlInt32.Parse(paymentsGrid.DataKeys[e.RowIndex].Value.ToString());
          CancelPayment(paymentId);
    }

    private void CancelPayment(SqlInt32 paymentId)
    {
        Reservation_Payments rp = new Reservation_Payments();
        rp.Payment_ID = paymentId;
        int reservationId = Int32.Parse(hidReservationId.Value);
        if (rp.Delete())
        {
            BindReservationPayments(reservationId);
            return;
        }
    }
    protected void paymentsGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        return;
    }

    protected void lnkCheckInButton_Click(object sender, EventArgs e)
    {
        string popupScript = "<script language='javascript'>" +
                        "window.open('CheckIn.aspx?Reservation_ID=" + hidReservationId.Value + "', 'ThisPopUp', " +
                        "'left = 200, top=150,  width=300, height=400, " +
                        "menubar=no, scrollbars=yes, resizable=yes')" +
                        "</script>";
        Page.ClientScript.RegisterStartupScript(GetType(), "PopupScript", popupScript);
    }

    protected void lnkCheckOutButton_Click(object sender, EventArgs e)
    {
        string popupScript = "<script language='javascript'>" +
                        "window.open('CheckOut.aspx?Reservation_ID=" + hidReservationId.Value + "','ThisPopUp', " +
                        "'left = 300, top=150,   width=500, height=600,  " +
                        "menubar=no, scrollbars=yes, resizable=yes')" +
                        "</script>";
        Page.ClientScript.RegisterStartupScript(GetType(), "PopupScript", popupScript);
    }


    protected void secGuestsGrid_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        secGuestsGrid.PageIndex = e.NewPageIndex;
        BindSecondaryGuests();
    }

    protected void secGuestsGrid_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dt = GetSecondaryGuests();
        if (dt != null)
        {
            dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirectionForGuests(e.SortExpression);
            secGuestsGrid.DataSource = dt;
            secGuestsGrid.DataBind();
        }

    }

    private string GetSortDirectionForGuests(string column)
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


    protected void secGuestsGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton l = (LinkButton)e.Row.FindControl("lnkDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete this record " +
            DataBinder.Eval(e.Row.DataItem, "SecondaryGuest_ID") + "')");
        }
    }

    protected void secGuestsGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int secGuestId = Convert.ToInt32(e.CommandArgument);
            DeleteAccompanyingGuest(secGuestId);
        }
        
    }

    protected void secGuestsGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int secGuestId = Int32.Parse(secGuestsGrid.Rows[e.RowIndex].Cells[0].Text);
            DeleteAccompanyingGuest(secGuestId);
        }
        catch (Exception ex) { }
    }

    private void DeleteAccompanyingGuest(int secGuestId)
    {
        SecondaryGuests sg = new SecondaryGuests();
        sg.SecondaryGuest_ID = secGuestId;
        sg.SelectOne();
        sg.Delete();
        BindSecondaryGuests();
    }


    protected void btnHidden_Click(object sender, EventArgs e)
    {
        string hidReservatioId = hidReservationId.Value;
        Response.Redirect("Reservation.aspx?Reservation_ID=" + hidReservatioId, true);
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        DataTable table = new DataTable();
        CheckOut checkout = new CheckOut();
        table = checkout.GetInvoiceByCheckOutID(hidCheckOutId.Value.ToString());
        Session["tableRpt"] = table;

        string popupScript = "<script language='javascript'>" +
                       "window.open('rpt.aspx','ThisPopUp', " +
                       "'left = 300, top=150,  " +
                       "menubar=no, scrollbars=yes, resizable=yes')" +
                       "</script>";
        Page.ClientScript.RegisterStartupScript(GetType(), "PopupScript", popupScript);

      //  Response.Redirect("rpt.aspx");
    }

    protected void reservationsGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton l = (LinkButton)e.Row.FindControl("lnkCancelButton");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to cancel this reservation " +
            DataBinder.Eval(e.Row.DataItem, "Reservation_ID") + "')");
        }
    }

    protected void reservationsGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            SqlInt32 reservationId = SqlInt32.Parse(e.CommandArgument.ToString());
            CancelReservation(reservationId);
        }
    }

    protected void reservationsGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlInt32 reservationId = SqlInt32.Parse(reservationsGrid.DataKeys[e.RowIndex].Value.ToString());
        CancelReservation(reservationId);
    }

    protected void reservationsGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        return;
    }

    private void CancelReservation(SqlInt32 reservationId)
    {
        Reservations res = new Reservations();
        res.Reservation_ID = reservationId;
        int resId = Int32.Parse(hidReservationId.Value);
        if (res.Delete())
        {
            BindReservation(resId);
            return;
        }
    }

    protected void btnPrintReservationConfirm_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Reservation_ID"] != null)
        {
            reservationId = Request.Params["Reservation_ID"] != null || Request.Params["Reservation_ID"] != "" ? Int32.Parse(Request.Params["Reservation_ID"].ToString()) : 0;
            hidReservationId.Value = reservationId.ToString();
        }
        Reservation_Payments pay = new Reservation_Payments();
        pay.Reservation_ID=SqlInt32.Parse(hidReservationId.Value.ToString());
        DataTable resevePay = pay.GetReservationPayment();
        Session["resevePay"] = resevePay;
        string popupScript = "<script language='javascript'>" +
                                "window.open('ReservConfirm.aspx','ThisPopUp12', " +
                                "'left = 300, top=150,  " +
                                "menubar=no, scrollbars=yes, resizable=yes')" +
                                "</script>";
        Page.ClientScript.RegisterStartupScript(GetType(), "PopupScript", popupScript);
        return;
    }

    protected void btnWelcomeLetter_Click(object sender, EventArgs e)
    {
        Reservation_Payments rp = new Reservation_Payments();
        rp.Reservation_ID = SqlInt32.Parse(hidReservationId.Value);
        //  rp.SelectOne();

        DataTable resevePay = rp.GetReservationPayment();
        Session["welcomeLetter"] = resevePay;
        string popupScript = "<script language='javascript'>" +
                          "window.open('Welcome.aspx','ThisPopUp1', " +
                          "'left = 300, top=150,  " +
                          "menubar=no, scrollbars=yes, resizable=yes')" +
                          "</script>";
        Page.ClientScript.RegisterStartupScript(GetType(), "PopupScript", popupScript);
    }

    protected void btnRegCard_Click(object sender, EventArgs e)
    {
        CheckIn checkIn = new CheckIn();
        checkIn.Reservation_ID = SqlInt32.Parse(hidReservationId.Value);
        DataTable tbaleCard = checkIn.SelectOne_ByReservationID();//FOR registration card
       // Session["welcomeCard"] = tbaleCard;

        tbaleCard.TableName = "RegistrationCard";
        SecondaryGuests sg = new SecondaryGuests();
        sg.Reservation_ID = SqlInt32.Parse(hidReservationId.Value);
        DataTable tbaleCardSg = sg.SelectAll();//to get the Secondary guest
        tbaleCardSg.TableName = "Guest";
        DataSet DS = new DataSet();
        DS.Tables.Add(tbaleCard);
        DS.Tables.Add(tbaleCardSg);
        Session["welcomeCard"] = DS; 
        string popupScript = "<script language='javascript'>" +
                          "window.open('RegCard.aspx','ThisPopUp1', " +
                          "'left = 300, top=150,  " +
                          "menubar=no, scrollbars=yes, resizable=yes')" +
                          "</script>";
        Page.ClientScript.RegisterStartupScript(GetType(), "PopupScript", popupScript);
    }

    protected void btnChangeRoom_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChangeRoom.aspx?ReservationID=" + hidReservationId.Value);
    }

    private void BindKnetPayment(int reservationId)
    {
        //GetReservationPayments(reservationId, ref  paymentsTbl);
        KNET_Payments knet = new KNET_Payments();
        knet.Reservation_ID = reservationId;
        knetPayTbl = knet.SelectByReservation();
        knetPaymentsGrid.DataSource = knetPayTbl;
        knetPaymentsGrid.DataBind();
    }
}