using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystemDAL;
using System.Data;
using System.Data.SqlTypes;
using System.Drawing;

public partial class Hotel_AddEditFerry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int ferryID = 0;
            if (Request.QueryString["FerryID"] != null)
            {
                ferryID = Convert.ToInt32(Request.QueryString["FerryID"]);
                Session["Prop_Action"] = "U";
            }
            if (Session["Prop_Action"] == "U")
            {
                // int proID= int.Parse(Session["Pro_ID"].ToString());
                Ferry ferry = new Ferry();
                ferry.Ferry_ID = ferryID;
                ferry.SelectOne();

                hidFerryID.Value = ferry.Ferry_ID.ToString();
                txtFerryNameEn.Text = ferry.FerryName_EN.ToString();
                txtFerryNameAr.Text = ferry.FerryName_AR.ToString();
                txtCostForAdults.Text = ferry.Cost_For_Adults.ToString();
                txtCostForKids.Text = ferry.Cost_For_Kids.ToString();

            }
        }

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Ferry ferry = new Ferry();
            ferry.FerryName_EN = txtFerryNameEn.Text;
            ferry.FerryName_AR = txtFerryNameAr.Text;
            ferry.Cost_For_Adults = SqlMoney.Parse(txtCostForAdults.Text.Trim());
            ferry.Cost_For_Kids = SqlMoney.Parse(txtCostForKids.Text.Trim());
            ferry.LastModifiedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name); 
            ferry.LastModifiedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
            if (Session["Prop_Action"] == "U")
            {
                ferry.Ferry_ID = int.Parse(hidFerryID.Value);
                if(ferry.Update())
                    DisplayDBResult(DBResult.SUCCESS,"Successfully Updated");
                else
                    DisplayDBResult(DBResult.FAILURE, "Failed to Update");

                Session.Remove("Prop_Action");
            }
            else
            {
                ferry.CreatedUser = ferry.LastModifiedUser;
                ferry.CreatedDate = ferry.LastModifiedDate;
                if (ferry.Insert())
                    DisplayDBResult(DBResult.SUCCESS, "Successfully Inserted");
                else
                    DisplayDBResult(DBResult.FAILURE, "Failed to Insert");
            }
            lblMsg.Text = "Data Saved successfully.";
            lblMsg.ForeColor = Color.Green;
        }
        catch (Exception ex)
        {
            DisplayDBResult(DBResult.EXCEPTION, ex.Message);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Ferry.aspx", true);
    }
    private void DisplayDBResult(String SuccessOrFailure, String message)
    {
        lblMsg.Text = SuccessOrFailure + " " + message;
        lblMsg.ForeColor = Color.Red;
    }
}