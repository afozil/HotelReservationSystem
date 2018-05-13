<%@ page title="Employee Discount" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Admin_AddEditEmployeeDiscount, App_Web_p5sxnoyk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>Add/Edit Employee Discount</legend>
                <asp:HiddenField ID="txtdiscountID" runat="server" />
                <div class="row">
                    <div class="col-md-4">
                        <label for="CboUser">User Name</label>
                        <asp:DropDownList ID="CboUser" runat="server" class="form-control input-md">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-8">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-1">
                        <label for="txtDiscount">Discount</label>
                        <div class="input-group">
                            <span class="input-group-addon">%</span>
                            <asp:TextBox ID="txtDiscount" runat="server" Width="70px" class="input-md form-control" aria-label="Discount in Percentage "></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label for="CboUnit">Discount Unit</label>

                        <asp:DropDownList ID="CboUnit" runat="server" class="form-control input-md">
                            <asp:ListItem Text="Percentage" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-8">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <label for="cboStatus">Status</label>

                        <asp:DropDownList ID="cboStatus" runat="server" class="form-control input-md">
                            <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Deactivate" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-8">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-md" OnClick="btnSave_Click" />
                        &nbsp;
             <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-md" OnClick="btnCancel_Click" />
                    </div>

                    <div class="col-md-8">
                    </div>
                </div>
                <div>
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </div>
            </fieldset>
        </div>
    </div>
</asp:Content>

