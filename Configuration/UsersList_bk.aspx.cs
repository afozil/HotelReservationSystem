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


public partial class Configuration_UsersList_bk : System.Web.UI.Page
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
        DataTable table = new DataTable();
        AspNetUsers users = new AspNetUsers();
        table=users.SelectAll();
        if(table.Rows.Count>0)
        {
            grid.DataSource = table;
            grid.DataBind();

        }

    }
}