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

public partial class Configuration_AddEditBillsServices : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int AId = 0;
            Session.Remove("Prop_Action");
            if (Request.QueryString["BillsServices_ID"] != null)
            {
                AId = Convert.ToInt32(Request.QueryString["BillsServices_ID"]);
                Session["Prop_Action"] = "U";
            }


            if (Session["Prop_Action"] == "U")
            {
                // int proID= int.Parse(Session["Pro_ID"].ToString());
                BillsServices bills = new BillsServices();
                bills.BillsServices_ID = AId;
                bills.SelectOne();

                hidBillsID.Value = bills.BillsServices_ID.ToString();

                txtBillsServicesName.Text = bills.Name.ToString();
                txtDescription.Text = bills.Description.ToString();
                txtQty.Text = bills.Quantity.ToString();
                txtPrice.Text = bills.Price.ToString();
               
            }
        }
        
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            BillsServices bills = new BillsServices();
            bills.Name = txtBillsServicesName.Text;
            bills.Description = txtDescription.Text;
            bills.Quantity = int.Parse(txtQty.Text);
            bills.Price = SqlMoney.Parse(txtPrice.Text);
            if (bills.Price <= 0)
            {
                lblMsg.Text = "Price cannot be 0 or less.";
                lblMsg.ForeColor = Color.Red;
                return;
            }
            bills.CreatedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name); 

            bool retval = false;
            if (Session["Prop_Action"] == "U")
            {
                bills.BillsServices_ID = Int32.Parse(hidBillsID.Value);
                bills.LastModifiedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
                bills.LastModifiedDate = DateTime.Now;
                retval = bills.Update();
            }
            else
            {
                bills.CreatedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name); ;
                bills.CreatedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
                retval = bills.Insert();
            }
            lblMsg.Text = "Data Saved successfully.";
            lblMsg.ForeColor = Color.Green;

            if (retval)
                Response.Redirect("BillsServices.aspx", true);
            else
                lblMsg.Text = bills.ErrorDesc.ToString();
        }
        catch (Exception ex)
        {

            lblMsg.Text = "Data not Saved .";
            lblMsg.ForeColor = Color.Red;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("BillsServices.aspx", true);
    }
}