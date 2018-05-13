<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_CheckOut, App_Web_0t3h1jy2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
        <script>
        $(function () {
            $("#MainContent_txtCheckOutDate").datepicker();
        });
        function RefreshParent() {
            window.opener.document.getElementById('MainContent_hidReservationId').value = document.getElementById('MainContent_hidReservationId').value;
            window.opener.document.getElementById('MainContent_hidCheckOutId').value = document.getElementById('MainContent_hidCheckOutId').value;
            window.opener.document.getElementById('MainContent_btnHidden').click();
            window.close();
        }

    </script>
        <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>
                    <h1>Check Out</h1>
                </legend>
                <div class="row">
                    <div class="col-md-2">
                        <label for="lblBookingFromDate">Booked From: </label>
                        <asp:Label ID="lblBookingFromDate" runat="server" class="form-control input-md"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <label for="lblBookingFromDate">Booked To: </label>
                        <asp:Label ID="lblBookingToDate" runat="server" class="form-control input-md"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <label for="lblBookedDays">Booked Days: </label>
                        <asp:Label ID="lblBookedDays" runat="server" class="form-control input-md"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <label for="lblBookingFromDate">Check In: </label>
                        <asp:Label ID="lblCheckInDate" runat="server" class="form-control input-md"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <label for="lblBookingFromDate">Check Out: </label>
                        <asp:Label ID="lblCheckOutDate" runat="server" class="form-control input-md"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <label for="lblStayedDays">Stayed Days: </label>
                        <asp:Label ID="lblStayedDays" runat="server" class="form-control input-md"></asp:Label>
                    </div>
                </div>
                <div class="row"><div lass="col-md-12">&nbsp;</div></div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false"
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                            CssClass="table table-striped table-bordered table-condensed table-hover">
                            <Columns>
                                <asp:BoundField DataField="ServiceType" HeaderText="Service Type" />
                                <asp:BoundField DataField="Total_Before_Discount" HeaderText="Cost" />
                                <asp:BoundField DataField="DiscountOffered" HeaderText="DiscountOffered" />
                                <asp:BoundField DataField="Cost_After_Discount" HeaderText="Invoice Amount" />
                                <asp:BoundField DataField="AmountReceived" HeaderText="Received" />
                                <asp:BoundField DataField="PendingAmount" HeaderText="Pending" />
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
                <div class="row"><div lass="col-md-12">&nbsp;</div></div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label for="lblPendingPayment">Pending Payment</label>
                        <div class="input-group">
                            <span class="input-group-addon">KD</span>
                            <asp:Label ID="lblPendingPayment" runat="server" class="form-control input input-md" aria-label="..."></asp:Label>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label for="txtCheckOutDate">Check Out Date</label>
                        <span class="input-group">
                            <asp:TextBox ID="txtCheckOutDate" runat="server" class="form-control input-md" placeholder="mm/dd/yyyy" disabled></asp:TextBox>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                        </span>
                        <%-- <asp:RequiredFieldValidator ID="reqTxtCheckOutDate" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtCheckOutDate" Display="Static">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regTxtCheckOutDate" runat="server" ErrorMessage="In correct Date Format" ControlToValidate="txtCheckOutDate" Display="Static" ForeColor="Red"
                            ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>--%>
                    </div>
                    <div class="col-md-2">
                        <label for="drpPaymentModes">Payment Mode</label>
                        <asp:DropDownList ID="drpPaymentModes" runat="server" class="form-control input input-md"></asp:DropDownList>
                    </div>
                    <div class="col-md-5">&nbsp;</div>
                </div>
                <div class="row"><div lass="col-md-12">&nbsp;</div></div>
                 <div class="row">
                    <div class="col-md-6">
                        <label for="txtRemarks">Remarks</label>
                        <asp:TextBox ID="txtComments" runat="server" Rows="5" class="form-control input-md" TextMode="MultiLine"></asp:TextBox>
                    </div>
                     <div class="col-md-6">&nbsp;</div>
                </div>
                <div class="row"><div lass="col-md-12">&nbsp;</div></div>
                <div class="row">
                    <div class="col-md-3">
                            <asp:Button ID="btnCheckOut" runat="server" Text="Settle & Check Out" class="btn btn-md btn-primary" OnClick="btnCheckOut_Click" />
                            &nbsp;
                            <asp:Button ID="btnClose" runat="Server" Text="Close" OnClientClick="RefreshParent();" class="btn  btn-default btn-sm" />
                        <asp:HiddenField ID="hidReservationId" runat="server" />
                        <asp:HiddenField ID="hidCheckOutId" runat="server" />
                    </div>
                    <div class="col-md-9">&nbsp;</div>
                </div>
            </fieldset>
            </div>
        </div>
</asp:Content>

