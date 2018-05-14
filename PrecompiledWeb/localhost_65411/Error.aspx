<%@ page language="C#" autoeventwireup="true" masterpagefile="~/OnlineInside.master" inherits="Error, App_Web_4qpqkpye" %>
<%--<font color="red" size="6"></font>
        <table width="100%" border="0" cellpadding="1" cellspacing="1" class="text">
            <tr>
                <td align="center" class="heading">
                    <strong>Knet Merchant Demo Shopping Center</strong>
                </td>
            </tr>
            <tr>
                <td class="error" valign="center">
                    <%
                        // Use paymentid to fetch data from DB and display the appropriate information,
                        // if result="CAPTURED" caused by double post, redirect to receipt page, otherwise,
                        // display error text
                          

                        string paymentID = Request["paymentID"];
                        string result = Request["result"];

                        // Assuming transaction data is in Recordset Object named as rs
                        if (result == "CAPTURED")
                            //Response.Redirect(Response.encodeRedirectURL("http://localhost:65411/paymentconfirmed.aspx?PaymentID=" & rs.PaymentID & "&Result=" & rs.result & "&PostDate=" & rs.postdate & "&TranID=" & rs.tranid & "&Auth=" & rs.auth))
                            Response.Redirect("https://www.failakaonline.com/app/paymentconfirmed.aspx?PaymentID=" + Request["PaymentID"] + "&Result=" + Request[result] + "&PostDate=" + Request["postdate"] + "&TranID=" + Request["tranid"] + "&Auth=" + Request["auth"]);
                        else {
                    %>
                    <center>
                        <font color="red" size="6">
                        An error was encountered while processing your order! Transaction could not be completed
                        </font>
                    </center>
                    <% 
                        }  
                    %>
                </td>
            </tr>
 </table>--%>

<asp:Content ID="ErrorContent" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="position: relative; float: left; width: 942px; margin-left: 20px;">
                <div style="position: relative; float: left;">
                    <div class="exfont" style="position: relative; height: 100%; margin: 10px 0px; float: left; border: 0px solid red;">
                        <div class="exfont" id="submenu1" style="position: relative; height: 100%; font-size: 10pt; float: left; border: 0px solid red;">
                            <a title="" href="default.asp">Home</a>
                        </div>
                        <div class="exfont" style="position: relative; height: 100%; margin: 3px 7px; float: left; border: 0px solid red;">
                            <img style="width: 10px; height: 10px;" alt="" src="https://www.failakaonline.com/app/Site2_references/arrow.png">
                        </div>
                        <div class="exfont" id="submenu77" style="position: relative; height: 100%; font-size: 10pt; float: left; border: 0px solid red;">
                            <a title="" href="booking.aspx">Search</a>
                        </div>
                        <div class="exfont" style="position: relative; height: 100%; margin: 3px 7px; float: left; border: 0px solid red;">
                            <img style="width: 10px; height: 10px;" alt="" src="https://www.failakaonline.com/app/Site2_references/arrow.png">
                        </div>
                        <div class="exfont" id="menu85" style="position: relative; font-size: 10pt; float: left; border: 0px solid red;">
                            <a title="KNET Reservation Error" href="error.aspx">KNET Reservation Error</a>
                        </div>
                    </div>
                </div>
                <div style="position: relative; float: left;">
                </div>
            </div>
    <div class="maintextInside exfont" id="ContentPanelInsidePage">
                <table width="100%" class="maintext" border="0" cellspacing="0" cellpadding="0" summary="">
                    <tbody>
                        <tr>
                            <td valign="top">
                                <span style="font-size: 10pt;"></span>
                                <span style="font-weight: bold; font-size: 12pt;"></span>
                                <span style="font-size: 18pt;">
                                    <br>
                                    <table align="left" style="border-collapse: collapse; width: 100%; border: medium none; background-color: rgb(6, 58, 86);">
                                        <tbody>
                                            <tr>
                                                <td style="border: medium none;">
                                                    <span style="font-size: 18pt; color: rgb(255, 255, 255);"></span>
                                                    <span style="font-size: 12pt;">
                                                        <span style="font-size: 18pt;">
                                                            <span style="font-size: 18pt; color: rgb(255, 255, 255);">&nbsp;&nbsp;KNET Reservation Error</span>
                                                        </span>
                                                    </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br>
                                </span>
                                <br>
                                <table width="941px" align="center">
                                    <tbody>
                                        <tr>
                                            <td style="border: medium none;">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="panel panel-info">
                                                                    <div class="panel-heading">
                                                                        <%--<button type="button" class="btn btn-default" aria-label="Print" id="print" onclick="window.print()">
                                                                              <span class="glyphicon glyphicon-print" aria-hidden="true"></span>
                                                                        </button>--%>
                                                                    </div>
                                                                    <div class="panel-body">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <div class="alert alert-danger" role="alert">
                                                                                        <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <!-- Payment Info -->
                                                                                <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <span style="font-size: 10pt;"></span>
                                                                                        <span style="font-weight: bold; font-size: 12pt;"></span>
                                                                                        <span style="font-size: 18pt;">
                                                                                            <br>
                                                                                            <table align="left" style="border-collapse: collapse; width: 100%; border: medium none; background-color: rgb(6, 58, 86);">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td style="border: medium none;">
                                                                                                            <span style="font-size: 18pt; color: rgb(255, 255, 255);"></span>
                                                                                                            <span style="font-size: 12pt;">
                                                                                                                <span style="font-size: 18pt;">
                                                                                                                    <span style="font-size: 18pt; color: rgb(255, 255, 255);">&nbsp;&nbsp;KNET Payment Error Info</span>
                                                                                                                </span>
                                                                                                            </span>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                            <br>
                                                                                        </span>
                                                                                        <br>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-4">
                                                                                        <label for="lblRoomCharges">Room Charges</label><br />
                                                                                            <span>KD</span>
                                                                                            <u><asp:Label ID="lblRoomCharges" Class="text-uppercase" runat="server">
                                                                                            </asp:Label></u>
                                                                                    </div>
                                                                                    <div class="col-md-4">&nbsp;
                                                                                        <%--<label for="lblFerryCharges">Ferry Charges</label><br />
                                                                                            <span>KD</span>
                                                                                            <u><asp:Label ID="lblFerryCharges" runat="server" Class="text-uppercase"></asp:Label></u>--%>
                                                                                    </div>
                                                                                    <div class="col-md-4">
                                                                                        <label for="lblTotalCharges">Total Charges</label><br />
                                                                                            <span>KD</span>
                                                                                            <u><asp:Label ID="lblTotalCharges" Class="text-uppercase" runat="server">
                                                                                            </asp:Label></u>
                                                                                        
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">&nbsp;</div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-4">
                                                                                        <label for="lblPaymentType">Payment Type</label><br />
                                                                                        <u><asp:Label ID="lblPaymentType" Class="text-uppercase" runat="server" Text="K-NET"></asp:Label></u>
                                                                                    </div>
                                                                                    <div class="col-md-4">
                                                                                        <label for="lblKnetPaymentId">K-NET Payment ID</label><br />
                                                                                        <u><asp:Label ID="lblKnetPaymentId" Class="text-uppercase" runat="server" Text="K-NET"></asp:Label></u>
                                                                                    </div>
                                                                                    <div class="col-md-4">
                                                                                        <label for="lblKnetReference">Payment Reference</label><br />
                                                                                        <u><asp:Label ID="lblKnetReference" Class="text-uppercase" runat="server" Text="K-NET"></asp:Label></u>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">&nbsp;</div>
                                                                                </div>
                                                                               <!-- Guest Info -->
                                                                                <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <span style="font-size: 10pt;"></span>
                                                                                        <span style="font-weight: bold; font-size: 12pt;"></span>
                                                                                        <span style="font-size: 18pt;">
                                                                                            <br>
                                                                                            <table align="left" style="border-collapse: collapse; width: 100%; border: medium none; background-color: rgb(6, 58, 86);">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td style="border: medium none;">
                                                                                                            <span style="font-size: 18pt; color: rgb(255, 255, 255);"></span>
                                                                                                            <span style="font-size: 12pt;">
                                                                                                                <span style="font-size: 18pt;">
                                                                                                                    <span style="font-size: 18pt; color: rgb(255, 255, 255);">&nbsp;&nbsp; Guest Info</span>
                                                                                                                </span>
                                                                                                            </span>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                            <br>
                                                                                        </span>
                                                                                        <br>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-4">
                                                                                        <label for="lblGuestFirstName">First Name</label><br />
                                                                                        <u><asp:Label ID="lblGuestFirstName" Class="text-capitalize" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                    <div class="col-md-4">
                                                                                        <label for="lblGuestMiddleName">Middle Name</label><br />
                                                                                        <u><asp:Label ID="lblGuestMiddleName" Class="text-capitalize" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                    <div class="col-md-4">
                                                                                        <label for="lblGuestLastName">Last Name</label><br />
                                                                                        <u><asp:Label ID="lblGuestLastName" Class="text-capitalize" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">&nbsp;</div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-4">
                                                                                        <label for="lblGuestEmail">Email</label><br />
                                                                                        <u><asp:Label ID="lblGuestEmail" Class="text-uppercase" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                    <div class="col-md-4">
                                                                                        <label for="lblGuestMobile">Mobile</label><br />
                                                                                        <u><asp:Label ID="lblGuestMobile" Class="text-uppercase" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                    <div class="col-md-4">
                                                                                        <label for="lblGuestCvd">Civil ID</label><br />
                                                                                        <u><asp:Label ID="lblGuestCvd" Class="text-uppercase" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                </div>
                                                                                <!-- Reservation Info -->
                                                                                <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <span style="font-size: 10pt;"></span>
                                                                                        <span style="font-weight: bold; font-size: 12pt;"></span>
                                                                                        <span style="font-size: 18pt;">
                                                                                            <br>
                                                                                            <table align="left" style="border-collapse: collapse; width: 100%; border: medium none; background-color: rgb(6, 58, 86);">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td style="border: medium none;">
                                                                                                            <span style="font-size: 18pt; color: rgb(255, 255, 255);"></span>
                                                                                                            <span style="font-size: 12pt;">
                                                                                                                <span style="font-size: 18pt;">
                                                                                                                    <span style="font-size: 18pt; color: rgb(255, 255, 255);">&nbsp;&nbsp; Reservation Info</span>
                                                                                                                </span>
                                                                                                            </span>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                            <br>
                                                                                        </span>
                                                                                        <br>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblFromDate">Arrival Date</label><br />
                                                                                        <u><asp:Label ID="lblFromDate" Class="text-uppercase" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblToDate">Departure Date</label><br />
                                                                                        <u><asp:Label ID="lblToDate" Class="text-uppercase" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">&nbsp;</div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblRoomType">Room Type</label><br />
                                                                                        <u><asp:Label ID="lblRoomType" Class="text-uppercase" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblDays">No. Of Days</label><br />
                                                                                        <u><asp:Label ID="lblDays" Class="text-uppercase" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                </div>
                                                                                <!-- Ticket Info -->
                                                                                <%--<div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <span style="font-size: 10pt;"></span>
                                                                                        <span style="font-weight: bold; font-size: 12pt;"></span>
                                                                                        <span style="font-size: 18pt;">
                                                                                            <br>
                                                                                            <table align="left" style="border-collapse: collapse; width: 100%; border: medium none; background-color: rgb(6, 58, 86);">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td style="border: medium none;">
                                                                                                            <span style="font-size: 18pt; color: rgb(255, 255, 255);"></span>
                                                                                                            <span style="font-size: 12pt;">
                                                                                                                <span style="font-size: 18pt;">
                                                                                                                    <span style="font-size: 18pt; color: rgb(255, 255, 255);">&nbsp;&nbsp; Ticket Info</span>
                                                                                                                </span>
                                                                                                            </span>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                            <br>
                                                                                        </span>
                                                                                        <br>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblFerryAdults">Tickets for Adults</label><br />
                                                                                        <u><asp:Label ID="lblFerryAdults" Class="text-uppercase" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblFerryAdultsValidity">Valid On</label><br />
                                                                                        <u><asp:Label ID="lblFerryAdultsValidity" Class="text-uppercase" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">&nbsp;</div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblFerryKids">Tickets for Kids</label><br />
                                                                                        <u><asp:Label ID="lblFerryKids" Class="text-uppercase" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblFerryKidsValidity">Valid On</label><br />
                                                                                        <u><asp:Label ID="lblFerryKidsValidity" Class="text-uppercase" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">&nbsp;</div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblDepartureTickets">Departure from Faillaka</label><br />
                                                                                        <u><asp:Label ID="lblDepartureTickets" Class="text-uppercase" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblDepartureDate">Valid On</label><br />
                                                                                        <u><asp:Label ID="lblDepartureDate" Class="text-uppercase" runat="server">
                                                                                        </asp:Label></u>
                                                                                    </div>
                                                                                </div>--%>
                                                                                
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="panel-footer">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <%--<button type="button" class="btn btn-default" aria-label="Print" id="print1" onclick="window.print()">
                                                                                    <span class="glyphicon glyphicon-print" aria-hidden="true"></span>
                                                                                </button>--%>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
</asp:Content>