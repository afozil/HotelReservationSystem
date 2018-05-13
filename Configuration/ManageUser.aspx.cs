using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using HotelReservationSystem;
using System.Data;
using HotelReservationSystemDAL;

public partial class Configuration_ManageUser : System.Web.UI.Page
{

    protected string SuccessMessage
    {
        get;
        private set;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Determine the sections to render
          //  UserManager manager = new UserManager();
           
            // Render success message
            //var message = Request.QueryString["m"];
            //if (message != null)
            //{
            //    // Strip the query string from action
            //   // Form.Action = ResolveUrl("~/Account/Manage");

            //    SuccessMessage =
            //        message == "ChangePwdSuccess" ? "Your password has been changed."
            //        : message == "SetPwdSuccess" ? "Your password has been set."
            //        : message == "RemoveLoginSuccess" ? "The account was removed."
            //        : String.Empty;
            //    successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
            //}

            var id = Request.QueryString["Employee_ID"];

            if (id != null)
            {

                Employees emp = new Employees();
                emp.Employee_ID =Int32.Parse( id);

                DataTable tb= emp.SelectOne();




                UserManager manager = new UserManager();
               // ApplicationUser user = manager.FindById(id);
                ApplicationUser user = manager.FindByName(emp.UserName.ToString());
                lblUserName.Text = user.UserName;
                AspNetUsers users=new AspNetUsers();
                users.UserName = user.UserName;
                Session["SelectedUser"] = user.UserName;
             DataTable tblUsers=   users.SelectOneByUserName();
                if (tblUsers.Rows.Count>0)
                {
                    foreach(DataRow row in tblUsers.Rows)
                    {
                        chkLockout.Checked =bool.Parse(row["Lockout"].ToString());
                    }
                }
                
                
            }

        }

    }
    protected void SetPassword_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            var id = Request.QueryString["ID"];
            if (id != null)
            {
                // Create the local login info and link the local account to the user
                UserManager manager = new UserManager();
                IdentityResult result1 = manager.RemovePassword(id);
                IdentityResult result = manager.AddPassword(id, password.Text);
                if (result.Succeeded)
                {

                    lblMessage.Text = "Passward Changed Successfully";
                }
                else
                {
                    foreach (var error in result.Errors)
                    {
                        lblMessage.Text +=""+ error;
                    }
                    //lblMessage.Text = result.Errors.ToString();
                }
            }
        }
    }




  
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Session["CreatedUserName"] = lblUserName.Text;
        Session["Option"] = "U";
        Response.Redirect("../admin/CreateUser.aspx");
    }
    protected void chkLockout_CheckedChanged(object sender, EventArgs e)
    {
        string username = Session["SelectedUser"].ToString();
        AspNetUsers users = new AspNetUsers();
        bool locked = chkLockout.Checked;
       bool retVal= users.UpdateLockOut(username,locked.ToString());
    }
}