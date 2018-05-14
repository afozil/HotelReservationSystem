<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_CheckIn_bk, App_Web_dcln124p" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
        <script>
        $(function () {
            $("#MainContent_txtCheckInDate").datepicker();
        });
        function RefreshParent() {
            window.opener.document.getElementById('MainContent_hidReservationId').value = document.getElementById('MainContent_hidReservationId').value;
            window.opener.document.getElementById('MainContent_btnHidden').click();
            window.close();
        }
        
  </script>



    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>
                    <h1>Check In</h1>
                </legend>
                <div class="row">
                    <div class="col-md-4">
                        <label for="drpBookings">Select Booking Number</label>
                        <asp:DropDownList ID="drpBookings" runat="server" class="form-control input input-md" OnSelectedIndexChanged="drpBookings_SelectedIndexChanged" AutoPostBack="true" CausesValidation="false"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">&nbsp;</div>
                    <div class="col-md-4">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <label for="lblFromDate">Booking From</label>
                        <span class="input-group">
                            <asp:Label ID="lblFromDate" runat="server" class="form-control input-md"></asp:Label>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                        </span>
                    </div>
                    <div class="col-md-2">
                        <label for="lblToDate">Booking To</label>
                        <span class="input-group">
                            <asp:Label ID="lblToDate" runat="server" class="form-control input-md"></asp:Label>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                        </span>
                    </div>
                    <div class="col-md-2">
                        <label for="txtCheckInDate">Check In Date</label>
                        <span class="input-group">
                            <asp:TextBox ID="txtCheckInDate" runat="server" class="form-control input-md" placeholder="mm/dd/yyyy"></asp:TextBox>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                        </span>
                        <asp:RequiredFieldValidator ID="reqTxtCheckInDate" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtCheckInDate" Display="Static">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regTxtCheckInDate" runat="server" ErrorMessage="In correct Date Format" ControlToValidate="txtCheckInDate" Display="Static" ForeColor="Red"
                            ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-2">
                        &nbsp;
                    </div>
                    <div class="col-md-4">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label for="lblRoomType">Room Type</label>
                        <asp:Label ID="lblRoomType" runat="server" class="form-control input input-md"></asp:Label>
                        <!-- 
                <label for="lblSalesPerson">Sales Person</label>
                 <asp:Label ID="lblSalesPerson" runat="server" class="form-control"></asp:Label>
             -->
                    </div>
                    <div class="col-md-4">
                        <label for="drpRoomsList">Assign Room </label>
                        <asp:DropDownList ID="drpRoomsList" runat="server" class="form-control input input-md disabled"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label for="lblRateName">Applied Rate</label>
                        <asp:Label ID="lblRateName" runat="server" class="form-control"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label for="lblRate">Amount</label>
                        <div class="input-group">
                            <span class="input-group-addon">KD</span>
                            <asp:Label ID="lblRate" runat="server" class="form-control"></asp:Label>
                        </div>
                        <!--<label for="lblSalesPersonDiscount">Sales Person Discount</label>
             <div class="input-group">
                       <span class="input-group-addon">KD</span>
                 <asp:Label ID="lblSalesPersonDiscount" runat="server" class="form-control"></asp:Label>
            </div>
             -->
                    </div>
                    <div class="col-md-4">
                        <label for="lblDiscountOffered">Discount Offered</label>
                        <div class="input-group">
                            <span class="input-group-addon">KD</span>
                            <asp:Label ID="lblDiscountOffered" runat="server" class="form-control input input-md"></asp:Label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="lblTotalAmount">Total Amount</label>
                        <div class="input-group">
                            <span class="input-group-addon">KD</span>
                            <asp:Label ID="lblTotalAmount" runat="server" class="form-control"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label for="lblPaidAmount">Amount Paid</label>
                        <div class="input-group">
                            <span class="input-group-addon">KD</span>
                            <asp:Label ID="lblPaidAmount" runat="server" class="form-control input input-md"></asp:Label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="lblBookingStatus">Current Booking Status</label>
                        <asp:Label ID="lblBookingStatus" runat="server" class="form-control input input-md"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <label for="lblPaymentMode">Last Payment Mode</label>
                        <asp:Label ID="lblPaymentMode" runat="server" class="form-control input input-md"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label for="txtPendingAmount">Pending/Settlement Amount</label>
                        <div class="input-group">
                            <span class="input-group-addon">KD</span>
                            <asp:TextBox ID="txtPendingAmount" runat="server" class="form-control input input-md"></asp:TextBox>
                        </div>
                        <asp:CompareValidator ID="cmpPendingAmount" runat="server" ControlToValidate="txtPendingAmount" Operator="DataTypeCheck"
                            Type="Currency" Display="Static" ErrorMessage="Illegal format" ForeColor="red" />
                    </div>
                    <div class="col-md-4">
                        <label for="drpPendingPaymentMode">Settle Pending Payments In</label>
                        <asp:DropDownList ID="drpPendingPaymentMode" runat="server" class="form-control input input-md"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="chkPaid" runat="server" Text="Has Customer Settled Pending?" class="input input-md" />
                            </label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="forms-control">
                            <asp:Button ID="btnCheckIn" runat="server" Text="Check In" class="btn btn-md btn-primary" OnClick="btnCheckIn_Click" />
                            &nbsp;
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-md" OnClick="btnCancel_Click" CausesValidation="false" />
                           
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Label ID="lblStatus" runat="server"></asp:Label>
                        <asp:HiddenField ID="hidPendingPayment" runat="server" />
                        
                    </div>
                </div>
        </div>
    </div>
</asp:Content>

