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

public partial class Hotel_AddEditProperties : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int proID = 0;
            if (Request.QueryString["PropertyID"] != null)
            {
                proID = Convert.ToInt32(Request.QueryString["PropertyID"]);
                Session["Prop_Action"] = "U";
            }


            if (Session["Prop_Action"] == "U")
            {
               // int proID= int.Parse(Session["Pro_ID"].ToString());
                Properties property = new Properties();
                property.PropertyID = proID;
                property.SelectOne();

                txtPropertyID.Value = property.PropertyID.ToString();
                txtProNameEn.Text = property.PropertyName_EN;
                //txtProNameAr.Text = property.PropertyName_AR;
                txtDesc.Text = property.Description;

            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Properties property = new Properties();
            property.PropertyName_EN = txtProNameEn.Text;
            property.PropertyName_AR = txtProNameEn.Text /*txtProNameAr.Text*/ ;
            property.Description = txtDesc.Text;

            property.LastModifiedUser = 1;
            property.LastModifiedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
            if (Session["Prop_Action"] == "U")
            {
                property.PropertyID = int.Parse(txtPropertyID.Value);
                bool retval = property.Update();
            }
            else
            {
                property.CreatedUser = 1;
                property.CreatedDate = property.LastModifiedDate;
                bool retval = property.Insert();
            }
            lblMsg.Text = "Data Saved successfully.";
            lblMsg.ForeColor = Color.Green;

            Response.Redirect("Properties.aspx", true);
        }
        catch (Exception ex) 
        {

            lblMsg.Text = "Data not Saved .";
            lblMsg.ForeColor = Color.Red;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Properties.aspx", true);
    }
}