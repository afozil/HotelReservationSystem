using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;

public partial class Hotel_Properties : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindGridView(0);
            BindProperties();
        }


    }

    private void BindGridView(int propertyId)
    {
        DataTable table = null;
        Properties property = new Properties();
        if (propertyId == 0)
        {
            table = property.SelectAll();
        }
        else
        {
            property.PropertyID = propertyId;
            table = property.SelectOne();
        }
            
        grid.DataSource = table;
        grid.DataBind();
    }

    private void BindProperties()
    {
        DataTable table = new Properties().SelectAll();
        drpProperties.DataSource = table;
        drpProperties.DataTextField = table.Columns["PropertyName_EN"].ToString();
        drpProperties.DataValueField = table.Columns["PropertyID"].ToString();
        drpProperties.DataBind();
    }

    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        try
        {
            string strRoomID = grid.Rows[e.RowIndex].Cells[0].Text;
            Properties room = new Properties();
            room.PropertyID = int.Parse(strRoomID);
            room.SelectOne();
            room.Delete();
            // bool retval=new Rooms().Delete(room.Room_ID)

            BindGridView(0);
        }
        catch (Exception ex) { }
    }



    protected void grid_RowEditing(object sender, GridViewEditEventArgs e)
    { /*
        string strRoomID = grid.Rows[e.RowIndex].Cells[0].Text;
    Session["Pro_ID"] = strRoomID;
        Session["Prop_Action"] = "U";
        Response.Redirect("AddProperties.aspx");
        */
    }
    protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Delete")
            {
                //DataTable dt = (DataTable)ViewState["tbl"];
                //int id = int.Parse(e.CommandArgument.ToString());
                //if (dbo.deleterecords("job", "id=" + id + "") == true)
                //{
                //    Fillgrid();
                //}

            }
            else if (e.CommandName == "EditRow")
            {
               int p=int.Parse( e.CommandArgument.ToString());
                int Rowindex = int.Parse(e.CommandArgument.ToString());
              //  string id = grid.Rows[Rowindex][0].ToString();
               
            }
        }
        catch (Exception ex)
        {
            Exception E = ex;
        }
    }
    protected void drpProperties_SelectedIndexChanged(object sender, EventArgs e)
    {
        int propertyId = Int32.Parse(drpProperties.SelectedValue);
        BindGridView(propertyId);

    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("Properties.aspx", true);
    }
}