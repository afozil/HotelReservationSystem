<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_Reservation, App_Web_dcln124p" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>
                    <h1>Room Reservation</h1>
                </legend>

                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-9">
                                <asp:Button ID="btnPrint" runat="server" Text="Print Invoice" class="btn btn-md btn-primary" OnClick="btnPrint_Click" />
                               <asp:Button ID="btnPrintReservationConfirm" runat="server" Text="Print Reservation" class="btn btn-md btn-primary" OnClick="btnPrintReservationConfirm_Click"  />
                                <asp:Button ID="btnWelcomeLetter" runat="server" Text="Print Welcome Letter" class="btn btn-md btn-primary" OnClick="btnWelcomeLetter_Click"  />
                                <asp:Button ID="btnRegCard" runat="server" Text="Print Reg Card" class="btn btn-md btn-primary" OnClick="btnRegCard_Click"  />
                                <asp:Button ID="btnChangeRoom" runat="server" Text="Change Room" class="btn btn-md btn-default" OnClick="btnChangeRoom_Click"  />
                            </div>
                            <div class="col-md-9">&nbsp;</div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">&nbsp;</div>
                        </div>
                        <ajaxToolkit:Accordion ID="MyAccordion" runat="server"
                            SelectedIndex="0"
                            HeaderCssClass="accordionHeader"
                            ContentCssClass="accordionContent"
                            FadeTransitions="true"
                            FramesPerSecond="40"
                            TransitionDuration="250"
                            AutoSize="None">
                            <Panes>
                                <ajaxToolkit:AccordionPane ID="ReservationPane" runat="server">
                                    <Header>
                                        <a href="" onclick="return false;" class="list-group-item active">
                                            <span class="glyphicon glyphicon-tags"></span>
                                            &nbsp;Reservation
                                            <span class="badge"></span>
                                        </a>
                                    </Header>
                                    <Content>
                                        <div>
                                            <asp:GridView ID="reservationsGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="Reservation_ID"
                                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                                                CssClass="table table-striped table-bordered table-condensed table-hover"
                                                OnRowCommand="reservationsGrid_RowCommand" OnRowDataBound="reservationsGrid_RowDataBound"
                                                OnRowDeleting="reservationsGrid_RowDeleting" OnRowCancelingEdit="reservationsGrid_RowCancelingEdit" >
                                                <EmptyDataTemplate>
                                                    There are no reservations at the moment
                                                </EmptyDataTemplate>
                                                <Columns>
                                                    <asp:BoundField DataField="Reservation_ID" HeaderText="Booking ID" Visible="false" />
                                                    <asp:BoundField DataField="RoomType_EN" HeaderText="Room Type" />
                                                    <asp:BoundField DataField="RoomName_EN" HeaderText="Room" />
                                                    <asp:BoundField DataField="RateType_Description" HeaderText="Rate Type" />
                                                    <asp:BoundField DataField="Rate" HeaderText="Rate" />
                                                    <asp:BoundField DataField="PendingAmount" HeaderText="Pending" />
                                                    <asp:BoundField DataField="ReservationDate" HeaderText="Booking Date" DataFormatString="{0:MMMM d, yyyy}" />
                                                    <asp:BoundField DataField="FromDate" HeaderText="From Date" DataFormatString="{0:MMMM d, yyyy}" />
                                                    <asp:BoundField DataField="ToDate" HeaderText="To Date" DataFormatString="{0:MMMM d, yyyy}" />
                                                    <asp:BoundField DataField="BookingStatus_EN" HeaderText="Status" />
                                                    <asp:BoundField DataField="PaymentStatus_EN" HeaderText="Payment Status" />
                                                    <asp:TemplateField HeaderText="Reservation Type">
                                                         <ItemTemplate>
                                                             <%# (Eval("ReservationPersonnel").ToString().Equals("0")) ? "Internet" : "In-House" %>
                                                         </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkCheckInButton"
                                                                CommandArgument='<%# Eval("Reservation_ID") %>'
                                                                CommandName="CheckIn" runat="server"
                                                                Visible='<%# (Eval("BookingStatus_EN").Equals("CANCELLED") 
                                                            || Eval("BookingStatus_EN").Equals("CHECKED_IN") 
                                                            || Eval("BookingStatus_EN").Equals("CHECKED_OUT") 
                                                            || User.IsInRole("sales") 
                                                            || User.IsInRole("housekeeping") 
                                                            || User.IsInRole("configmanager")
                                                        ? false : true) %>'
                                                                class="btn  btn-primary btn-sm" OnClick="lnkCheckInButton_Click"
                                                                CausesValidation="false">
                                                                                Check In
                                                            </asp:LinkButton>
                                                            <asp:LinkButton ID="lnkCheckOutButton"
                                                                CommandArgument='<%# Eval("Reservation_ID") %>'
                                                                CommandName="CheckOut" runat="server"
                                                                Visible='<%# (Eval("BookingStatus_EN").Equals("CHECKED_IN") && (User.IsInRole("frontoffice") || 
                                                            User.IsInRole("administrator")) ? true : false)%>'
                                                                OnClick="lnkCheckOutButton_Click" class="btn  btn-primary btn-sm"
                                                                CausesValidation="false">
                                                                                Check Out
                                                            </asp:LinkButton>
                                                            <asp:LinkButton ID="lnkCancelButton"
                                                                CommandArgument='<%# Eval("Reservation_ID") %>' ToolTip="Cancel Reservation"
                                                                CommandName="Cancel" runat="server"
                                                                Visible='<%# ((Eval("BookingStatus_EN").Equals("CONFIRMED") || Eval("BookingStatus_EN").Equals("TENTATIVE"))
                                                            && (User.IsInRole("frontoffice") || User.IsInRole("administrator")) ? true : false)%>'
                                                                 class="btn  btn-default btn-sm"
                                                                CausesValidation="false">
                                                                                Cancel
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                                <HeaderStyle BackColor="#3276b1" Font-Bold="True" ForeColor="Black" />
                                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                <RowStyle ForeColor="#000066" />
                                                <EmptyDataRowStyle BackColor="#006699" Font-Bold="True" ForeColor="Black" />
                                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                                            </asp:GridView>
                                            <asp:Button ID="btnHidden" runat="Server" Style="display: none" OnClick="btnHidden_Click" CausesValidation="false" />
                                        </div>
                                    </Content>
                                </ajaxToolkit:AccordionPane>
                                <ajaxToolkit:AccordionPane ID="PaymentsPane" runat="server">
                                    <Header>
                                        <a href="" onclick="return false;" class="list-group-item active">
                                            <span class="glyphicon glyphicon-usd"></span>
                                            &nbsp;Payments
                                                        <span class="badge"></span>
                                        </a>
                                    </Header>
                                    <Content>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <asp:GridView ID="paymentsGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="Payment_ID"
                                                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                                                            CssClass="table table-striped table-bordered table-condensed table-hover"
                                                            OnRowCommand="paymentsGrid_RowCommand" OnRowDataBound="paymentsGrid_RowDataBound"
                                                            OnRowDeleting="paymentsGrid_RowDeleting" OnRowCancelingEdit="paymentsGrid_RowCancelingEdit">
                                                            <EmptyDataTemplate>
                                                                There are no payments at the moment
                                                            </EmptyDataTemplate>
                                                            <Columns>
                                                                <asp:BoundField DataField="Payment_ID" HeaderText="Payment_ID" Visible="false" />
                                                                <asp:BoundField DataField="Service" HeaderText="Service Type" />
                                                                <asp:BoundField DataField="CreatedDate" HeaderText="Payment Date" DataFormatString="{0:MMMM d, yyyy}" />
                                                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                                                <asp:BoundField DataField="UnitsConsumed" HeaderText="Days/Units" />
                                                                <asp:BoundField DataField="TotalCost_Before_Discount" HeaderText="Total Cost" />
                                                                <asp:BoundField DataField="Discount_Offered" HeaderText="Discount" />
                                                                <asp:BoundField DataField="Cost_After_Discount" HeaderText="After Discount" />
                                                                <asp:BoundField DataField="AmountReceived" HeaderText="Amount Received" />
                                                                <asp:TemplateField HeaderText="">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkCancelButton"
                                                                            CommandArgument='<%# Eval("Payment_ID") %>' ToolTip="Cancel Payment"
                                                                            CommandName="Cancel" runat="server" Visible='<%# ( (!Eval("Service").Equals("Reservation") && Eval("Status").Equals("Active")) && (User.IsInRole("administrator") || User.IsInRole("frontoffice")) ? true : false) %>'
                                                                            class="btn">
                                                                                        <img src="../Content/images/icon-cancel.gif" /></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                            </Columns>
                                                            <FooterStyle BackColor="White" ForeColor="#000066" />
                                                            <HeaderStyle BackColor="#3276b1" Font-Bold="True" ForeColor="Black" />
                                                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                            <RowStyle ForeColor="#000066" />
                                                            <EmptyDataRowStyle BackColor="#006699" Font-Bold="True" ForeColor="Black" />
                                                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">&nbsp;</div>
                                                </div>
                                                <asp:Panel ID="pnlAddPayments" runat="server">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="col-md-2">
                                                            <label for="drpServiceType">Service Type</label>
                                                            <asp:DropDownList ID="drpServiceType" runat="server" class="form-control input-sm" AutoPostBack="true" CausesValidation="false" OnSelectedIndexChanged="drpServiceType_SelectedIndexChanged">
                                                                <asp:ListItem Value="-1" Text="Select a service type..." Selected></asp:ListItem>
                                                                <asp:ListItem Value="3" Text="Amenities"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="Bills & Services"></asp:ListItem>
                                                                <asp:ListItem Value="1" Text="Reservation"></asp:ListItem>
                                                                <asp:ListItem Value="4" Text="Ferry (Adults)"></asp:ListItem>
                                                                <asp:ListItem Value="5" Text="Ferry (Kids)"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <label for="drpService">Service</label>
                                                            <asp:DropDownList ID="drpService" runat="server" class="form-control input-sm" AutoPostBack="true" CausesValidation="false" OnSelectedIndexChanged="drpService_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <label for="txtInvoice">Invoice / Coupon / Cheque Number</label>
                                                            <asp:TextBox ID="txtInvoice" runat="server" Class="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <label for="lblRate">Rate</label>
                                                            <asp:TextBox ID="lblRate" runat="server" Class="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <label for="txtUnits">Units Consumed</label>
                                                            <asp:TextBox ID="txtUnits" runat="server" Class="form-control input-sm" AutoPostBack="true" CausesValidation="false" OnTextChanged="txtUnits_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">&nbsp;</div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="col-md-2">
                                                            <label for="lblCost">Cost</label>
                                                            <asp:Label ID="lblCost" runat="server" Class="form-control input-sm"></asp:Label>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <label for="txtDiscount">Discount</label>
                                                            <asp:TextBox ID="txtDiscount" runat="server" Class="form-control input-sm" AutoPostBack="true" CausesValidation="false" OnTextChanged="txtDiscount_TextChanged"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <label for="lblAfterDiscount">After Discount</label>
                                                            <asp:Label ID="lblAfterDiscount" runat="server" Class="form-control input-sm"></asp:Label>
                                                        </div>

                                                        <div class="col-md-2">
                                                            <label for="txtAmountReceived">Amount Received</label>
                                                            <asp:TextBox ID="txtAmountReceived" runat="server" Class="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <label for="drpPaymentModes">Payment Mode</label>
                                                            <asp:DropDownList ID="drpPaymentModes" runat="server" class="form-control input input-md"></asp:DropDownList>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <br />
                                                            <asp:Button ID="btnSavePayment" runat="server" Text="Save" class="btn  btn-primary btn-sm" OnClick="btnSavePayment_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <asp:Label ID="lblPaymentMsg" runat="server"></asp:Label>
                                                    </div>
                                                </div>
                                                    </asp:Panel>
                                            </div>
                                        </div>
                                    </Content>
                                </ajaxToolkit:AccordionPane>
                                <ajaxToolkit:AccordionPane ID="AccompanyingGuestsPane" runat="server" Visible='<%# User.IsInRole("configmanager") %>'>
                                    <Header>
                                        <a href="" onclick="return false;" class="list-group-item active">
                                            <span class="glyphicon glyphicon-briefcase"></span>
                                            &nbsp;Accompanying Guests
                                                        <span class="badge"></span>
                                        </a>
                                    </Header>
                                    <Content>
                                        <div class="row">
                                            <div class="col-md-12">

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <asp:GridView ID="secGuestsGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="SecondaryGuest_ID"
                                                            AllowPaging="True" AllowSorting="True" OnPageIndexChanging="secGuestsGrid_OnPageIndexChanging" OnSorting="secGuestsGrid_Sorting"
                                                            OnRowDeleting="secGuestsGrid_RowDeleting" OnRowCommand="secGuestsGrid_RowCommand" OnRowDataBound="secGuestsGrid_RowDataBound"
                                                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                                                            CssClass="table table-striped table-bordered table-condensed table-hover">
                                                            <EmptyDataTemplate>
                                                                There are no accompanying guests at the moment
                                                            </EmptyDataTemplate>
                                                            <Columns>
                                                                <asp:BoundField DataField="SecondaryGuest_ID" HeaderText="SecondaryGuest ID" Visible="false" />
                                                                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                                                                <%--<asp:BoundField DataField="MiddleName" HeaderText="Middle Name" />--%>
                                                                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                                                                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                                                <asp:BoundField DataField="Civil_ID" HeaderText="Civil_ID" SortExpression="Civil_ID" />
                                                                <asp:BoundField DataField="MobileNumber" HeaderText="Mobile" SortExpression="MobileNumber" />
                                                                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkDelete"
                                                                            CommandArgument='<%# Eval("SecondaryGuest_ID") %>'
                                                                            CommandName="Delete" runat="server" Text="&lt;img src='../Images/icon-delete.gif' alt='Delete' border='0'/&gt;" ToolTip="Delete Accompanying Guest"
                                                                            Visible='<%# (!User.IsInRole("housekeeping") && !User.IsInRole("sales") ? true : false) %>'
                                                                            >
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <FooterStyle BackColor="White" ForeColor="#000066" />
                                                            <HeaderStyle BackColor="#3276b1" Font-Bold="True" ForeColor="Black" />
                                                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                            <RowStyle ForeColor="#000066" />
                                                            <EmptyDataRowStyle BackColor="#006699" Font-Bold="True" ForeColor="Black" />
                                                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">&nbsp;</div>
                                                </div>
                                                <asp:Panel ID="pnlAddSecondaryGuest"  runat="server" Visible='<%# User.IsInRole("housekeeping") %>' >
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <label for="drpSalutation">Salutation</label>
                                                            <asp:DropDownList ID="drpSalutation" runat="server" class="form-control input-sm">
                                                                <asp:ListItem Text="Mr." Value="1" Selected></asp:ListItem>
                                                                <asp:ListItem Text="Mrs." Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Ms." Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="Dr." Value="4"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <label for="txtFirstName">First Name</label>
                                                            <asp:TextBox ID="txtFirstName" runat="server" Class="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                        <%--<div class="col-md-2">
                                <label for="txtMiddleName">Middle Name</label>
                                <asp:TextBox ID="txtMiddleName" runat="server" Class="form-control input-sm"></asp:TextBox>
                            </div>--%>
                                                        <div class="col-md-2">
                                                            <label for="txtLastName">Last Name</label>
                                                            <asp:TextBox ID="txtLastName" runat="server" Class="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <label for="txtAge">Age</label>
                                                            <asp:TextBox ID="txtAge" runat="server" Class="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <label for="drpGender">Gender</label>
                                                            <asp:DropDownList ID="drpGender" runat="server" class="form-control input-sm">
                                                                <asp:ListItem Text="Male" Value="1" Selected></asp:ListItem>
                                                                <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                
                                                <div class="row">
                                                    <div class="col-md-12">&nbsp;</div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <label for="drpRelationShip">Relationship</label>
                                                        <asp:DropDownList ID="drpRelationShip" runat="server" class="form-control input-sm">
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <label for="txtCivilId">Civil ID</label>
                                                        <asp:TextBox ID="txtCivilId" runat="server" Class="form-control input-sm"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="regCivilId" ControlToValidate="txtCivilId" ValidationExpression="^[0-9]{12,12}$"
                                                            ForeColor="red" ErrorMessage="Must be a Number. Length 12" runat="server"></asp:RegularExpressionValidator>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <label for="txtMobileNumber">Mobile Number</label>
                                                        <asp:TextBox ID="txtMobileNumber" runat="server" Class="form-control input-sm"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="regMobileNumber" ControlToValidate="txtMobileNumber" ForeColor="red" runat="server" ErrorMessage="Must be a Number. Length 8"
                                                            ValidationExpression="^[0-9]{8,8}$" />
                                                    </div>
                                                    <%-- <div class="col-md-2">
                                <label for="txtEmail">Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" Class="form-control input-sm"></asp:TextBox>
                            </div>--%>
                                                    <div class="col-md-2">
                                                        <br />
                                                        <asp:Button ID="btnSave" runat="server" Text="Add" class="btn  btn-primary btn-sm" OnClick="btnSaveGuest_Click" />
                                                        <asp:HiddenField ID="hidReservationId" runat="server" />
                                                        <asp:HiddenField ID="hidReservationStatus" runat="server" />
                                                        <asp:HiddenField ID="hidMaxOccupancy" runat="server" />
                                                        <asp:HiddenField ID="hidCurrentOccupancy" runat="server" />
                                                        <asp:HiddenField ID="hidGuestId" runat="server" />
                                                        <asp:HiddenField ID="hidCheckOutId" runat="server" />
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <asp:Label ID="lblGstMsg" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>
                                                    </asp:Panel>

                                            </div>
                                        </div>


                                    </Content>
                                </ajaxToolkit:AccordionPane>
                                <ajaxToolkit:AccordionPane ID="KNETPaymentPane" runat="server">
                                    <Header>
                                        <a href="" onclick="return false;" class="list-group-item active">
                                            <span class="glyphicon glyphicon-tags"></span>
                                            &nbsp;KNET Payment
                                            <span class="badge"></span>
                                        </a>
                                    </Header>
                                    <Content>
                                        <div>
                                            <asp:GridView ID="knetPaymentsGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="KNET_Payment_ID"
                                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                                                CssClass="table table-striped table-bordered table-condensed table-hover"
                                                >
                                                <EmptyDataTemplate>
                                                    There are no KNET Payments at the moment
                                                </EmptyDataTemplate>
                                                <Columns>
                                                    <asp:BoundField DataField="CreatedDate" HeaderText="Date" DataFormatString="{0:MMMM d, yyyy}" />
                                                    <asp:BoundField DataField="KNET_Payment_ID" HeaderText="KNET Payment ID" />
                                                    <asp:BoundField DataField="Reservation_ID" HeaderText="Reservation ID" />
                                                    <asp:BoundField DataField="TransVal" HeaderText="Trans ID" />
                                                    <asp:BoundField DataField="PaymentAmount" HeaderText="Amount" />
                                                    <asp:BoundField DataField="PaymentStatus_EN" HeaderText="Payment Status" />
                                                    <asp:BoundField DataField="Ref" HeaderText="Reference"/>
                                                    <asp:BoundField DataField="Result" HeaderText="Result"/>
                                                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                                                </Columns>
                                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                                <HeaderStyle BackColor="#3276b1" Font-Bold="True" ForeColor="Black" />
                                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                <RowStyle ForeColor="#000066" />
                                                <EmptyDataRowStyle BackColor="#006699" Font-Bold="True" ForeColor="Black" />
                                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                                            </asp:GridView>
                                        </div>
                                    </Content>
                                </ajaxToolkit:AccordionPane>
                            </Panes>
                        </ajaxToolkit:Accordion>





                        
                    </div>
                </div>






                
                
                        
            </fieldset>
        </div>
    </div>
</asp:Content>

