<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Rpt.aspx.cs" Inherits="Hotel_Rpt" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div>
      <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server"  
   
       AutoDataBind="true"  
       HasCrystalLogo="False"
     HasDrillUpButton="False" HasGotoPageButton="False" HasPageNavigationButtons="true" HasSearchButton="False"
      EnableDrillDown="false" HasToggleGroupTreeButton="False" ToolbarStyle-BackColor="LightBlue" 
       GroupTreeStyle-CssClass="" HasToggleParameterPanelButton="false" 
      ToolPanelView="None"
        />
    </div>
    </div>
        <CR:CrystalReportViewer ID="CrystalReportViewer2" runat="server" AutoDataBind="true" />
    </form>
</body>
</html>
