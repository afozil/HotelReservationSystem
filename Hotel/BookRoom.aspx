<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BookRoom.aspx.cs" Inherits="Hotel_BookRoom" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
        <script>
            $(function () {
                $("#MainContent_txtFromDate").datepicker();
            });

            $(function () {
                $("#MainContent_txtToDate").datepicker();
            });

        </script>

    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>
                    <h1>Book Room</h1>
                </legend>

                <div class="row">
                    <div class="col-md-9">
                        <fieldset>
                            <legend>
                                <h5>Booking Info</h5>
                            </legend>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="txtFromDate">From Date</label>
                                    <span class="input-group">
                                        <asp:TextBox ID="txtFromDate" runat="server" class="form-control input-md" placeholder="mm/dd/yyyy"></asp:TextBox>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                                    </span>
                                    <asp:RequiredFieldValidator ID="reqFromDate" runat="server" ErrorMessage="Required" ControlToValidate="txtFromDate" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regFromDate" runat="server" ErrorMessage="In correct Date Format" ControlToValidate="txtFromDate" Display="Static" ForeColor="Red"
                                        ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>

                                </div>
                                <div class="col-md-3">
                                    <label for="txtToDate">To Date</label>
                                    <span class="input-group">
                                        <asp:TextBox ID="txtToDate" runat="server" class="form-control input-md" placeholder="mm/dd/yyyy"></asp:TextBox>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                                    </span>
                                    <asp:RequiredFieldValidator ID="reqToDate" runat="server" ErrorMessage="Required" ControlToValidate="txtToDate" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regToDate" runat="server" ErrorMessage="In correct Date Format" ControlToValidate="txtToDate" Display="Static" ForeColor="Red"
                                        ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-md-3">
                                    <label for="drpRoomTypes">Room Types</label>
                                    <asp:DropDownList ID="drpRoomTypes" runat="server" class="form-control input input-md"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="reqRoomTypes" runat="server" ErrorMessage="Required" ControlToValidate="drpRoomTypes" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-3">
                                    <label for="btnChkReservation"></label>
                                    <br />
                                    <asp:Button ID="btnChkReservation" runat="server" Text="Check Availability" class="btn btn-sm btn-primary" OnClick="btnChkReservation_Click" />
                                    <asp:Button ID="btnReset" runat="server" Text="Reset" class="btn  btn-default btn-sm" OnClick="btnReset_Click" CausesValidation="false" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">&nbsp;</div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="drpRatesTypes">Rate Types</label>
                                    <asp:DropDownList ID="drpRateTypes" runat="server" class="form-control input input-md" AutoPostBack="true" OnSelectedIndexChanged="drpRateTypes_SelectedIndexChanged" CausesValidation="false"></asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <label for="drpRatesAvailable">Available Rates</label>
                                    <asp:DropDownList ID="drpRatesAvailable" runat="server" class="form-control input input-md" AutoPostBack="true" OnSelectedIndexChanged="drpRatesAvailable_SelectedIndexChanged" CausesValidation="false"></asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <label for="drpAvailableRooms">Available Rooms</label>
                                    <asp:DropDownList ID="drpAvailableRooms" runat="server" class="form-control input input-md disabled" AutoPostBack="true" OnSelectedIndexChanged="drpAvailableRooms_SelectedIndexChanged" CausesValidation="false"></asp:DropDownList>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-12"><hr class="ui-menu-divider"/></div>
                            </div>
                            
                            <div class="row">
                                <!--Payment Data-->
                                <div class="col-md-3">
                                    <label for="drpDiscountUnit">Offer Discount in</label>
                                    <asp:DropDownList ID="drpDiscountUnit" runat="server" class="form-control input input-md">
                                        <asp:ListItem Text="Percentage" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Fixed" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <label for="txtDiscountOffered">Discount</label>

                                    <div class="input-group">
                                        <span class="input-group-addon">KD</span>
                                        <asp:TextBox ID="txtDiscountOffered" runat="server" class="form-control input input-md" aria-label="..."></asp:TextBox>
                                        <asp:HiddenField ID="hidDiscountOffered" runat="server" />
                                    </div>

                                </div>
                                <div class="col-md-4">
                                    <label for="btnCalculateBookingAmount"></label>
                                    <br />
                                    <asp:Button ID="btnCalculateBookingAmount" runat="server" Text="Calculate" class="btn btn-sm btn-primary" OnClick="btnCalculateBookingAmount_Click"/>
                                </div>
                                <div class="col-md-2">
                                    &nbsp;
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">&nbsp;</div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="txtBookingAmount">Booking Amount</label>
                                    <div class="input-group">
                                        <span class="input-group-addon">KD</span>
                                        <asp:TextBox ID="txtBookingAmount" runat="server" class="form-control input input-md"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="drpPaymentModes">Payment Mode</label>
                                    <asp:DropDownList ID="drpPaymentModes" runat="server" class="form-control input input-md"></asp:DropDownList>
                                </div>
                                <div class="col-md-5">
                                    <label for="txtRemarks">Comments</label>
                                    <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Rows="5" class="form-control input input-md"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12"><hr></div>
                            </div>
                            <div class="row">
                                <!-- Guest Data-->
                                <div class="col-md-2">
                                    <label for="drpSrchCriteria">Filter By</label>
                                    <asp:DropDownList ID="drpSrchCriteria" runat="server" class="form-control input input-md">
                                        <asp:ListItem Text="First Name" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Mobile Number" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Civil ID" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <label for="txtSrchValue">Criteria</label>
                                    <asp:TextBox ID="txtSrchValue" runat="server" class=" form-control input-md"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <label for="btnSrchGuest"></label>
                                    <br />
                                    <asp:Button ID="btnSrchGuest" runat="server" Text="Search" class="btn btn-primary btn-md" OnClick="btnSrchGuest_Click" CausesValidation="false"/>
                                </div>
                                <div class="col-md-3">
                                    <label for="drpGuests">Search Guests</label>
                                    <asp:DropDownList ID="drpGuests" runat="server" class="form-control input input-md" CausesValidation="false" AutoPostBack="true" OnSelectedIndexChanged="drpGuests_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-md-2">
                                    <label for="btnShowPopup">&nbsp;</label><br />
                                    <asp:HiddenField ID="hidNewGuestId" runat="server" />
                                    <asp:Button ID="btnHidden" runat="Server" style="display:none" OnClick="btnHidden_Click" CausesValidation="false" />
                                    <asp:Button ID="btnShowPopup" runat="Server" Text="Add Guest" OnClick="btnShowPopup_Click" class="btn  btn-primary btn-sm" CausesValidation="false"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">&nbsp;</div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" DataKeyNames="Guest_ID" 
                                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                                        CssClass="table table-striped table-bordered table-condensed table-hover">
                                        <Columns>
                                            <asp:BoundField DataField="Guest_ID" HeaderText="Guest_ID" Visible="false" />
                                            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                            <asp:BoundField DataField="MiddleName" HeaderText="Middle Name" />
                                            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                                            <asp:BoundField DataField="Civil_ID" HeaderText="Civil ID" />
                                            <asp:BoundField DataField="MobileNumber" HeaderText="Mobile" />
                                            <%-- <asp:BoundField DataField="Category" HeaderText="Category" />--%>
                                            <asp:BoundField DataField="Nationality" HeaderText="Nationality" />
                                        </Columns>
                                        <FooterStyle BackColor="White" ForeColor="#000066" />
                                        <HeaderStyle BackColor="#3276b1" Font-Bold="True" ForeColor="Black" />
                                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                        <RowStyle ForeColor="#000066" />
                                        <EmptyDataRowStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="forms-control">
                                        <asp:Button ID="btnSaveBooking" runat="server" Text="Reserve" class="btn btn-md btn-primary" OnClick="btnSaveBooking_Click" />
                                        &nbsp;
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-md" OnClick="btnCancel_Click" CausesValidation="false" />
                                    </div>
                                </div>
                            </div>
                            <%-- 
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true"
                                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                                        CssClass="table table-striped table-bordered table-condensed table-hover">
                                        
                                            <Columns>
                                            <asp:BoundField DataField="Guest_ID" HeaderText="Guest_ID" Visible="false" />
                                            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                                            <asp:BoundField DataField="MiddleName" HeaderText="Middle Name" />
                                            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                                            <asp:BoundField DataField="Civil_ID" HeaderText="Civil ID" SortExpression="Civil_ID" />
                                            <asp:BoundField DataField="MobileNumber" HeaderText="Mobile" SortExpression="MobileNumber" />
                                            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />

                                        </Columns>
                                            
                                        <FooterStyle BackColor="White" ForeColor="#000066" />
                                        <HeaderStyle BackColor="#3276b1" Font-Bold="True" ForeColor="Black" />
                                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                        <RowStyle ForeColor="#000066" />
                                        <EmptyDataRowStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                                    </asp:GridView>
                                </div>
                            </div>
                                --%>



                        </fieldset>
                    </div>
                    <div class="col-md-3">
                        <fieldset>
                            <legend>
                                <h5>Selection Info</h5>
                            </legend>
                            <div class="row">
                                <div class="col-md-12">

                                    <ajaxToolkit:Accordion ID="MyAccordion" runat="server"
                                        SelectedIndex="0"
                                        HeaderCssClass="accordionHeader"
                                        ContentCssClass="accordionContent"
                                        FadeTransitions="true"
                                        FramesPerSecond="40"
                                        TransitionDuration="250"
                                        AutoSize="None">
                                        <Panes>
                                            <ajaxToolkit:AccordionPane ID="PaymentPane" runat="server">
                                                <Header>
                                                    <a href="" onclick="return false;" class="list-group-item active">
                                                        <span class="glyphicon glyphicon-usd"></span>
                                                        &nbsp;Payment
                                                        <span class="badge"></span>
                                                    </a>
                                                </Header>
                                                <Content>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblEmployeeDiscount" runat="server"></asp:Label>&nbsp;
                                                        <asp:Label ID="lblEmployeeDiscountUnit" runat="server"></asp:Label>&nbsp;
                                                        <asp:Label ID="lblEmployeeDiscountInKD" runat="server"></asp:Label>
                                                        <asp:HiddenField ID="hidEmployeeDiscountUnit" runat="server" />
                                                        <asp:HiddenField ID="hidEmployeeDiscount" runat="server" />
                                                        <asp:HiddenField ID="hidDiscountId" runat="server" />
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblDiscountOffered" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblBookingDays" runat="server"></asp:Label>
                                                        <asp:HiddenField ID="hidBookingDays" runat="server"></asp:HiddenField>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblTotalCost" runat="server"></asp:Label>
                                                        <asp:HiddenField runat="server" ID="hidTotalCost" />
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblCostAfterDiscount" runat="server"></asp:Label>
                                                        <asp:HiddenField runat="server" ID="hidCostAfterDiscount" />
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblPaymentStatus" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                </Content>
                                            </ajaxToolkit:AccordionPane>

                                            <ajaxToolkit:AccordionPane ID="RatePane" runat="server">
                                                <Header>
                                                    <a href="" onclick="return false;" class="list-group-item active">
                                                        <span class="glyphicon glyphicon-barcode"></span>
                                                        &nbsp;Rate
                                                        <span class="badge"></span>
                                                    </a>
                                                </Header>
                                                <Content>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblRateType" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblRateDescription" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblRateFrom" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblRateTo" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblRate" runat="server"></asp:Label>
                                                        <asp:HiddenField ID="hidRate" runat="server"></asp:HiddenField>
                                                        <span class="badge"></span>
                                                    </a>
                                                </Content>
                                            </ajaxToolkit:AccordionPane>

                                            <ajaxToolkit:AccordionPane ID="RoomPane" runat="server">
                                                <Header>
                                                    <a href="" onclick="return false;" class="list-group-item active">
                                                        <span class="glyphicon glyphicon-home"></span>
                                                        &nbsp;Room
                                                            <span class="badge"></span>
                                                    </a>
                                                </Header>
                                                <Content>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblRoomNumber" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblRoomType" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblRoomDescription" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblMaxOccupancy" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblMaxGents" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblMaxKids" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblMaxBedRooms" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblMaxBeds" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblMaxKitchens" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblReferigerator" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblCookingFacility" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblMaxTV" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                    <a href="#" class="list-group-item">
                                                        <span class="glyphicon glyphicon-menu-right"></span>
                                                        <asp:Label ID="lblMaxLivingRoooms" runat="server"></asp:Label>
                                                        <span class="badge"></span>
                                                    </a>
                                                </Content>
                                            </ajaxToolkit:AccordionPane>
                                        </Panes>
                                    </ajaxToolkit:Accordion>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</asp:Content>

