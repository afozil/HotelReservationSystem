using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using HotelReservationSystem;
using HotelReservationSystemDAL;

public partial class Account_Register : Page
{
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        var manager = new UserManager();
        var user = new ApplicationUser() { UserName = UserName.Text };
        IdentityResult result = manager.Create(user, Password.Text);
        if (result.Succeeded)
        {
            Employees employee = new Employees();
            employee.UserName = UserName.Text;
            employee.FirstName = UserName.Text;
            employee.CreatedUser = 1;
            if(employee.Insert())
                ErrorMessage.Text = "User Registered successfully";
            /*IdentityHelper.SignIn(manager, user, isPersistent: false);
            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
             */
        }
        else
        {
            ErrorMessage.Text = result.Errors.FirstOrDefault();
        }
    }
}