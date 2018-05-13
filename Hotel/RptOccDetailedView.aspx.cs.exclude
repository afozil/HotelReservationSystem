using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;
using System.Data;
public partial class Hotel_RptOccDetailedView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["collectionRpt"] != null)
        {
            DataSet ds = (DataSet)Session["collectionRpt"];
            ReportDocument report = new ReportDocument();

            report.Load(Server.MapPath("OccDetailReport.rpt"));





            string oName = "OccupancyDetailReport-" + DateTime.Now.ToString("dd-MM-yyyy");
            report.SetDataSource(ds);
            report.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, oName);
         //   CrystalReportViewer1.ReportSource = report;
        }
    }
}