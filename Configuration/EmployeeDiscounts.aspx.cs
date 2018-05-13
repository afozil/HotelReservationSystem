﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Data.SqlTypes;
using System.Text;

public partial class Admin_EmployeeDiscounts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            BindGridView();
    }

    private DataTable GetDiscounts()
    {
        DataTable table = new EmployeeDiscounts().SelectAll();
        return table;
    }

    private void BindGridView()
    {
        grid.DataSource = GetDiscounts();
        grid.DataBind();
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        BindGridView();
    }

    protected void grid_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dt = GetDiscounts();
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
            DataBinder.Eval(e.Row.DataItem, "DiscountID") + "')");
        }
    }

    protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int discountId = Convert.ToInt32(e.CommandArgument);
            DeleteEmployeeDiscount(discountId);
        }
    }

    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int discountId = Int32.Parse(grid.Rows[e.RowIndex].Cells[0].Text);
            DeleteEmployeeDiscount(discountId);
        }
        catch (Exception ex) { }
    }

    private void DeleteEmployeeDiscount(int discountId)
    {
        EmployeeDiscounts discount = new EmployeeDiscounts();
        discount.DiscountID = discountId;
        discount.SelectOne();
        discount.Delete();
        BindGridView();
    }
}