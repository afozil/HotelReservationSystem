using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Data.SqlTypes;
using System.Text;
using System.Drawing;
using System.Collections.Generic;
using HotelReservationSystemDAL.DAL;

public partial class Hotel_AddEditRate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindRateTypes();
            BindRateStatuses();
            BindRoomTypes();
            int rateId = 0;
            Session.Remove("Prop_Action");
            if (Request.QueryString["Rate_ID"] != null)
            {
                rateId = Convert.ToInt32(Request.QueryString["Rate_ID"]);
                Session["Prop_Action"] = "U";
            }


            if (Session["Prop_Action"] == "U")
            {
                // int proID= int.Parse(Session["Pro_ID"].ToString());
               BindRate(rateId);

            }
        }
    }

    private void BindRateTypes()
    {
        DataTable table = new RateTypes().SelectAll();
        drpRateTypesList.DataSource = table;
        drpRateTypesList.DataTextField = table.Columns["RateType"].ToString();
        drpRateTypesList.DataValueField = table.Columns["RateType_ID"].ToString();
        drpRateTypesList.DataBind();
    }
    private void BindRateStatuses()
    {
        DataTable table = new Rates().SelectAllRateStatuses();
        drpRateStatus.DataSource = table;
        drpRateStatus.DataTextField = table.Columns["RateStatus_EN"].ToString();
        drpRateStatus.DataValueField = table.Columns["RateStatus_ID"].ToString();
        drpRateStatus.DataBind();
    }
    private void BindRoomTypes()
    {
        DataTable table = new RoomTypes().SelectAll();
        lstRoomTypes.DataSource = table;
        lstRoomTypes.DataTextField = table.Columns["Description"].ToString();
        lstRoomTypes.DataValueField = table.Columns["RoomType_ID"].ToString();
        lstRoomTypes.DataBind();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        String result = "Failed";
        if (!checkDates())
            return;
        try
        {
            Rates rate = new Rates();
            rate.RateType = SqlInt32.Parse(drpRateTypesList.SelectedValue);
            rate.RateDescription_EN = txtRateNameEn.Text;
            rate.RateDescription_AR = txtRateNameEn.Text/*txtRateNameAr.Text*/;
            DateTime fromDate = DateTime.Parse(txtFromDate.Text);
            rate.FromDate = Utility.GetSqlCheckInTimeFromDate(fromDate);
            DateTime toDate = DateTime.Parse(txtToDate.Text);
            rate.ToDate = Utility.GetSqlCheckOutTimeFromDate(toDate);
            rate.Rate = SqlMoney.Parse(txtRate.Text);
            rate.RateStatus = SqlInt32.Parse(drpRateStatus.SelectedValue);
            if (rate.FromDate > rate.ToDate)
            {
                lblMsg.Text = "From Date cannot be after To Date ";
                lblMsg.ForeColor = Color.Red;
                return;
            }
            rate.LastModifiedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
            rate.LastModifiedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
            List<WeekEnd> weekends = null;
            

            bool retval = false;
            if (Session["Prop_Action"] == "U")
            {
                rate.Rate_ID = Int32.Parse(hidRateId.Value);
                retval = rate.Update();
                result = (rate.ErrorCode + "-" + rate.ErrorDesc).ToString();
            }
            else
            {
                rate.CreatedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
                rate.CreatedDate = rate.LastModifiedDate;
                if (rate.RateType == RATE_TYPES.WEEKEND)
                {
                    weekends = Utility.GetWeekEnds(fromDate, toDate);
                    int counter=0;
                    Rates newRate = rate;
                    string name = rate.RateDescription_EN.ToString();
                    foreach (WeekEnd we in weekends)
                    {
                        counter=++counter;
                        newRate.FromDate = we.StartDate;
                        newRate.ToDate = we.EndDate;
                        newRate.RateDescription_EN = newRate.RateDescription_EN  + "-" + we.StartDate.Value.Month.ToString() + "-" + counter.ToString();
                        retval = newRate.Insert();
                        result = result + ": " + (newRate.ErrorCode + "-" + newRate.ErrorDesc).ToString() + "<BR/>";
                        if (retval)
                            saveRateToRoomType(newRate, ref result);
                        newRate.RateDescription_EN = name;
                    }
                }
                else
                {
                    retval = rate.Insert();
                    result = (rate.ErrorCode + "-" + rate.ErrorDesc).ToString();
                    if (retval)
                        saveRateToRoomType(rate, ref result);
                }
            }
            
        }
        catch (Exception ex)
        {

            lblMsg.Text = "Data not Saved .";
            lblMsg.ForeColor = Color.Red;
        }
    }

    private void saveRateToRoomType(Rates rate, ref String result)
    {
        Rate_To_RoomType rateToRoomType = new Rate_To_RoomType();
        rateToRoomType.Rate_ID = rate.Rate_ID;
        if (rateToRoomType.DeleteAllWRate_IDLogic())
        {
            foreach (ListItem li in lstRoomTypes.Items)
            {
                if (li.Selected)
                {
                    rateToRoomType.RoomType_ID = Int32.Parse(li.Value);
                    int counter = 0;
                    if (rateToRoomType.Insert())
                    {
                        result = lblMsg.Text + "; " + ++counter + "Data Saved.";
                        lblMsg.ForeColor = Color.Green;
                    }
                    else
                    {
                        lblMsg.Text = result;
                        lblMsg.ForeColor = Color.Red;
                    }
                }
            }
        }
    }

    private void BindRate(int rateId)
    {
        Rates rate = new Rates();
        rate.Rate_ID = rateId;
        rate.SelectOne();
        hidRateId.Value = rate.Rate_ID.ToString();
        drpRateTypesList.Items.FindByValue(rate.RateType.ToString()).Selected = true;
        txtRateNameEn.Text = rate.RateDescription_EN.ToString();
        //txtRateNameAr.Text = rate.RateDescription_AR.ToString();
        txtFromDate.Text = DateTime.Parse(rate.FromDate.ToString()).ToString("MM/dd/yyyy");
        txtToDate.Text = DateTime.Parse(rate.ToDate.ToString()).ToString("MM/dd/yyyy");
        txtRate.Text = rate.Rate.ToString();
        drpRateStatus.Items.FindByValue(rate.RateStatus.ToString()).Selected = true;
        BindRoomTypesByRate(rateId);
    }

    private void BindRoomTypesByRate(int rateId)
    {
        Rate_To_RoomType rateToRoomType = new Rate_To_RoomType();
        rateToRoomType.Rate_ID = rateId;
        DataTable table = rateToRoomType.SelectRoomTypesByRateID();
        if (table.Rows.Count > 0)
        {
            foreach (DataRow row in table.Rows)
            {
                foreach (ListItem li in lstRoomTypes.Items)
                {
                    if (li.Value.Equals(row["RoomType_ID"].ToString()))
                        li.Selected = true;
                }
            }
        }
    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("RatesList.aspx", true);
    }
    protected void btnGetWeekEnds_Click(object sender, EventArgs e)
    {
        if (!checkDates())
            return;

        DateTime startDate = DateTime.Parse(this.txtFromDate.Text);
        DateTime endDate = DateTime.Parse(this.txtToDate.Text);
        List<WeekEnd> weekends = Utility.GetWeekEnds(startDate, endDate);
        grid.DataSource = weekends;
        grid.DataBind();
        lblMsg.Text = string.Empty;
        grid.Visible = true;
    }
    protected void drpRateTypesList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!drpRateTypesList.SelectedValue.Equals(RATE_TYPES.WEEKEND.ToString()))
        {
            btnGetWeekEnds.Visible = false;
            grid.Visible = false;
            return;
        }
        btnGetWeekEnds.Visible = true;
        grid.Visible = false;
    }

    private bool checkDates()
    {
        bool retVal = true;
        if (txtFromDate.Text.Trim() == string.Empty || txtFromDate.Text.Trim() == "" ||
            txtToDate.Text.Trim() == string.Empty || txtToDate.Text.Trim() == "")
        {
            lblMsg.Text = "Start/End date is Empty!!";
            lblMsg.ForeColor = Color.Red;
            retVal=false;
        }
        try
        {
            DateTime startDate = DateTime.Parse(this.txtFromDate.Text);
            DateTime endDate = DateTime.Parse(this.txtToDate.Text);
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Start/End date is not in correct format!!";
            lblMsg.ForeColor = Color.Red;
            retVal = false;
        }
        return retVal;
    }
}