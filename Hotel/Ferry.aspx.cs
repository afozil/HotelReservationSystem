using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Drawing;

public partial class Hotel_Ferry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindGridView(0);
            BindFerry();
        }
    }
    private void BindGridView(int ferryId)
    {
        DataTable table = null;
        Ferry ferry = new Ferry();
        if (ferryId == 0)
        {
            table = ferry.SelectAll();
        }
        else
        {
            ferry.Ferry_ID = ferryId;
            table = ferry.SelectOne();
        }

        grid.DataSource = table;
        grid.DataBind();
    }

    private void BindFerry()
    {
        DataTable table = new Ferry().SelectAll();
        if(table.Rows.Count > 0) { 
        drpFerry.DataSource = table;
        drpFerry.DataTextField = table.Columns["FerryName_EN"].ToString();
        drpFerry.DataValueField = table.Columns["Ferry_ID"].ToString();
        drpFerry.DataBind();
        }
    }

    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        try
        {
                int ferryId = Int32.Parse(grid.Rows[e.RowIndex].Cells[0].Text);
                DeleteFerry(ferryId);
            
        }
        catch (Exception ex) { }
    }

    private void DeleteFerry(int ferryId)
    {
        Ferry ferry = new Ferry();
        ferry.Ferry_ID = ferryId;
        ferry.SelectOne();
        if(ferry.Delete())
            BindGridView(0);
        else
        {
                lblMsg.Text = DBResult.FAILURE + " Could not Delete.";
                lblMsg.ForeColor = Color.Red;
        }
    }
    protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton l = (LinkButton)e.Row.FindControl("lnkDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete this record " +
            DataBinder.Eval(e.Row.DataItem, "Ferry_ID") + "')");
        }
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
                int ferryId = Convert.ToInt32(e.CommandArgument);
                DeleteFerry(ferryId);

            }
            else if (e.CommandName == "EditRow")
            {
                int p = int.Parse(e.CommandArgument.ToString());
                int Rowindex = int.Parse(e.CommandArgument.ToString());
            }
        }
        catch (Exception ex)
        {
            Exception E = ex;
        }
    }
    protected void drpFerry_SelectedIndexChanged(object sender, EventArgs e)
    {
        int ferryId = Int32.Parse(drpFerry.SelectedValue);
        BindGridView(ferryId);

    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("Ferry.aspx", true);
    }
}