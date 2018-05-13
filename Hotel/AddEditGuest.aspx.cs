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


public partial class Hotel_AddEditGuest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindCountries();
            int guestId = 0;
            Session.Remove("Prop_Action");
            if (Request.QueryString["Guest_ID"] != null)
            {
                guestId = Convert.ToInt32(Request.QueryString["Guest_ID"]);
                Session["Prop_Action"] = "U";
            }
            if (Session["Prop_Action"] == "U")
                BindGuest(guestId);
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

    private void BindGuest(int guestId)
    {
           Guests guest = new Guests();
           guest.Guest_ID = guestId;
           hidGuestId.Value = guest.Guest_ID.ToString();
           guest.SelectOne();

                    foreach (ListItem liN in drpNationality.Items)
                    {
                        if (liN.Value.Equals(guest.Nationality.ToString())) { 
                            liN.Selected = true;
                            break;
                        }
                    }
                    foreach (ListItem liC in drpCategory.Items)
                    {
                        if (liC.Value.Equals(guest.Category.ToString())) { 
                            liC.Selected = true;
                            break;
                        }
                    }
                    foreach(ListItem liG in drpGender.Items){
                        if (liG.Value.Equals(guest.Gender.ToString())) {
                            liG.Selected = true;
                            break;
                        }
                    }
                    foreach (ListItem liB in drpIsBlackListed.Items)
                    {
                        if (liB.Value.Equals(guest.IsBlackListed.ToString())) {
                            liB.Selected = true;
                            break;
                        }
                    }
                    foreach (ListItem liS in drpSalutation.Items)
                    {
                        if (liS.Value.Equals(guest.Salutation.ToString())) {
                            liS.Selected = true;
                                break;
                        }
                    }
                    txtCivilId.Text = guest.Civil_ID.ToString();
                    txtDOB.Text = guest.DateOfBirth.ToString();
                    txtEmail.Text = guest.Email.ToString();
                    txtFirstName.Text = guest.FirstName.ToString();
                    txtLastName.Text = guest.LastName.ToString();
                    txtMiddleName.Text = guest.MiddleName.ToString();
                    txtMobileNumber.Text = guest.MobileNumber.ToString();
                    txtPassportNumber.Text = guest.PassportNumber.ToString();
                    txtPreferrences.Text = guest.Preferrences.ToString();
                
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try { 
        Guests guest = new Guests();
        guest.LastModifiedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name); 
        guest.LastModifiedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
        //guest.LastBookingDate = SqlDateTime.Parse(DateTime.Now.ToString());
        guest.Email = txtEmail.Text;
        guest.FirstName = txtFirstName.Text;
        guest.MiddleName = txtMiddleName.Text;
        guest.LastName = txtLastName.Text;
        guest.MobileNumber = txtMobileNumber.Text;
        guest.Civil_ID = txtCivilId.Text;
        DateTime date = DateTime.Parse(txtDOB.Text);
        String.Format("0:u", date);
        guest.DateOfBirth = Utility.GetSqlDateTimeFromDateTime(DateTime.Parse(txtDOB.Text));//SqlDateTime.Parse(txtDOB.Text);
        guest.PassportNumber = txtPassportNumber.Text;
        guest.Preferrences = txtPreferrences.Text;
        guest.Nationality = drpNationality.SelectedValue;
        guest.Salutation = SqlInt32.Parse(drpSalutation.SelectedValue);
        guest.IsBlackListed = SqlInt32.Parse(drpIsBlackListed.SelectedValue);
        guest.Category = SqlInt32.Parse(drpCategory.SelectedValue);
        guest.Gender = SqlInt32.Parse(drpGender.SelectedValue);

        if (Session["Prop_Action"] == "U")
            {
                guest.Guest_ID = Int32.Parse(hidGuestId.Value);
                bool retval = guest.Update();
            }
            else
            {
                guest.CreatedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
                guest.CreatedDate = guest.LastModifiedDate;
                bool retval = guest.Insert();
                hidGuestId.Value = guest.Guest_ID.ToString();
            }
            lblMsg.Text = "Data Saved successfully.";
            lblMsg.ForeColor = Color.Green;
            
            //Response.Redirect("GuestsList.aspx", true);
    } catch (Exception ex)
        {

            lblMsg.Text = "Data not Saved .";
            lblMsg.ForeColor = Color.Red;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("GuestsList.aspx", true);
    }
}