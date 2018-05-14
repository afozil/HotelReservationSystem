<%@ page title="" language="C#" masterpagefile="~/OnlineInside.master" autoeventwireup="true" inherits="mybooking, App_Web_3u0vitlg" %>

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
                            <a title="My Reservation" href="myreservation.aspx">My Reservation</a>
                        </div>
                    </div>
                </div>
                <div style="position: relative; float: left;">
                </div>
                <!--added by mahadevi-->
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
                                                            <span style="font-size: 18pt; color: rgb(255, 255, 255);">&nbsp;&nbsp; Find My Reservation</span>
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
                                                    <div class="col-md-4">&nbsp;</div>
                                                    <div class="col-md-4">
                                                        <div class="input-group">
                                                            <asp:TextBox ID="txtSearchTerm" runat="server" class="form-control input-md" aria-label="..." autocomplete="off"></asp:TextBox>
                                                            <div class="input-group-btn">
                                                                <asp:LinkButton ID="lnkAction" runat="server" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                                                                    aria-haspopup="true" aria-expanded="false">By <span class="caret"></span></asp:LinkButton>
                                                                <ul class="dropdown-menu dropdown-menu-right">
                                                                    <li>
                                                                        <asp:LinkButton ID="hlnkReservationNumber" runat="server" OnClick="hlnkReservationNumber_Click">Reservation Number</asp:LinkButton></li>
                                                                    <li role="separator" class="divider"></li>
                                                                    <li>
                                                                        <asp:LinkButton ID="hlnkMobile" runat="server" OnClick="hlnkMobile_Click">Mobile Number</asp:LinkButton></li>
                                                                    <li>
                                                                        <asp:LinkButton ID="hlnkCivilId" runat="server" OnClick="hlnkCivilId_Click">Civil ID</asp:LinkButton></li>
                                                                </ul>
                                                            </div>
                                                            <asp:RequiredFieldValidator ID="reqSearchTerm" runat="server" ErrorMessage="Required" ControlToValidate="txtSearchTerm" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">&nbsp;</div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br>
                                <span style="font-size: 18pt;">
                                    <table width="" align="left" style="border-collapse: collapse; width: 100%; border: medium none; background-color: rgb(6, 58, 86);">
                                        <tbody>
                                            <tr>
                                                <td style="border: medium none;">&nbsp;&nbsp; 
                                                    <span style="font-size: 12pt;">
                                                        <span style="font-size: 18pt;">
                                                            <span style="font-size: 18pt; color: rgb(255, 255, 255);">My Reservations</span>
                                                        </span>
                                                    </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </span>
                                <br>
                                <br>
                                <table width="941" height="353" align="left">
                                    <tbody>
                                        <tr>
                                            <td style="border: medium none;">
                                                <br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border: medium none; vertical-align: top; letter-spacing: 0px; word-spacing: 0px;">
                                                <span style="font-weight: bold; font-size: 12pt;">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="panel panel-info">
                                                                        <div class="panel-heading">
                                                                            <h3 class="panel-title">Reservation Details</h3>
                                                                        </div>
                                                                        <div class="panel-body">
                                                                            <div class="row">
                                                                                <div class="col-md-6">
                                                                                    <label for="lblReservationDate">Reservation Date</label>
                                                                                    <asp:Label ID="lblReservationDate" runat="server" class="form-control"></asp:Label>
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                    <label for="lblReservationNumber">Reservation Number</label>
                                                                                    <asp:Label ID="lblReservationNumber" runat="server" class="form-control"></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-md-12">&nbsp;</div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-md-6">
                                                                                    <label for="lblFromDate">From</label>
                                                                                    <asp:Label ID="lblFromDate" runat="server" class="form-control"></asp:Label>
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                    <label for="lblToDate">To</label>
                                                                                    <asp:Label ID="lblToDate" runat="server" class="form-control"></asp:Label>
                                                                                </div>

                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-md-12">&nbsp;</div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <fieldset>
                                                                                        <legend>Payment Details</legend>
                                                                                        <div class="row">
                                                                                            <div class="col-md-4">
                                                                                                <label for="lblBookingStatus">Booking Status</label>
                                                                                                <asp:Label ID="lblBookingStatus" runat="server" class="form-control"></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-md-4">
                                                                                                <label for="lblPaymentStatus">Payment Status</label>
                                                                                                <asp:Label ID="lblPaymentStatus" runat="server" class="form-control"></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-md-4">
                                                                                                <label for="lblPaymentId">Payment ID</label>
                                                                                                <asp:Label ID="lblPaymentId" runat="server" class="form-control"></asp:Label>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="col-md-12">&nbsp;</div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="col-md-4">
                                                                                                <label for="lblRate">Rate</label>
                                                                                                <asp:Label ID="lblRate" runat="server" class="form-control"></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-md-4">
                                                                                                <label for="lblBookingDays">Number of Days</label>
                                                                                                <asp:Label ID="lblBookingDays" runat="server" class="form-control"></asp:Label>
                                                                                            </div>
                                                                                            <div class="col-md-4">
                                                                                                <label for="lblCostAfterDiscount">Total</label>
                                                                                                <asp:Label ID="lblCostAfterDiscount" runat="server" class="form-control"></asp:Label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </fieldset>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="panel-footer">
                                                                            &nbsp;
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="panel panel-info">
                                                                        <div class="panel-heading">
                                                                            <h3 class="panel-title">Guest Details</h3>
                                                                        </div>
                                                                        <div class="panel-body">
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <fieldset>
                                                                                        <legend>Guest Details</legend>
                                                                                        <div class="row">
                                                                                            <div class="col-md-12">
                                                                                                <label for="lblGuest">Guest </label>
                                                                                                <asp:Label ID="lblGuest" runat="server" class="form-control"></asp:Label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </fieldset>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-md-12">&nbsp;</div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-md-4">
                                                                                    <label for="lblMobileNumber">Mobile</label>
                                                                                    <asp:Label ID="lblMobileNumber" runat="server" class="form-control"></asp:Label>
                                                                                </div>
                                                                                <div class="col-md-4">
                                                                                    <label for="lblCivilId">Civil ID</label>
                                                                                    <asp:Label ID="lblCivilId" runat="server" class="form-control"></asp:Label>
                                                                                </div>
                                                                                <div class="col-md-4">
                                                                                    <label for="lblPassportNumber">Passport Number</label>
                                                                                    <asp:Label ID="lblPassportNumber" runat="server" class="form-control"></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="panel-footer">&nbsp;</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">&nbsp;</div>
                                                            </div>

                                                        </div>
                                                    </div></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

