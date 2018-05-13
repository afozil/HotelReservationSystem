using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Configuration_EOD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GetNextRunningDate();
        }
    }

    private void GetNextRunningDate()
    {

    }
    protected void btnRunEOD_Click(object sender, EventArgs e)
    {

    }
}