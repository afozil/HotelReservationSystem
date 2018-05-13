using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystem;
using HotelReservationSystemDAL;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
public partial class Admin_AddRole : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        lblMsg.Text = "";
        if (string.IsNullOrEmpty(txtRoleName.Text))
        {
            lblError.Text = "RoleName Mandatory."; return;
        }
        ApplicationDbContext context = new ApplicationDbContext();
        IdentityResult IdRoleResult;
        IdentityResult IdUserResult;

        // Create a RoleStore object by using the ApplicationDbContext object. 
        // The RoleStore is only allowed to contain IdentityRole objects.
        var roleStore = new RoleStore<IdentityRole>(context);

        // Create a RoleManager object that is only allowed to contain IdentityRole objects.
        // When creating the RoleManager object, you pass in (as a parameter) a new RoleStore object. 
        var roleMgr = new RoleManager<IdentityRole>(roleStore);
        
        // Then, you create the "canEdit" role if it doesn't already exist.
        if (!roleMgr.RoleExists(txtRoleName.Text))
        {
            IdRoleResult = roleMgr.Create(new IdentityRole { Name = txtRoleName.Text });
            if (IdRoleResult.Succeeded) { lblMsg.Text = "Role Created Successfully"; }
            else
            {
                lblError.Text = "Role creation faild " + IdRoleResult.Errors.ToString();
            }
        }

    }
}