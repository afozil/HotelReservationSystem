using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelReservationSystem;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System.Data.SqlTypes;
using System.Data;
using HotelReservationSystemDAL;
public partial class Admin_UsersToRole : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            GetUsers();

        }
    }
    public void GetUsers()
    {
        AspNetUsers user = new AspNetUsers();

        DataTable table = user.SelectAll();
        if (table.Rows.Count > 0)
        {
            ListItem item = null;
            item = new ListItem("Select a user...","-1");
            CboUser.Items.Add(item);
            foreach (DataRow row in table.Rows)
            {
                item = new ListItem(row["UserName"].ToString(), row["ID"].ToString());
                CboUser.Items.Add(item);
            }
        }
       
    }

    protected void CboUser_SelectedIndexChanged(object sender, EventArgs e)
    {
        AspNetUsers user = new AspNetUsers();


        DataTable table = user.SelectRolesByUserID(CboUser.SelectedItem.Value);
        if (table.Rows.Count > 0)
        {
            grid.DataSource = table;
            grid.DataBind();

        }
    }
    protected void chkRow_CheckedChanged(object sender, EventArgs e)
    {
        ApplicationDbContext context = new ApplicationDbContext();
        IdentityResult IdRoleResult;
        IdentityResult IdUserResult;


        GridViewRow row = (GridViewRow)(((CheckBox)sender).NamingContainer);
        string roleid = (string)this.grid.DataKeys[0]["ID"];

        string userid = CboUser.SelectedItem.Value;// row.Cells[0].Text;
       // string roleid = row.Cells[3].Text;
        CheckBox chkRow = (row.Cells[2].FindControl("chkRow") as CheckBox);
      //  User_Roles ur = new User_Roles();
       // ur.UserID = int.Parse(userid);
       // ur.RoleID = int.Parse(roleid);
        string roleName = row.Cells[2].Text;
        var roleStore = new RoleStore<IdentityRole>(context);

        // Create a RoleManager object that is only allowed to contain IdentityRole objects.
        // When creating the RoleManager object, you pass in (as a parameter) a new RoleStore object. 
        var roleMgr = new RoleManager<IdentityRole>(roleStore);
        var userMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
        if (chkRow.Checked)
        {
            IdUserResult = userMgr.AddToRole(userid, roleName);
            // Then, you create the "canEdit" role if it doesn't already exist.
            //if (!roleMgr.RoleExists(roleName))
            //{
            //    IdRoleResult = roleMgr.Create(new IdentityRole { Name = roleName });
            //    if (IdRoleResult.Succeeded) 
            //    { //lblMsg.Text = "Role Created Successfully"; 
            //    }
            //    else
            //    {
            //      //  lblError.Text = "Role creation faild " + IdRoleResult.Errors.ToString();
            //    }
            //}
            ////ur.Insert();
        }
        else
        {
            IdUserResult = userMgr.RemoveFromRole(userid, roleName);
            // Then, you create the "canEdit" role if it doesn't already exist.
           
            
            //// Then, you create the "canEdit" role if it doesn't already exist.
            //if (roleMgr.RoleExists(roleName))
            //{
            //    IdRoleResult = roleMgr.Delete(roleName);
            //    if (IdRoleResult.Succeeded)
            //    { //lblMsg.Text = "Role Created Successfully"; 
            //    }
            //    else
            //    {
            //        //  lblError.Text = "Role creation faild " + IdRoleResult.Errors.ToString();
            //    }
            //}
           // ur.Delete();
        }

        /*foreach (GridViewRow row in grid.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);
                if (chkRow.Checked)
                {
                    string userid = row.Cells[1].Text;
                    string roleid = row.Cells[3].Text;
                  
                }
            }
        }
         */

    }
    protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string ss = e.Row.Cells[1].Text;
        }
    }
}