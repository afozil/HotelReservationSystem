<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_AddEditRoomTypes, App_Web_p5sxnoyk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   <div class="row">
     <div class="col-md-12">
       <fieldset>
           <legend><h1>Add/Edit Room Types</h1></legend>
        </fieldset>
       </div>
    </div>
    
     <div class="row">
         <div class="col-md-4">
             <label for="txtTypeEn">Room Type</label>
             <asp:TextBox ID="txtTypeEn" runat="server" Class="form-control"></asp:TextBox>
             <asp:RequiredFieldValidator ID="reqTxtTypeEn" runat="server" ErrorMessage="Required" ForeColor="Red" Display="Static" ControlToValidate="txtTypeEn">*</asp:RequiredFieldValidator>
          </div>
         <div class="col-md-8">
          </div>
    </div>
    <div class="row"><div class="col-md-12">&nbsp;</div></div>
     <div class="row">
         <div class="col-md-6">
             <label for="txtDesc">Description</label>
             <asp:TextBox ID="txtDesc" runat="server" Class="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
             <asp:RequiredFieldValidator ID="reqTxtDesc" runat="server" ErrorMessage="Required" ForeColor="Red" Display="Static" ControlToValidate="txtDesc">*</asp:RequiredFieldValidator>
          </div>
         <div class="col-md-6">
          </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <div class="checkbox">
            <label for="chkIsOnline">Is Available Online</label>
            <asp:CheckBox ID="chkIsOnline" runat="server" />
            </div>
        </div>
        <div class="col-md-10">&nbsp;</div>
    </div>
     <div class="row"><div class="col-md-12">&nbsp;</div></div>
     <div class="row">
         <div class="col-md-6">
             <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-md" OnClick="btnSave_Click" />
          &nbsp;
             <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-md" OnClick="btnCancel_Click" CausesValidation="false" />
          </div>
         <div class="col-md-6">
          </div>
    </div>
    <asp:HiddenField ID="txtTypeID" runat="server" />
    
    <div>
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </div>

</asp:Content>

