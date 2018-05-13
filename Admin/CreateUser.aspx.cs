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
public partial class Admin_CreateUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (string.IsNullOrEmpty(Session["CreatedUserName"].ToString()))
            {
                Response.Redirect("Register.aspx");
            }
            if(Session["Option"] =="U")
            {
                string username = Session["CreatedUserName"].ToString();
                Employees emp = new Employees();
                emp.UserName = username;
                emp.SelectOneByUserName();
                lblUserName.Text = username;
                txtFirstName.Text = emp.FirstName.ToString();
                txtMiddleName.Text = emp.MiddleName.ToString();
                txtLastName.Text = emp.LastName.ToString();

                //get Users details
            }
            
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Employees employee = new Employees();
            employee.UserName = Session["CreatedUserName"].ToString();
            employee.SelectOneByUserName();
            employee.FirstName = txtFirstName.Text;
            employee.MiddleName = txtMiddleName.Text;
            employee.LastName = txtLastName.Text;

            Employees Currentemployee = new Employees();
            Currentemployee.SelectOneByUserName(System.Web.HttpContext.Current.User.Identity.Name);
            employee.Supervisor_ID = Currentemployee.Employee_ID;
            employee.LastModifiedUser = Currentemployee.Employee_ID;
            employee.LastModifiedDate = DateTime.Now;


            employee.Update();
            Response.Redirect("../configuration/usersList.aspx");
        }
        catch (Exception ex) { }
    }
}