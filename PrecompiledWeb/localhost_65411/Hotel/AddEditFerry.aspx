<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_AddEditFerry, App_Web_0t3h1jy2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="row">
                <div class="col-md-12">
                    <fieldset>
                        <legend>
                            <h1>Add/Edit Ferry</h1>
                        </legend>
                    </fieldset>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <label for="txtFerryNameEn">Ferry Name - English</label>
                    <asp:TextBox ID="txtFerryNameEn" runat="server" Class="input-md form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqFerryNameEn" runat="server" ErrorMessage="Required" ControlToValidate="txtFerryNameEn" Display="Static" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
                <div class="col-md-8">
                </div>
            </div>
            <div class="row"> <div class="col-md-12">&nbsp;</div></div>
            <div class="row">
                <div class="col-md-4">
                    <label for="txtProNameAr">Ferry Name - Arabic</label>
                    <asp:TextBox ID="txtFerryNameAr" runat="server" Class="input-md form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="reqFerryNameAr" runat="server" ErrorMessage="Required" ControlToValidate="txtFerryNameAr" Display="Static" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
                <div class="col-md-8">
                </div>
            </div>
            <div class="row"> <div class="col-md-12">&nbsp;</div></div>
            <div class="row">
                <div class="col-md-4">
                    <label for="txtCostForAdults">Cost for Adults</label>
                    <div class="input-group">
                        <span class="input-group-addon">KD</span>
                        <asp:TextBox ID="txtCostForAdults" runat="server" class="input-md form-control" aria-label="Amount (to the nearest dollar)"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="reqCostForAdults" runat="server" ErrorMessage="Required" ControlToValidate="txtCostForAdults" Display="Static" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
                <div class="col-md-8">
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">&nbsp;</div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <label for="txtCostForKids">Cost for Kids</label>
                    <div class="input-group">
                        <span class="input-group-addon">KD</span>
                        <asp:TextBox ID="txtCostForKids" runat="server" class="input-md form-control" aria-label="Amount (to the nearest dollar)"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="reqCostForKids" runat="server" ErrorMessage="Required" ControlToValidate="txtCostForKids" Display="Static" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
                <div class="col-md-8">
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">&nbsp;</div>
            </div>

            <div class="row">
                <div class="col-md-2">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-md" OnClick="btnCancel_Click" />
                        &nbsp;
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-md" OnClick="btnSave_Click" />
                </div>
                <div class="col-md-8">&nbsp;
                </div>
            </div>
            <asp:HiddenField ID="hidFerryID" runat="server" />
            <div>
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

