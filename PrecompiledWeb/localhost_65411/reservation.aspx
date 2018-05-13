<%@ page title="" language="C#" masterpagefile="~/OnlineInside.master" autoeventwireup="true" inherits="reservation, App_Web_wxkg3lpr" enableeventvalidation="False" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="reseversationPanel" runat="server">
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
                            <a title="Reservation" href="reservation.aspx">Reservation</a>
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
                                    <table width="" align="left" style="border-collapse: collapse; width: 100%; border: medium none; background-color: rgb(6, 58, 86);">
                                        <tbody>
                                            <tr>
                                                <td style="border: medium none;">
                                                    <span style="font-size: 18pt; color: rgb(255, 255, 255);"></span>
                                                    <span style="font-size: 12pt;">
                                                        <span style="font-size: 18pt;">
                                                            <span style="font-size: 18pt; color: rgb(255, 255, 255);">&nbsp;&nbsp;Reservation</span>
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
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-8">
                                                                <div class="panel panel-info">
                                                                    <div class="panel-heading">
                                                                        <h3 class="panel-title">Guest Details</h3>
                                                                    </div>
                                                                    <div class="panel-body">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <div class="alert alert-warning" role="alert">
                                                                                <label for="txtCivilID">Enter your Civil ID# here if you are a returning customer</label>
                                                                                <asp:TextBox ID="txtRetCvd" runat="server" Class="form-control input-md" autocomplete="off" MaxLength="12" placeholder="Press Enter Key after your Civil ID" OnTextChanged="Cvd_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-12">&nbsp;</div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <asp:Panel ID="pnlStatus" runat="server" role="alert">
                                                                                        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                                                                </asp:Panel>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-2">
                                                                                <label for="drpSalutation">Salutation</label>
                                                                                <asp:DropDownList ID="drpSalutation" runat="server" class="form-control input-md">
                                                                                    <asp:ListItem Text="Mr." Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="Mrs." Value="2"></asp:ListItem>
                                                                                    <asp:ListItem Text="Ms." Value="3"></asp:ListItem>
                                                                                    <asp:ListItem Text="Dr." Value="4"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </div>
                                                                            <div class="col-md-4">
                                                                                <label for="txtFirstName">First Name</label>
                                                                                <asp:TextBox ID="txtFirstName" runat="server" Class="form-control input-md" autocomplete="off"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="reqFirstName" runat="server" ErrorMessage="Required" ControlToValidate="txtFirstName" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <div class="col-md-3">
                                                                                <label for="txtMiddleName">Middle Name</label>
                                                                                <asp:TextBox ID="txtMiddleName" runat="server" Class="form-control input-md" autocomplete="off"></asp:TextBox>
                                                                            </div>
                                                                            <div class="col-md-3">
                                                                                <label for="txtLastName">Last Name</label>
                                                                                <asp:TextBox ID="txtLastName" runat="server" Class="form-control input-md" autocomplete="off"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="reqLastName" runat="server" ErrorMessage="Required" ControlToValidate="txtLastName" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-12">&nbsp;</div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-4">
                                                                                <label for="txtDOB">Date of Birth</label>
                                                                                <div class="input-group">
                                                                                    <asp:TextBox ID="txtDOB" runat="server" class="form-control input-md" placeholder="mm/dd/yyyy" autocomplete="off"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender ID="txtDOBExtender" PopupButtonID="imgPopup" runat="server" TargetControlID="txtDOB" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                                                                                    <asp:RequiredFieldValidator ID="reqDOB" runat="server" ErrorMessage="Required" ControlToValidate="txtDOB" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                                                                                    <asp:RegularExpressionValidator ID="regDOB" runat="server" ErrorMessage="In correct Date Format" ControlToValidate="txtDOB" Display="Static" ForeColor="Red"
                                                                                        ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4">
                                                                                <label for="drpNationality">Nationality</label>
                                                                                <asp:DropDownList ID="drpNationality" runat="server" class="form-control input-md"></asp:DropDownList>
                                                                            </div>
                                                                            <div class="col-md-4">
                                                                                <label for="txtCivilId">Civil ID</label>
                                                                                <asp:TextBox ID="txtCivilId" runat="server" Class="form-control input-md" autocomplete="off" MaxLength="12"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="reqCivilId" runat="server" ErrorMessage="Required" ControlToValidate="txtCivilId" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-12">&nbsp;</div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-4">
                                                                                <label for="txtPassportNumber">Passport Number</label>
                                                                                <asp:TextBox ID="txtPassportNumber" runat="server" Class="form-control input-md" autocomplete="off"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="reqPassportNumber" runat="server" ErrorMessage="Required" ControlToValidate="txtPassportNumber" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <div class="col-md-4">
                                                                                <label for="txtMobileNumber">Mobile Number</label>
                                                                                <asp:TextBox ID="txtMobileNumber" runat="server" Class="form-control input-md" MaxLength="12" autocomplete="off"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="reqMobileNumber" runat="server" ErrorMessage="Required" ControlToValidate="txtMobileNumber" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <div class="col-md-4">
                                                                                <label for="txtEmail">Email</label>
                                                                                <asp:TextBox ID="txtEmail" runat="server" Class="form-control input-md" autocomplete="off"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="reqEmail" runat="server" ErrorMessage="Required" ControlToValidate="txtEmail" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-12">&nbsp;</div>
                                                                        </div>
                                                                        <%--<div class="row">
                                                                            <div class="col-md-12">
                                                                                <div class="checkbox">
                                                                                    <label>
                                                                                        <asp:CheckBox ID="chkWantFerry" runat="server" OnCheckedChanged="chkWantFerry_CheckedChanged" CausesValidation="false" AutoPostBack="true" />
                                                                                        Do you want Ferry
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-12">&nbsp;</div>
                                                                        </div>
                                                                        <asp:Panel ID="pnlFerry" runat="server" Visible="false">
                                                                                <div class="row">
                                                                                    <div class="col-md-3">
                                                                                        <div class="form-group">
                                                                                        <label for="drpNumberOfAdults">For # Adults  </label>
                                                                                        <asp:DropDownList ID="drpNumberOfAdults" runat="server" class="form-control input input-md" OnSelectedIndexChanged="drpNumberOfAdults_SelectedIndexChanged" CausesValidation="false" AutoPostBack="true">
                                                                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                                                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                                                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                                                                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                                                                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                                                                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                                                                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                                                        <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                                                                        <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                                                                        <asp:ListItem Text="13" Value="13"></asp:ListItem>
                                                                                        <asp:ListItem Text="14" Value="14"></asp:ListItem>
                                                                                        <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                                                                        <asp:ListItem Text="16" Value="16"></asp:ListItem>
                                                                                        <asp:ListItem Text="17" Value="17"></asp:ListItem>
                                                                                        <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                                                                        <asp:ListItem Text="19" Value="19"></asp:ListItem>
                                                                                        <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                        <asp:HiddenField ID="hidNumberOfAdults" runat="server"/>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-md-3">
                                                                                        <div class="form-group">
                                                                                         <label for="lblCostForAdults">@ Rate of</label>
                                                                                        <asp:Label ID="lblCostForAdults" runat="server" Class="form-control"></asp:Label>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-md-3">
                                                                                        <div class="form-group">
                                                                                        <label for="drpNumberOfChildren">For # Children</label>
                                                                                        <asp:DropDownList ID="drpNumberOfChildren" runat="server" class="form-control input input-md" OnSelectedIndexChanged="drpNumberOfKids_SelectedIndexChanged" CausesValidation="false" AutoPostBack="true">
                                                                                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                                                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                                                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                                                                        <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                                                                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                                                                        <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                                                                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                                                        <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                                                                        <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                                                                        <asp:ListItem Text="13" Value="13"></asp:ListItem>
                                                                                        <asp:ListItem Text="14" Value="14"></asp:ListItem>
                                                                                        <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                                                                        <asp:ListItem Text="16" Value="16"></asp:ListItem>
                                                                                        <asp:ListItem Text="17" Value="17"></asp:ListItem>
                                                                                        <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                                                                        <asp:ListItem Text="19" Value="19"></asp:ListItem>
                                                                                        <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                    <asp:HiddenField ID="hidNumberOfChildren" runat="server"/>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-md-3">
                                                                                        <div class="form-group">
                                                                                        <label for="lblCostForKids">@ Rate of</label>
                                                                                        <asp:Label ID="lblCostForKids" runat="server" Class="form-control"></asp:Label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </asp:Panel>--%>
                                                                    </div>
                                                                    <div class="panel-footer">&nbsp;</div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="panel panel-info">
                                                                    <div class="panel-heading">
                                                                        <h3 class="panel-title">Payment Details</h3>
                                                                    </div>
                                                                    <div class="panel-body">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <label for="lblRoomCharges">Room Charges</label>
                                                                                <div class="input-group">
                                                                                    <span class="input-group-addon">KD</span>
                                                                                    <asp:Label ID="lblRoomCharges" runat="server" Class="form-control"></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-12">&nbsp;</div>
                                                                        </div>
                                                                        <%--<div class="row">
                                                                            <div class="col-md-12">
                                                                                <label for="lblFerryCharges">Ferry Charges</label>
                                                                                <div class="input-group">
                                                                                    <span class="input-group-addon">KD</span>
                                                                                    <asp:Label ID="lblFerryCharges" runat="server" Class="form-control"></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-12">&nbsp;</div>
                                                                        </div>--%>
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <label for="lblAmountToPay">Amount to be Paid</label>
                                                                                <div class="input-group">
                                                                                    <span class="input-group-addon">KD</span>
                                                                                    <asp:Label ID="lblAmountToPay" runat="server" Class="form-control"></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-12">&nbsp;</div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <label for="lblCardType">Pay by</label>
                                                                                <asp:Label ID="lblCardType" Class="form-control" runat="server">
                                                                                </asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="panel-footer">
                                                                        &nbsp;
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
            </div>
            <div class="row">
                <div class="col-md-10">&nbsp;</div>
            </div>
            
            <div class="row">
                <div class="col-md-6">&nbsp;</div>
                <div class="col-md-4">
                    <div class="forms-control">
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-md" OnClick="btnCancel_Click" CausesValidation="false" />
                        &nbsp;
                        <asp:Button ID="btnSaveBooking" runat="server" Text="Book Now" CssClass="btn btn-md btn-primary" OnClick="btnSaveBooking_Click" />
                    </div>
                </div>
            </div>
            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br>
            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            
            <asp:HiddenField ID="hidFromDate" runat="server" />
            <asp:HiddenField ID="hidToDate" runat="server" />
            <asp:HiddenField ID="hidNumRooms" runat="server" />
            <asp:HiddenField ID="hidNumAdults" runat="server" />
            <asp:HiddenField ID="hidNumKids" runat="server" />
            <asp:HiddenField ID="hidRoomTypeId" runat="server" />
            <asp:HiddenField ID="hidRoomType" runat="server" />

            <asp:HiddenField ID="hidBookingDays" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidRoomId" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidRate" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidRateType" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidRateId" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidCostAfterDiscount" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidDiscountOffered" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidTotalCost" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidDiscountId" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidSelectedCardType" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidRoomCharges" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidAmountToPay" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidPayableForFerry" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidInsertOrUpdateGuest" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidGuestId" runat="server"></asp:HiddenField>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="reservationUpdateProgress" runat="server">
        <ProgressTemplate>
            <div style="background-color: Gray; filter: alpha(opacity=80); opacity: 0.80; width: 100%; top: 0px; left: 0px; position: fixed; height: 800px;">
            </div>
            <div style="margin: auto; font-family: Trebuchet MS; filter: alpha(opacity=100); opacity: 1; font-size: small; vertical-align: middle; top: auto; position: absolute; right: auto; color: #FFFFFF;">
                <table width="100%">
                    <tr>
                        <td align="center" valign="middle">
                            <span style="font-family: Georgia; font-size: medium; font-weight:bold ; color: #FFFFFF">Loading....</span><br />
                            <img src="Images/progress.gif" alt="Loading..." /></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>



