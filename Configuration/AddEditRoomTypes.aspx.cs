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

public partial class Hotel_AddEditRoomTypes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            int roomID = 0;
            Session["Prop_Action"] = "I";
            if (Request.QueryString["RoomType_ID"] != null)
            {
                roomID = Convert.ToInt32(Request.QueryString["RoomType_ID"]);
                Session["Prop_Action"] = "U";
            }


            if (Session["Prop_Action"] == "U")
            {
                // int proID= int.Parse(Session["Pro_ID"].ToString());
                RoomTypes room = new RoomTypes();
                room.RoomType_ID = roomID;
                room.SelectOne();
                txtTypeID.Value = room.RoomType_ID.ToString();
                txtTypeEn.Text = room.RoomType_EN.ToString();
               // txtTypeAr.Text = room.RoomType_AR.ToString();
                txtDesc.Text = room.Description.ToString();
                chkIsOnline.Checked = (Boolean)room.IsOnline;

            }
        }
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            RoomTypes room = new RoomTypes();
            room.RoomType_EN = txtTypeEn.Text;
            room.RoomType_AR = txtTypeEn.Text/*txtTypeAr.Text*/;
            room.Description = txtDesc.Text;
            SqlDateTime now=SqlDateTime.Parse(DateTime.Now.ToString());
            room.LastModifiedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
            room.LastModifiedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
            room.IsOnline = (SqlBoolean)chkIsOnline.Checked;
            if (Session["Prop_Action"] == "U")
            {
                room.RoomType_ID = int.Parse(txtTypeID.Value);
                bool retval = room.Update();
            }
            else
            {
                room.CreatedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
                room.CreatedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
                bool retval = room.Insert();
            }

            lblMsg.Text = "Data Saved successfully.";
            lblMsg.ForeColor = Color.Green;
            Response.Redirect("RoomTypes.aspx", true);
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Data not Saved .";
            lblMsg.ForeColor = Color.Red;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("RoomTypes.aspx", true);
    }
}