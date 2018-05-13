﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;
using System.Data;
public partial class Hotel_RptGuestLedgerView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["collectionRpt"] != null)
        {
            DataTable dt = (DataTable)Session["collectionRpt"];
            ReportDocument report = new ReportDocument();

            report.Load(Server.MapPath("GuestLedgerReport.rpt"));





            string oName = "GuestLedgerReport-" + DateTime.Now.ToString("dd-MM-yyyy");
            report.SetDataSource(dt);
            report.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, oName);
          
         //   CrystalReportViewer1.ReportSource = report;
        }
    }

}