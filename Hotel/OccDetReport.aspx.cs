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
public partial class Hotel_OccDetReport : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.User.IsInRole("administrator") || Context.User.IsInRole("frontoffice") || Context.User.IsInRole("housekeeping"))
        {

        }
        else
        { Response.Redirect("~/Default.aspx"); }
        if (!Page.IsPostBack)
        {
            // txtFromDate.Text = DateTime.Now.ToString("MM/dd/yyyy");
            // divusername.Visible = Context.User.IsInRole("administrator");
            // BindEmployees();


        }
    }

    private void BindEmployees()
    {
        //DataTable table = new Employees().SelectByRoleName("SALES");

        //DataView dv = table.DefaultView;
        //dv.RowFilter = "";
        //drpUserName.DataSource = table;
        //drpUserName.DataTextField = table.Columns["FullName"].ToString();
        //drpUserName.DataValueField = table.Columns["Employee_ID"].ToString();
        // drpUserName.DataBind();
        // drpUserName.Items.Insert(0, new ListItem("All", "-1"));
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblMsg.Text = string.Empty;
        // DateTime fromDate = DateTime.Parse(txtFromDate.Text);
        // DateTime toDate = DateTime.Parse(txtToDate.Text);

        //if (txtFromDate.Text.Trim() == "")
        //{
        //    lblMsg.Text = "From & To dates cannot be empty";
        //    lblMsg.ForeColor = Color.Red;
        //    return;
        //}
        //if (fromDate < DateTime.Now.Date)
        //{
        //    lblMsg.Text = "Booking date cannot be before today";
        //    lblMsg.ForeColor = Color.Red;
        //    return;
        //}
        //if (fromDate > toDate)
        //{
        //    lblMsg.Text = "Check-In date seems to be after Check-Out date";
        //    lblMsg.ForeColor = Color.Red;
        //    return;
        //}



        Reservations reserv = new Reservations();
        string username = HttpContext.Current.User.Identity.Name;
        string EmpID = "0";
        Employees emp = new Employees();
        emp.UserName = username;
        emp.SelectOneByUserName();
        EmpID = emp.Employee_ID.ToString();
        DataSet DS = new DataSet();
        //if (Context.User.IsInRole("administrator"))
        //{
        //    EmpID = drpUserName.SelectedItem.Value;
        //}
        //EmpID = "1";
        DataTable table = reserv.SelectOcuupancyReport(EmpID,DateTime.Now.ToString("MM/dd/yyyy"));
        if (table.Rows.Count == 0)
        {
            lblMsg.Text = "No records Found.";
            lblMsg.ForeColor = Color.Red;
            return;
        }

        DataTable table1 = reserv.SelectOcuupancySGReport();


        DS.Tables.Add(table);
        DS.Tables.Add(table1);
        Session["collectionRpt"] = DS;
        string popupScript = "<script language='javascript'>" +
                          "window.open('RptOccDetailedView.aspx','ThisPopUp1', " +
                          "'left = 300, top=150,  " +
                          "menubar=no, scrollbars=yes, resizable=yes')" +
                          "</script>";
        Page.ClientScript.RegisterStartupScript(GetType(), "PopupScript", popupScript);

    }
}