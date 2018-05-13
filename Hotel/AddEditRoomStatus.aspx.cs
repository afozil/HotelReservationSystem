using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Drawing;

public partial class Hotel_AddEditRoomStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
           // fillRoomTypes();
            //fillProperties();

            int roomID = 0;
            Session["Prop_Action"] = "I";
            if (Request.QueryString["RoomStatus_ID"] != null)
            {
                roomID = Convert.ToInt32(Request.QueryString["RoomStatus_ID"]);
                Session["Prop_Action"] = "U";
            }


            if (Session["Prop_Action"] == "U")
            {
                // int proID= int.Parse(Session["Pro_ID"].ToString());
                RoomStatuses room = new RoomStatuses();
                room.RoomStatus_ID = roomID;
                room.SelectOne();

                txtStatusID.Text = room.RoomStatus_ID.ToString();
                txtStatusEn.Text = room.RoomStatus_EN;
                txtStatusAr.Text = room.RoomStatus_AR;
                txtDesc.Text = room.Description;
               
            }



        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            RoomStatuses room = new RoomStatuses();
            room.RoomStatus_EN = txtStatusEn.Text;
            room.RoomStatus_AR = txtStatusAr.Text;
            room.Description = txtDesc.Text;
           
            if (Session["Prop_Action"] == "U")
            {
                room.LastModifiedUser = 1;
                room.RoomStatus_ID = int.Parse(txtStatusID.Text);
                room.LastModifiedDate = DateTime.Now;
                bool retval = room.Update();
            }
            else
            {
                room.CreatedUser = 1;
                bool retval = room.Insert();
            }

            lblMsg.Text = "Data Saved successfully.";
            lblMsg.ForeColor = Color.Green;
        }
        catch (Exception ex)
        {

            lblMsg.Text = "Data not Saved .";
            lblMsg.ForeColor = Color.Red;
        }
    }


}