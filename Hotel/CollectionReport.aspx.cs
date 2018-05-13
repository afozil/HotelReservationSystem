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
public partial class Hotel_CollectionReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.IsInRole("administrator") )
        {

        }
        else
        { Response.Redirect("~/Default.aspx"); }
        if (!Page.IsPostBack)
        {
            divusername.Visible = Context.User.IsInRole("administrator");
            BindEmployees();


        }
    }

    private void BindEmployees()
    {
        DataTable table = new Employees().SelectAll();//.SelectByRoleName("SALES");

        //DataView dv = table.DefaultView;
        //dv.RowFilter = "";
        //drpUserName.DataSource = table;
        //drpUserName.DataTextField = table.Columns["FirstName"].ToString() + " "+table.Columns["LastName"].ToString();
        //drpUserName.DataValueField = table.Columns["Employee_ID"].ToString();
        //drpUserName.DataBind();

        ListItem item;
        foreach(DataRow row in table.Rows)
        {

            item = new ListItem(row["FirstName"].ToString() + " " + row["LastName"].ToString(), row["Employee_ID"].ToString());
            drpUserName.Items.Add(item);
        }
        drpUserName.Items.Insert(0, new ListItem("All", "-1"));
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblMsg.Text = string.Empty;
        DateTime fromDate = DateTime.Parse(txtFromDate.Text);
        DateTime toDate = DateTime.Parse(txtToDate.Text);

        if (txtFromDate.Text.Trim() == "" || txtToDate.Text.Trim() == "")
        {
            lblMsg.Text = "From & To dates cannot be empty";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        //if (fromDate < DateTime.Now.Date)
        //{
        //    lblMsg.Text = "Booking date cannot be before today";
        //    lblMsg.ForeColor = Color.Red;
        //    return;
        //}
        if (fromDate > toDate)
        {
            lblMsg.Text = "Check-In date seems to be after Check-Out date";
            lblMsg.ForeColor = Color.Red;
            return;
        }



        Reservations reserv = new Reservations();
        string username = HttpContext.Current.User.Identity.Name;
        string EmpID = "0";
        Employees emp = new Employees();
        emp.UserName = username;
        emp.SelectOneByUserName();
        EmpID = emp.Employee_ID.ToString();
        if (Context.User.IsInRole("administrator"))
        {
            EmpID = drpUserName.SelectedItem.Value;
        }
        // EmpID = "1";
       // username = "All";
        DataTable table = reserv.SelectCollectionReport(EmpID, fromDate.ToString(), toDate.ToString(), username);
        if (table.Rows.Count == 0)
        {
            lblMsg.Text = "No records found";
            lblMsg.ForeColor = Color.Red;
            return;
        }
        Session["collectionRpt"] = table;
        string popupScript = "<script language='javascript'>" +
                          "window.open('AllCollectionReportView.aspx','ThisPopUp1', " +
                          "'left = 300, top=150,  " +
                          "menubar=no, scrollbars=yes, resizable=yes')" +
                          "</script>";
        Page.ClientScript.RegisterStartupScript(GetType(), "PopupScript", popupScript);

    }
}