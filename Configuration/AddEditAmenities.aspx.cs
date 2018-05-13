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

public partial class Admin_AddEditAmenities : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int AId = 0;
            Session.Remove("Prop_Action");
            if (Request.QueryString["AmenitiesID"] != null)
            {
                AId = Convert.ToInt32(Request.QueryString["AmenitiesID"]);
                Session["Prop_Action"] = "U";
            }


            if (Session["Prop_Action"] == "U")
            {
                // int proID= int.Parse(Session["Pro_ID"].ToString());
                Amenities amenities = new Amenities();
                amenities.AmenitiesID = AId;
                amenities.SelectOne();

                hidAmenitiesID.Value = amenities.AmenitiesID.ToString();
              
                txtAName.Text = amenities.AmenitiesName.ToString();
                txtDescription.Text = amenities.Description.ToString();
                txtQty.Text = amenities.Quantity.ToString();
                txtPrice.Text = amenities.Price.ToString();
               
            }
        }
    }

   protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Amenities amenities = new Amenities();
            amenities.AmenitiesName = txtAName.Text;
            amenities.Description= txtDescription.Text;
             amenities.Quantity =int.Parse( txtQty.Text);
             amenities.Price = SqlMoney.Parse(txtPrice.Text);
             if (amenities.Price <= 0)
             {
                 lblMsg.Text = "Price cannot be 0 or less.";
                 lblMsg.ForeColor = Color.Red;
                 return;
             }
             amenities.CreatedUser =1;
           
            bool retval = false;
            if (Session["Prop_Action"] == "U")
            {
                amenities.AmenitiesID  = Int32.Parse(hidAmenitiesID.Value);
                amenities.LastModifiedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
                amenities.LastModifiedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
                retval = amenities.Update();
            }
            else
            {
                amenities.CreatedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name); ;
                amenities.CreatedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
                retval = amenities.Insert();
            }
            lblMsg.Text = "Data Saved successfully.";
            lblMsg.ForeColor = Color.Green;

            if (retval)
                Response.Redirect("amenities.aspx", true);
            else
                lblMsg.Text = amenities.ErrorDesc.ToString();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Data not Saved .";
            lblMsg.ForeColor = Color.Red;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Amenities.aspx", true);
    }


    }



