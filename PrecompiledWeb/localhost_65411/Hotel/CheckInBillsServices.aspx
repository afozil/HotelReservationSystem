<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_CheckInBillsServices, App_Web_oqs1aph5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
         <script type="text/javascript">
             var specialKeys = new Array();
             specialKeys.push(8); //Backspace
             function IsNumeric(e) {
                 var keyCode = e.which ? e.which : e.keyCode
                 var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
                 // document.getElementById("error").style.display = ret ? "none" : "inline";
                 return ret;
             }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="failaka">
                <div class="row">
                    <div class="col-md-12">
                        <fieldset>
                            <legend>
                                <h1>Add Bills & Services</h1>
                            </legend>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="failaka">

                <div class="row">
                    <div class="col-md-3">
                        <label for="drpSalutation">Room</label>
                        <asp:DropDownList ID="drpCheckIn" runat="server" class="form-control input-md" AutoPostBack="True" OnSelectedIndexChanged="drpCheckIn_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                     <div class="col-md-3">
                        <label for="drpSalutation">Bills & Services</label>
                        <asp:DropDownList ID="drpBillServices" runat="server" class="form-control input-md" AutoPostBack="True" OnSelectedIndexChanged="drpBillServices_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                   <div class="col-md-12">&nbsp;</div>
                </div>
                    <div class="row">
                        <div class="col-md-3">
                            <label for="txtInvoice">Invoice / Coupon / Cheque Number</label>
                            <asp:TextBox ID="txtInvoice" runat="server" Class="form-control input-md"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqTxtInvoice" runat="server" ErrorMessage="Required" ControlToValidate="txtInvoice" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-3">
                        <label for="lblPrice">Cost</label>
                        <div class="input-group">
                            <span class="input-group-addon">KD</span>
                            <asp:Label ID="lblPrice" runat="server" Class="form-control input-md"></asp:Label>
                        </div>
                    </div>
                    </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                    <div class="row">
                        <div class="col-md-3">
                            <label for="txtQuantiry">Quantity</label>
                            <asp:TextBox ID="txtQuantity" runat="server" MaxLength="3" Class="form-control input-md" AutoPostBack="True" OnTextChanged="txtQuantity_TextChanged" onkeypress="return IsNumeric(event);"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqTxtQuantity" runat="server" ErrorMessage="Required" ControlToValidate="txtQuantity" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-3">
                            <label for="txtPrice">Total Cost</label>
                            <div class="input-group"><span class="input-group-addon">KD</span>
                            <asp:Label ID="txtPrice" runat="server" Class="form-control input-md"></asp:Label>
                        </div>
                            </div>
                    </div>
                    <div class="row">
                         <div class="col-md-12">&nbsp;</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <label for="txtDiscount">Discount</label>
                             <div class="input-group">
                            <span class="input-group-addon">KD</span>
                            <asp:TextBox ID="txtDiscount" runat="server" Class="form-control input-md" AutoPostBack="true" CausesValidation="false" OnTextChanged="txtDiscount_TextChanged"></asp:TextBox>
                        </div>
                             </div>
                        <div class="col-md-3">
                            <label for="lblAfterDiscount">After Discount</label>
                            <div class="input-group">
                            <span class="input-group-addon">KD</span>
                            <asp:Label ID="lblAfterDiscount" runat="server" Class="form-control input-md"></asp:Label>
                            </div>
                        </div>
                    </div>
                <div class="row">
                         <div class="col-md-12">&nbsp;</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <label for="txtAmountReceived">Amount Received</label>
                            <div class="input-group">
                            <span class="input-group-addon">KD</span>
                            <asp:TextBox ID="txtAmountReceived" runat="server" Class="form-control input-md"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label for="drpPaymentModes">Payment Mode</label>
                            <asp:DropDownList ID="drpPaymentModes" runat="server" class="form-control input input-md"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">&nbsp;</div>
                    </div>
                                      <asp:HiddenField ID="hidCheckInID" runat="server" />
                    <div class="row">
                        <div class="col-md-12">&nbsp;</div>
                    </div>
                    <div>
                        <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
      <div class="row">
                        <div class="col-md-4">
                            <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-md" OnClick="btnSave_Click" />
                            &nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-md" OnClick="btnCancel_Click" CausesValidation="false" />
                        </div>
                        <div class="col-md-8">
                        </div>
                    </div>


</asp:Content>

