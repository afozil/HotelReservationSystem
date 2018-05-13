using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using HotelReservationSystem;
using HotelReservationSystemDAL;
using System.Data;


public partial class Configuration_UsersList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {

            fillGrid();
        }
    }
    private void fillGrid()
    {
        DataTable table = new Employees().SelectAll();
        AspNetUsers users = new AspNetUsers();

        //table=users.SelectAll();

        if (table.Rows.Count > 0)
        {
            Session["gridTable"] = table;
            grid.DataSource = table;
            grid.DataBind();

        }

    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        fillGrid();
    }
    protected void grid_Sorting(object sender, GridViewSortEventArgs e)
    {
        // fillGrid();
        //Retrieve the table from the session object.
        DataTable dt = Session["gridTable"] as DataTable;

        if (dt != null)
        {

            //Sort the data.
            //  DataView view = dt.DefaultView;
            //view.Sort=  e.SortExpression + " " + GetSortDirection(e.SortExpression);
            dt.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
            grid.DataSource = Session["gridTable"];
            grid.DataBind();
            // fillGrid();
        }

    }
    private string GetSortDirection(string column)
    {
        // By default, set the sort direction to ascending.
        string sortDirection = "ASC";
        // Retrieve the last column that was sorted.
        string sortExpression = ViewState["SortExpression"] as string;
        if (sortExpression != null)
        {
            // Check if the same column is being sorted.
            // Otherwise, the default value can be returned.
            if (sortExpression == column)
            {
                string lastDirection = ViewState["SortDirection"] as string;
                if ((lastDirection != null) && (lastDirection == "ASC"))
                {
                    sortDirection = "DESC";
                }
            }
        }
        // Save new values in ViewState.
        ViewState["SortDirection"] = sortDirection;
        ViewState["SortExpression"] = column;
        return sortDirection;
    }

}