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

    private DataTable GetAllRates()
    {
        Rates rate = new Rates();
        DataTable table = new Rates().SelectAll();
        return table;
    }

    private DataTable GetRatesByType()
    {
        Rates rate = new Rates();
        rate.RateType = Int32.Parse(drpRateTypesList.SelectedValue);
        DataTable table = rate.SelectByRateType();
        return table;
    }
    private void BindGridView()
    {
         DataTable table = null;
         if (drpRateTypesList.SelectedValue == "-1")
             table = GetAllRates();
         else
             table = GetRatesByType();
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
        drpRateTypesList.Items.Insert(0, new ListItem("Select a Rate Type", "-1"));
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
            BindGridView();
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        BindGridView();
    }

    protected void grid_Sorting(object sender, GridViewSortEventArgs e)
    {
        int rateType = Int32.Parse(drpRateTypesList.SelectedValue) == -1 ? -1 : Int32.Parse(drpRateTypesList.SelectedValue);
        DataTable dt = null;
        if (rateType != -1)
            dt = GetRatesByType();
        else
            dt = GetAllRates();

        if (dt != null)
        {
            dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
            grid.DataSource = dt;
            grid.DataBind();
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


    protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            /*
            LinkButton l = (LinkButton)e.Row.FindControl("lnkDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete this record " +
            DataBinder.Eval(e.Row.DataItem, "Rate_ID") + "')");
             */
        }
    }

    protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int rateId = Convert.ToInt32(e.CommandArgument);
            DeleteRate(rateId);
        }
    }

    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int rateId = Int32.Parse(grid.Rows[e.RowIndex].Cells[0].Text);
            DeleteRate(rateId);
        }
        catch (Exception ex) { }
    }

    private void DeleteRate(int rateId)
    {
        Rates rate = new Rates();
        rate.Rate_ID = rateId;
        rate.SelectOne();
        rate.Delete();
        BindGridView();
    }
}