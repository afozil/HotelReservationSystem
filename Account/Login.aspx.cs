using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using HotelReservationSystem;

public partial class Account_Login : Page
{
        protected void Page_Load(object sender, EventArgs e)
        {
           /* RegisterHyperLink.NavigateUrl = "Register";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
            */
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Validate the user password
                var manager = new UserManager();
                ApplicationUser user = manager.Find(UserName.Text, Password.Text);
                if (user != null)
                {
                    IdentityHelper.SignIn(manager, user, RememberMe.Checked);
                string ReturnUrl = string.Empty;
                if (Request.QueryString["ReturnUrl"] == null || Request.QueryString["ReturnUrl"] == "")
                    ReturnUrl = "~/default.aspx";
                else
                    ReturnUrl = Request.QueryString["ReturnUrl"];
                    IdentityHelper.RedirectToReturnUrl(ReturnUrl, Response);
                }
                else
                {
                    FailureText.Text = "Invalid username or password.";
                    ErrorMessage.Visible = true;
                }
            }
        }
}