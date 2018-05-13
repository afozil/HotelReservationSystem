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
public partial class Admin_AddEditEmployeeDiscount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GetUsers();

            int discountID = 0;
            Session.Remove("Prop_Action");
            if (Request.QueryString["DiscountID"] != null)
            {
                discountID = Convert.ToInt32(Request.QueryString["DiscountID"]);
                txtdiscountID.Value = discountID.ToString();
                Session["Prop_Action"] = "U";
            }

            if (Session["Prop_Action"] == "U")
            {
                // int proID= int.Parse(Session["Pro_ID"].ToString());
                EmployeeDiscounts disc = new EmployeeDiscounts();
                disc.DiscountID = discountID;
                disc.SelectOne();

                Employees employee = new Employees();
                employee.Employee_ID = disc.EmployeeID;
                employee.SelectOne();

                AspNetUsers user = new AspNetUsers();
                user.UserName= employee.UserName.ToString();
                user.SelectOneByUserName();

                CboUser.SelectedValue = user.Id.ToString();
                CboUnit.SelectedValue = disc.UnitOfDiscount.ToString();
                cboStatus.SelectedValue =disc.DiscountStatus.ToString();
                txtDiscount.Text = disc.Discount.ToString();
            }
        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        if (string.IsNullOrEmpty(txtDiscount.Text))
        {
            lblMsg.Text = "Invalid Discount .";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        Employees _employee = new Employees();
        try
        {
           
            _employee.UserName = CboUser.SelectedItem.Text;
            _employee.SelectOneByUserName();
            if (_employee.ErrorCode != 0){
                lblMsg.Text = _employee.ErrorDesc.ToString();
                lblMsg.ForeColor = Color.Red;
                return;
            }

        }
        catch(Exception ee){}

        try
        {
           
                EmployeeDiscounts em = new EmployeeDiscounts();
                em.Discount = SqlMoney.Parse(txtDiscount.Text);
                em.EmployeeID = _employee.Employee_ID;
              
                if (Session["Prop_Action"] != "U")
                {
                    em.DiscountStatus = 1;
                    em.UnitOfDiscount =Int32.Parse(CboUnit.SelectedValue);
                    em.CreatedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name); 
                    bool retval = em.Insert();
                    if (em.ErrorCode == 0)
                    {

                        lblMsg.Text = "Data Updated successfully.";
                        lblMsg.ForeColor = Color.Green;
                    }
                    else
                    {
                        lblMsg.Text = em.ErrorDesc.ToString();
                        lblMsg.ForeColor = Color.Red;

                    }
                    // Response.Redirect("RoomTypes.aspx", true);
                }
            else
                {
                    em.DiscountID = int.Parse(txtdiscountID.Value);
                    em.DiscountStatus =int.Parse( cboStatus.SelectedItem.Value);
                    em.UnitOfDiscount = Int32.Parse(CboUnit.SelectedValue);
                    em.LastModifiedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name); 
                    em.LastModifiedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
                    em.Update();
                    if (em.ErrorCode == 0)
                    {
                        lblMsg.Text = "Data Saved successfully.";
                        lblMsg.ForeColor = Color.Green;
                    }
                    else
                    {
                        lblMsg.Text = em.ErrorDesc.ToString();
                        lblMsg.ForeColor = Color.Red;

                    }
                }
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Data not Saved .";
            lblMsg.ForeColor = Color.Red;
        }
    
    }
    public void GetUsers()
    {
        AspNetUsers user = new AspNetUsers();
        DataTable table = user.SelectAll();
        CboUser.DataSource = table;
        CboUser.DataTextField = "UserName";
        CboUser.DataValueField = "ID";
        CboUser.DataBind();

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployeeDiscounts.aspx", true);
    }
}