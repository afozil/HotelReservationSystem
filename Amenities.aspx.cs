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

public partial class Admin_Amenities : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            //  BindRateTypes();
            BindGridView();
        }
    }
    private void BindGridView()
    {
        DataTable table = new Amenities().SelectAll();
        grid.DataSource = table;
        grid.DataBind();
    }
}