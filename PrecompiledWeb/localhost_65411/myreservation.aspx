<%@ page title="" language="C#" masterpagefile="~/OnlineInside.master" autoeventwireup="true" inherits="myreservation, App_Web_4qpqkpye" enableeventvalidation="False" %>

<asp:Content ID="MyReservationContent" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="myReseversationPanel" runat="server">
        <ContentTemplate>
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
                            <a title="Find my Reservation" href="myreservation.aspx">Find My Reservation</a>
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
                                                            <span style="font-size: 18pt; color: rgb(255, 255, 255);">&nbsp;&nbsp;Find My Reservation</span>
                                                        </span>
                                                    </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br>
                                </span>
                                <br>
                                <table width="941" align="center">
                                    <tbody>
                                        <tr>
                                            <td style="border: medium none;">
                                                <br>
                                                <div class="row">
                                                    <div class="col-md-3">&nbsp;</div>
                                                    <div class="col-md-6">
                                                        <div class="alert alert-warning" role="alert">
                                                            <label for="txtSearchTerm">Enter your KNET Payment ID / Reservation Number</label>
                                                            <div class="input-group">
                                                            <asp:TextBox ID="txtSearchTerm" runat="server" class="form-control input-md" aria-label="..." autocomplete="off"></asp:TextBox>
                                                            <div class="input-group-btn">
                                                                <asp:LinkButton ID="lnkAction" runat="server" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                                                                    aria-haspopup="true" aria-expanded="false">Search By <span class="caret"></span></asp:LinkButton>
                                                                <ul class="dropdown-menu dropdown-menu-right">
                                                                        <li><asp:LinkButton ID="hlnkKnetPaymentId" runat="server" OnClick="hlnkKnetPaymentId_Click">KNET Payment ID</asp:LinkButton></li>
                                                                        <li><asp:LinkButton ID="hlnkReservationId" runat="server" OnClick="hlnkReservationId_Click">Reservation Number</asp:LinkButton></li>    
                                                                        <li role="separator" class="divider"></li>
                                                                        <li><asp:LinkButton ID="hlnkMobile" runat="server" OnClick="hlnkMobile_Click">Mobile Number</asp:LinkButton></li>
                                                                        <li><asp:LinkButton ID="hlnkCivilId" runat="server" OnClick="hlnkCivilId_Click">Civil ID</asp:LinkButton></li>
                                                                </ul>
                                                            </div>
                                                            <asp:RequiredFieldValidator ID="reqSearchTerm" runat="server" ErrorMessage="Required" ControlToValidate="txtSearchTerm" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                                                        </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">&nbsp;</div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border: medium none;">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <asp:Label ID="lblResult" runat="server" ForeColor="Red" Text=""></asp:Label></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br>
                                <table width="941px" align="center">
                                    <tbody>
                                        <tr>
                                            <td style="border: medium none;">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:Panel ID="pnlSearchResult" runat="server" Visible="false">
                                                                <div class="panel panel-info">
                                                                    <div class="panel-heading">
                                                                        <button type="button" class="btn btn-default" aria-label="Print" id="print" onclick="window.print()">
                                                                              <span class="glyphicon glyphicon-print" aria-hidden="true"></span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="panel-body">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
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
                                                                                <%--<div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblAdults">Total Adults</label>
                                                                                        <asp:Label ID="lblAdults" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblKids">Total Kids</label>
                                                                                        <asp:Label ID="lblKids" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">&nbsp;</div>
                                                                                </div>--%>
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
                                                                                                                    <span style="font-size: 18pt; color: rgb(255, 255, 255);">&nbsp;&nbsp; Payment Info</span>
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
                                                                                    <div class="col-md-4">
                                                                                        <label for="lblFerryCharges">Ferry Charges</label><br />
                                                                                            <span>KD</span>
                                                                                            <u><asp:Label ID="lblFerryCharges" runat="server" Class="text-uppercase"></asp:Label></u>
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
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="panel-footer">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <button type="button" class="btn btn-default" aria-label="Print" id="print1" onclick="window.print()">
                                                                                    <span class="glyphicon glyphicon-print" aria-hidden="true"></span>
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                </asp:Panel>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

