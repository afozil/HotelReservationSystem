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

public partial class Hotel_AddEditRate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindRateTypes();
            
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
                Rates rate = new Rates();
                rate.Rate_ID = rateId;
                rate.SelectOne();

                hidRateId.Value = rate.Rate_ID.ToString();
                foreach (ListItem item in drpRateTypesList.Items)
                {
                    if (item.Value.Equals(rate.RateType.ToString()))
                    {
                        item.Selected = true;
                    }
                }
                txtRateNameEn.Text = rate.RateDescription_EN.ToString();
                txtRateNameAr.Text = rate.RateDescription_AR.ToString();
                txtFromDate.Text = rate.FromDate.ToString();
                txtToDate.Text = rate.ToDate.ToString();
                txtRate.Text = rate.Rate.ToString();
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

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Rates rate = new Rates();
            rate.RateType = SqlInt32.Parse(drpRateTypesList.SelectedValue);
            rate.RateDescription_EN = txtRateNameEn.Text;
            rate.RateDescription_AR = txtRateNameAr.Text;
            rate.FromDate = SqlDateTime.Parse(txtFromDate.Text);
            rate.ToDate = SqlDateTime.Parse(txtToDate.Text);
            rate.Rate = SqlMoney.Parse(txtRate.Text);
            if (rate.FromDate > rate.ToDate)
            {
                lblMsg.Text = "From Date cannot be after To Date ";
                lblMsg.ForeColor = Color.Red;
                return;
            }
            rate.LastModifiedUser = 1;
            rate.LastModifiedDate = SqlDateTime.Parse(DateTime.Now.ToString());
            bool retval = false;
            if (Session["Prop_Action"] == "U")
            {
                rate.Rate_ID  = Int32.Parse(hidRateId.Value);
                retval = rate.Update();
            }
            else
            {
                rate.CreatedUser = 1;
                rate.CreatedDate = rate.LastModifiedDate;
                retval = rate.Insert();
            }
            lblMsg.Text = "Data Saved successfully.";
            lblMsg.ForeColor = Color.Green;

            if (retval)
                Response.Redirect("RatesList.aspx", true);
            else
                lblMsg.Text = rate.ErrorDesc.ToString();
        }
        catch (Exception ex)
        {

            lblMsg.Text = "Data not Saved .";
            lblMsg.ForeColor = Color.Red;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("RatesList.aspx", true);
    }
}