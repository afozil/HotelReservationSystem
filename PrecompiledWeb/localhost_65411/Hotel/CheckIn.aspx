<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_CheckIn, App_Web_oqs1aph5" %>

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
                    <div class="col-md-12">
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <label for="txtCheckInDate">Check In Date</label>
                        <span class="input-group">
                            <asp:TextBox ID="txtCheckInDate" runat="server" class="form-control input-md" placeholder="mm/dd/yyyy" disabled></asp:TextBox>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                        </span>
                        <%-- <asp:RequiredFieldValidator ID="reqTxtCheckInDate" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtCheckInDate" Display="Static">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regTxtCheckInDate" runat="server" ErrorMessage="In correct Date Format" ControlToValidate="txtCheckInDate" Display="Static" ForeColor="Red"
                            ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>--%>
                    </div>
                    <div class="col-md-10">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label for="txtRemarks">Remarks</label>
                        <asp:TextBox ID="txtComments" runat="server" Rows="5" class="form-control input-md" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="col-md-6">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <asp:Button ID="btnCheckIn" runat="server" Text="Check In" class="btn btn-md btn-primary" OnClick="btnCheckIn_Click" />
                        &nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel Reservation" class="btn btn-md btn-primary" OnClick="btnCancel_Click"  Visible="false"/>
                        &nbsp
                            <asp:Button ID="btnClose" runat="Server" Text="Close" OnClientClick="RefreshParent();" class="btn  btn-default btn-sm" />
                        <asp:HiddenField ID="hidReservationId" runat="server" />
                    </div>
                         <div class="col-md-2">
                        <asp:Button ID="btnPrintWelcome" runat="server" Text="Print Welcome Letter" class="btn btn-md btn-primary" Visible="false" OnClick="btnPrintWelcome_Click" />
                        &nbsp;
                        <asp:Button ID="btnPrintRegistration" runat="server" Text="Print Registration Card" class="btn btn-md btn-primary" Visible="false" OnClick="btnPrintRegistration_Click"  />
                        &nbsp
                           
                    </div>
                    <div class="col-md-8">&nbsp;</div>
                </div>
            </fieldset>
        </div>
    </div>
</asp:Content>

