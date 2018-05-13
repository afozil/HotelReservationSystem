using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Data.SqlTypes;
using System.Drawing;
using System.Text;

public partial class Hotel_RateToRoomType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindRates();
            BindRoomTypes();
        }
        
    }

    private void BindRates()
    {
        DataTable table = new Rates().SelectAll();
        drpRates.DataSource = table;
        drpRates.DataTextField = table.Columns["RateDescription_EN"].ToString();
        drpRates.DataValueField = table.Columns["Rate_ID"].ToString();
        drpRates.DataBind();
        drpRates.Items.Insert(0, new ListItem("Select a Rate...", "-1"));
    }

    private void BindRoomTypes()
    {
        DataTable table = new RoomTypes().SelectAll();
        lstRoomTypes.DataSource = table;
        lstRoomTypes.DataTextField = table.Columns["RoomType_EN"].ToString();
        lstRoomTypes.DataValueField = table.Columns["RoomType_ID"].ToString();
        lstRoomTypes.DataBind();
    }

    private void GetRoomsTypesByRate(int rateId)
    {
        Rate_To_RoomType rateToRoomType = new Rate_To_RoomType();
        rateToRoomType.Rate_ID = rateId;
        DataTable table = rateToRoomType.SelectRoomTypesByRateID();
        if(table.Rows.Count >0 ){
            foreach (DataRow row in table.Rows)
            {
                foreach (ListItem li in lstRoomTypes.Items)
                {
                    if (li.Value.Equals(row["RoomType_ID"].ToString()))
                        li.Selected = true;
                }
            }
        }
        roomTypesGrid.DataSource = table;
        roomTypesGrid.DataBind();
    }


    protected void drpRates_SelectedIndexChanged(object sender, EventArgs e)
    {
        int rateId = Int32.Parse(drpRates.SelectedValue);
        foreach (ListItem li in lstRoomTypes.Items){
            li.Selected = false;
        }
        Rates rate = new Rates();
        rate.Rate_ID = rateId;
        DataTable table = rate.SelectOne();
        rateGrid.DataSource = table;
        rateGrid.DataBind();
        if (rateId != -1) GetRoomsTypesByRate(rateId);

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Rate_To_RoomType rateToRoomType = new Rate_To_RoomType();
        rateToRoomType.Rate_ID= Int32.Parse(drpRates.SelectedValue);
        if (rateToRoomType.DeleteAllWRate_IDLogic())
        {
            foreach (ListItem li in lstRoomTypes.Items)
            {
                if (li.Selected)
                {
                    rateToRoomType.RoomType_ID = Int32.Parse(li.Value);
                    int counter=0;
                    if(rateToRoomType.Insert()){
                        lblMsg.Text = ++counter + "Data Saved.";
                        lblMsg.ForeColor = Color.Green;
                     }
                }
            }
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("RateToRoomType.aspx", true);
    }
}