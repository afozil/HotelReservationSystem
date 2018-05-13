using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Data.SqlTypes;
using System.Text;
using System.Drawing;

public partial class Configuration_BillsServices : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            //  BindRateTypes();
            BindGridView();
        }
    }

    private DataTable GetBillsAndServices()
    {
        DataTable table = new BillsServices().SelectAll();
        return table;
    }

    private void BindGridView()
    {
        DataTable table = GetBillsAndServices();
        grid.DataSource = table;
        grid.DataBind();
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        BindGridView();
    }

    protected void grid_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dt = GetBillsAndServices();
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
            LinkButton l = (LinkButton)e.Row.FindControl("lnkDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete this record " +
            DataBinder.Eval(e.Row.DataItem, "BillsServices_ID") + "')");
        }
    }

    protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int billsServiceId = Convert.ToInt32(e.CommandArgument);
            DeleteBillsService(billsServiceId);
        }
    }

    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int billsServiceId = Int32.Parse(grid.Rows[e.RowIndex].Cells[0].Text);
            DeleteBillsService(billsServiceId);
        }
        catch (Exception ex) { }
    }

    private void DeleteBillsService(int billsServiceId)
    {
        BillsServices bs = new BillsServices();
        bs.BillsServices_ID = billsServiceId;
        bs.SelectOne();

        if (bs.Delete())
            BindGridView();
        else
        {
            if (bs.ErrorCode == -10)
            {
                lblMsg.Text = " Cannot Delete. There is a Checked-In Reservation using this Bills & Service";
                lblMsg.ForeColor = Color.Red;
                return;
            }
        }
        BindGridView();
    }
}