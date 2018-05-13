<%@ page title="Add Roles" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Admin_AddRole, App_Web_4avaej1g" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
    <div class="col-md-12">
        <fieldset>
            <legend> <h1>Add Role</h1></legend>
        </fieldset>
    </div>

          <div class="row">
         <div class="col-md-4">
             <label for="txtUserName">Role Name</label>
             <asp:TextBox ID="txtRoleName" runat="server" Class="form-control"></asp:TextBox>
          </div>
         <div class="col-md-8">
          </div>
     </div>       

         <div class="row">
         <div class="col-md-2">
             <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-sm" OnClick="btnSave_Click" />
          </div>
       
         <div class="col-md-8">
          </div>
    </div>

         <div class="alert-info">

        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </div>
      <div class="alert-info">

        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </div>

        </div>
</asp:Content>

