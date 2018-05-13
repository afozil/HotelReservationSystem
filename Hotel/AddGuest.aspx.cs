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

public partial class Hotel_AddGuest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindCountries();
            BindGuestCategories();
        }
    }

    private void BindCountries()
    {
        DataTable table = new Countries().SelectAll();
        drpNationality.DataSource = table;
        drpNationality.DataTextField = table.Columns["CountryName_EN"].ToString();
        drpNationality.DataValueField = table.Columns["ISO_ALPHA3_Code"].ToString();
        drpNationality.DataBind();
    }

    private void BindGuestCategories()
    {
        DataTable table = new GuestCategory().SelectAll();
        drpCategory.DataSource = table;
        drpCategory.DataTextField = table.Columns["CategoryDescription"].ToString();
        drpCategory.DataValueField = table.Columns["GuestCategory_ID"].ToString();
        drpCategory.DataBind();
    } 

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Guests guest = new Guests();
            guest.LastModifiedUser = 1;
            guest.LastModifiedDate = SqlDateTime.Parse(DateTime.Now.ToString());
            //guest.LastBookingDate = SqlDateTime.Parse(DateTime.Now.ToString());
            guest.Email = txtEmail.Text;
            guest.FirstName = txtFirstName.Text;
            guest.MiddleName = txtMiddleName.Text;
            guest.LastName = txtLastName.Text;
            guest.MobileNumber = txtMobileNumber.Text;
            guest.Civil_ID = txtCivilId.Text;
            DateTime date = DateTime.Parse(txtDOB.Text);
            String.Format("0:u", date);
            guest.DateOfBirth = SqlDateTime.Parse(txtDOB.Text);//SqlDateTime.Parse(txtDOB.Text);
            guest.PassportNumber = txtPassportNumber.Text;
            guest.Preferrences = txtPreferrences.Text;
            guest.Nationality = drpNationality.SelectedValue;
            guest.Salutation = SqlInt32.Parse(drpSalutation.SelectedValue);
            guest.IsBlackListed = SqlInt32.Parse(drpIsBlackListed.SelectedValue);
            guest.Category = SqlInt32.Parse(drpCategory.SelectedValue);
            guest.Gender = SqlInt32.Parse(drpGender.SelectedValue);
                guest.CreatedUser = 1;
                guest.CreatedDate = guest.LastModifiedDate;
                bool retval = guest.Insert();
                hidGuestId.Value = guest.Guest_ID.ToString();
            
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