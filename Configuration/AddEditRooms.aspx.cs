using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Drawing;
using System.Data.SqlTypes;

public partial class Hotel_AddEditRooms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            fillRoomTypes();
            fillProperties();
            //BindRoomStatuses();

            int roomID = 0;
            Session.Remove("Prop_Action");
            if (Request.QueryString["Room_ID"] != null)
            {
                roomID = Convert.ToInt32(Request.QueryString["Room_ID"]);
                Session["Prop_Action"] = "U";
            }
            if (Session["Prop_Action"] == "U")
                BindRoom(roomID);
        }
    }
    protected void fillRoomTypes()
    {
        DataTable table = new RoomTypes().SelectAll();
        cboRoomType.DataSource = table;
        cboRoomType.DataTextField = table.Columns["RoomType_EN"].ToString();
        cboRoomType.DataValueField = table.Columns["RoomType_ID"].ToString();
        cboRoomType.DataBind();
    }

    /*protected void BindRoomStatuses()
    {
        DataTable table = new RoomStatuses().SelectAll();
        drpRoomStatus.DataSource = table;
        drpRoomStatus.DataTextField = table.Columns["RoomStatus_EN"].ToString();
        drpRoomStatus.DataValueField = table.Columns["RoomStatus_ID"].ToString();
        drpRoomStatus.DataBind();
    }*/

    protected void fillProperties()
    {
        DataTable table = new Properties().SelectAll();
        cboProperties.DataSource = table;
        cboProperties.DataTextField = table.Columns["PropertyName_EN"].ToString();
        cboProperties.DataValueField = table.Columns["PropertyID"].ToString();
        cboProperties.DataBind();

    }

    private void BindRoom(int roomId)
    {
        Rooms room = new Rooms();
        room.Room_ID = roomId;
        DataTable rm = room.SelectOne();

        hidRoomId.Value = room.Room_ID.ToString();
        txtRoomNameEn.Text = room.RoomName_EN.ToString();
        txtRoomNameAr.Text = room.RoomName_AR.ToString();
        txtDesc.Text = room.Description.ToString();
        txtRemarks.Text = room.Remarks.ToString();
        txtRoomNumber.Text = room.RoomNumber.ToString();
        drpIsCookingFacilityVailable.ClearSelection();
        drpIsCookingFacilityVailable.Items.FindByValue(room.IsCookingFaclity_Available.ToString()).Selected=true;
        drpIsOutOfOrder.ClearSelection();
        drpIsOutOfOrder.Items.FindByValue(room.Is_Out_Of_Order.ToString()).Selected=true;
        drpIsReferigeratorVailable.ClearSelection();
        drpIsReferigeratorVailable.Items.FindByValue(room.IsRefregerator_Available.ToString()).Selected=true;
        drpMaxGents.ClearSelection();
        drpMaxGents.Items.FindByValue(room.MaximumGents_Allowed.ToString()).Selected=true;
        drpMaxKids.ClearSelection();
        drpMaxKids.Items.FindByValue(room.MaximumKids_Allowed.ToString()).Selected=true;
        drpMaxOccupancy.ClearSelection();
        drpMaxOccupancy.Items.FindByValue(room.MaximumOccupancy_Allowed.ToString()).Selected=true;
        drpNumBathrooms.ClearSelection();
        drpNumBathrooms.Items.FindByValue(room.Number_Of_Bathrooms.ToString()).Selected=true;
        drpNumBeds.ClearSelection();
        drpNumBeds.Items.FindByValue(room.Number_Of_Beds.ToString()).Selected=true;
        drpNumKitchens.ClearSelection();
        drpNumKitchens.Items.FindByValue(room.Number_Of_Kitchen.ToString()).Selected=true;
        drpNumLivingRooms.ClearSelection();
        drpNumLivingRooms.Items.FindByValue(room.Number_Of_LivingRooms.ToString()).Selected=true;
        drpNumTV.ClearSelection();
        drpNumTV.Items.FindByValue(room.Number_Of_TV.ToString()).Selected=true;
        drpNumBedRooms.ClearSelection();
        drpNumBedRooms.Items.FindByValue(room.Number_Of_BedRooms.ToString()).Selected=true;
        cboRoomType.ClearSelection();
        cboRoomType.Items.FindByValue(room.RoomType_ID.ToString()).Selected = true;
        cboProperties.ClearSelection();
        cboProperties.Items.FindByValue(room.Property_ID.ToString()).Selected=true;

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Rooms room  = new Rooms();
            room.Property_ID = int.Parse(cboProperties.SelectedItem.Value);
            room.RoomType_ID = int.Parse(cboRoomType.SelectedItem.Value);
            room.RoomNumber = txtRoomNumber.Text;
            room.RoomName_EN = txtRoomNameEn.Text;
            room.RoomName_AR = txtRoomNameAr.Text;
            room.Description = txtDesc.Text;
            room.RoomStatus_ID = 1005;//Int32.Parse(drpRoomStatus.SelectedValue);
            room.Number_Of_BedRooms = Int32.Parse(drpNumBedRooms.SelectedValue);
            room.Number_Of_Beds = Int32.Parse(drpNumBeds.SelectedValue);
            room.Number_Of_Bathrooms = Int32.Parse(drpNumBathrooms.SelectedValue);
            room.Number_Of_Kitchen = Int32.Parse(drpNumKitchens.SelectedValue);
            room.Number_Of_LivingRooms = Int32.Parse(drpNumLivingRooms.SelectedValue);
            room.IsCookingFaclity_Available = Int32.Parse(drpIsCookingFacilityVailable.SelectedValue);
            room.IsRefregerator_Available = Int32.Parse(drpIsReferigeratorVailable.SelectedValue);
            room.Number_Of_TV = Int32.Parse(drpNumTV.SelectedValue);
            room.MaximumGents_Allowed = Int32.Parse(drpMaxGents.SelectedValue);
            room.MaximumKids_Allowed = Int32.Parse(drpMaxKids.SelectedValue);
            room.MaximumOccupancy_Allowed = Int32.Parse(drpMaxOccupancy.SelectedValue);
            room.Remarks = txtRemarks.Text;
            room.Is_Out_Of_Order = 0;
           /*
            room.Is_Out_Of_Order = Int32.Parse(drpIsOutOfOrder.SelectedValue);
            if (room.Is_Out_Of_Order == 1)
            {
                room.Out_Of_Order_FromDate = SqlDateTime.Parse(txtOutOfOrderFromDate.Text);
                room.Out_Of_Order_ToDate = SqlDateTime.Parse(txtOutOfOrderToDate.Text);
                room.Out_Of_Order_MarkedBy = 1;

            }
            * */
            room.LastModifiedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
            room.LastModifiedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
            
            CurrentRoomStatus curRmStatus = new CurrentRoomStatus();
            curRmStatus.FromDate = SqlDateTime.Parse(DateTime.Now.ToString());
            curRmStatus.RoomStatus = room.RoomStatus_ID;
            
            curRmStatus.ToDate = SqlDateTime.Parse(DateTime.Now.ToString());
            curRmStatus.LastModifiedDate = room.LastModifiedDate;
            curRmStatus.LastModifiedUser = room.LastModifiedUser;
            if (Session["Prop_Action"] == "U")
            {
                curRmStatus.Comments = "Updating an existing Room";
                room.Room_ID = Int32.Parse(hidRoomId.Value);
                if (room.Update())
                {
                    curRmStatus.Room_ID = room.Room_ID;
                    curRmStatus.Update();
                }
                else
                {
                    lblMsg.Text = "Room not saved";
                    if (room.ErrorCode == -10)
                        lblMsg.Text = "There is alredy a Room with the same Room Number";

                    lblMsg.ForeColor = Color.Red;
                }
            }
            else
            {
                room.CreatedUser = room.LastModifiedUser;
                room.CreatedDate = room.LastModifiedDate;
                curRmStatus.Comments = "Adding a new Room";
                if (room.Insert())
                {
                    curRmStatus.Room_ID = room.Room_ID;
                    curRmStatus.Insert();
                }
                else
                {
                    lblMsg.Text = "Room not saved";
                    if (room.ErrorCode == -10)
                        lblMsg.Text = "There is alredy a Room with the same Room Number";

                    lblMsg.ForeColor = Color.Red;
                }
            }
            
            lblMsg.Text = "Data Saved successfully.";
            lblMsg.ForeColor = Color.Green;

            Response.Redirect("~/Configuration/Rooms.aspx", true);
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Data not Saved .";
            lblMsg.ForeColor = Color.Red;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Rooms.aspx", true);
    }
}



