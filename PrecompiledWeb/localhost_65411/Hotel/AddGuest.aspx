<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_AddGuest, App_Web_bjt2a1g0" %>   

    
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script>
                $(function () {
                    $("#MainContent_txtDOB").datepicker();
                });
                function RefreshParent() {
                    window.opener.document.getElementById('MainContent_hidNewGuestId').value = document.getElementById('MainContent_hidGuestId').value;
                    window.opener.document.getElementById('MainContent_btnHidden').click();
                    window.close();
                }
    </script>
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>
                    <h1>Add Guest to Booking</h1>
                </legend>

                <div class="row">
                    <div class="col-md-2">
                        <label for="drpSalutation">Salutation</label>
                        <asp:DropDownList ID="drpSalutation" runat="server" class="form-control input-sm">
                            <asp:ListItem Text="Mr." Value="1"></asp:ListItem>
                            <asp:ListItem Text="Mrs." Value="2"></asp:ListItem>
                            <asp:ListItem Text="Ms." Value="3"></asp:ListItem>
                            <asp:ListItem Text="Dr." Value="4"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-2">
                        <label for="txtFirstName">First Name</label>
                        <asp:TextBox ID="txtFirstName" runat="server" Class="form-control input input-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtxtFirstName" runat="server" ErrorMessage="*" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-2">
                        <label for="txtMiddleName">Middle Name</label>
                        <asp:TextBox ID="txtMiddleName" runat="server" Class="form-control input input-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <label for="txtLastName">Last Name</label>
                        <asp:TextBox ID="txtLastName" runat="server" Class="form-control input input-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtxtLastName" runat="server" ErrorMessage="*" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-2">
                        <label for="drpCategory">Category</label>
                        <asp:DropDownList ID="drpCategory" runat="server" class="form-control input-sm">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-2">
                        <label for="drpGender">Gender</label>
                        <asp:DropDownList ID="drpGender" runat="server" class="form-control input-sm">
                            <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <label for="txtDOB">Date of Birth</label>
                        <div class="input-group">
                            <asp:TextBox ID="txtDOB" runat="server" class="form-control input-sm"></asp:TextBox>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label for="drpNationality">Nationality</label>
                        <asp:DropDownList ID="drpNationality" runat="server" class="form-control input-sm"></asp:DropDownList>
                    </div>
                    <div class="col-md-2">
                        <label for="txtCivilId">Civil ID</label>
                        <asp:TextBox ID="txtCivilId" runat="server" Class="form-control input-sm" MaxLength="12"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqCivilId" runat="server" ErrorMessage="*" ControlToValidate="txtCivilId"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regCivilId"
                            ControlToValidate="txtCivilId"
                            ValidationExpression="^[0-9]{12,12}$"
                            ForeColor="red"
                            ErrorMessage="Must be a Number. Length 12"
                            runat="server"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-2">
                        <label for="txtPassportNumber">Passport Number</label>
                        <asp:TextBox ID="txtPassportNumber" runat="server" Class="form-control input-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <label for="txtMobileNumber">Mobile Number</label>
                        <asp:TextBox ID="txtMobileNumber" runat="server" Class="form-control input-sm" MaxLength="12"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqMobileNumber" runat="server" ErrorMessage="*" ControlToValidate="txtMobileNumber"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regMobileNumber"
                            ControlToValidate="txtMobileNumber" ForeColor="red"
                            runat="server" ErrorMessage="Must be a Number. Length 8"
                            ValidationExpression="^[0-9]{8,8}$" />
                    </div>
                    <div class="col-md-3">
                        <label for="txtEmail">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" Class="form-control input-sm"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label for="drpIsBlackListed">Is Blacklisted ?</label>
                        <asp:DropDownList ID="drpIsBlackListed" runat="server" class="form-control input-sm">
                            <asp:ListItem Text="False" Value="0"></asp:ListItem>
                            <asp:ListItem Text="True" Value="1"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-9">
                        <label for="txtPreferrences">Preferrences</label>
                        <asp:TextBox ID="txtPreferrences" runat="server" TextMode="MultiLine" class="form-control input-sm" Rows="5"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-sm" OnClick="btnSave_Click" />
                        &nbsp;
                        <asp:Button ID="btnClose" runat="Server" Text="Close" OnClientClick="RefreshParent();" class="btn  btn-default btn-sm" />
                    </div>
                    <div class="col-md-8">
                        <asp:HiddenField ID="hidGuestId" runat="server" />
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</asp:Content>

