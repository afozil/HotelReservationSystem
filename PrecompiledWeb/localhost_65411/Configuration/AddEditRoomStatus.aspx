<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_AddEditRoomStatus, App_Web_z0qh3rc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
     <div class="col-md-12">
       <fieldset>
           <legend><h1>Add/Edit Room Status</h1></legend>
           <div class="row">
                <div class="col-md-4">
                    <label for="txtStatusEn">Status Type</label>
                    <asp:TextBox ID="txtStatusEn" runat="server" Class="form-control input input-md"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTxtStatusEn" runat="server" ErrorMessage="Required" ControlToValidate="txtStatusEn" Display="Static" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
               <div class="col-md-8">&nbsp; </div>
            </div>
           <div class="row"><div class="col-md-12">&nbsp;</div></div>
            <div class="row">
                <div class="col-md-6">
                    <label for="txtDesc">Description</label>
                    <asp:TextBox ID="txtDesc" runat="server" Class="form-control input input-md" TextMode="MultiLine" Rows="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqDesc" runat="server" ErrorMessage="Required" ControlToValidate="txtDesc" Display="Static" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">&nbsp; </div>
            </div>
            <div class="row"><div class="col-md-12">&nbsp;</div></div>
                <div class="row">
         <div class="col-md-4">
             <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-md" OnClick="btnSave_Click" />
         &nbsp;
             <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-default btn-md" OnClick="btnCancel_Click" CausesValidation="false" />
          </div>
         <div class="col-md-8">&nbsp; </div>
    </div>
           <div class="row">
               <div class="col-md-12">
               <asp:HiddenField ID="txtStatusId" runat="server" />
               <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
           </div>
           </div>

           </fieldset>
    </div>
</div>
</asp:Content>

