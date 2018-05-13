<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="Admin_CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div class="row">
     <div class="col-md-12">
       <fieldset>
           <legend><h1>Create/Edit Users</h1></legend>
        
           <div class="row">
            <div class="col-md-3">
             <label for="txtFirstName">User Name</label>
              <asp:label ID="lblUserName" runat="server" class="form-control"></asp:label>
          </div>
           </div>

            <div class="row"><div class="col-md-12">&nbsp;</div></div>

         <div class="row">
       
         <div class="col-md-3">
             <label for="txtFirstName">First Name</label>
             <asp:TextBox ID="txtFirstName" runat="server" Class="form-control input input-md"></asp:TextBox>
             <asp:RequiredFieldValidator ID="reqtxtFirstName" runat="server" ErrorMessage="*" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
          </div>
          <div class="col-md-3">
             <label for="txtMiddleName">Middle Name</label>
             <asp:TextBox ID="txtMiddleName" runat="server" Class="form-control"></asp:TextBox>
          </div>
          <div class="col-md-3">
             <label for="txtLastName">Last Name</label>
             <asp:TextBox ID="txtLastName" runat="server" Class="form-control"></asp:TextBox>
              <asp:RequiredFieldValidator ID="reqtxtLastName" runat="server" ErrorMessage="*" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
          </div>
    </div>
           
            <div class="row"><div class="col-md-12">&nbsp;</div></div>
          

     <div class="row">
        <div class="col-md-12">
            <div class="forms-control">
                <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-md btn-primary" OnClick="btnSave_Click" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-md"  CausesValidation="false"/>
            </div> 
        </div>
     </div>
   


           </fieldset>
         </div>
        </div>
</asp:Content>

