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

public partial class Hotel_RatesList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindRateTypes();
            BindGridView();
        }
    }

    private void BindGridView()
    {
        DataTable table = new Rates().SelectAll();
        grid.DataSource = table;
        grid.DataBind();
    }

    private void BindRateTypes()
    {
        DataTable table = new RateTypes().SelectAll();
        drpRateTypesList.DataSource = table;
        drpRateTypesList.DataTextField=table.Columns["RateType"].ToString();
        drpRateTypesList.DataValueField=table.Columns["RateType_ID"].ToString();
        drpRateTypesList.DataBind();
    }
    protected void btnSrchRates_Click(object sender, EventArgs e)
    {
        Hashtable srchCriteria = new Hashtable();

        int rateTypeId = Int32.Parse(drpRateTypesList.SelectedValue);
        srchCriteria.Add("RateType_ID", rateTypeId);
        if (txtFromDate != null && txtFromDate.Text != string.Empty)
        {
            srchCriteria.Add("FromDate", txtFromDate.Text);
        }
        if (txtToDate != null && txtToDate.Text != string.Empty)
        {
            srchCriteria.Add("ToDate", txtToDate.Text);
        }
        /*if (txtFromDate != null && txtFromDate.Text != string.Empty)
        {
            try
            {
                //SqlDateTime sqlTime = SqlDateTime.Parse(txtFromDate.Text);
                string 
            }
            catch (Exception e)
            {
                Console.WriteLine( e.StackTrace);
            }
        }
        if (txtToDate != null && txtToDate.Text != string.Empty)
        {
            try
            {
                SqlDateTime sqlTime = SqlDateTime.Parse(txtToDate.Text);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }
        }*/
        DataTable table = new Rates().Search(srchCriteria);
        grid.DataSource = table;
        grid.DataBind();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("RatesList.aspx", true);
    }

    protected void drpRateTypesList_SelectedIndexChanged(object sender, EventArgs e)
    {
        Rates rate = new Rates();
        rate.RateType = Int32.Parse(drpRateTypesList.SelectedValue);
        DataTable table = rate.SelectByRateType();
        grid.DataSource = table;
        grid.DataBind();
    }
}