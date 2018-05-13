<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddEditGuest.aspx.cs" Inherits="Hotel_AddEditGuest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script>
          $(function() {
              $("#MainContent_txtDOB").datepicker();
          });

  </script>
 <div class="row">
     <div class="col-md-12">
       <fieldset>
           <legend><h1>Add/Edit Guest</h1></legend>
        
     <div class="row">
         <div class="col-md-3">
             <label for="drpSalutation">Salutation</label>
                  <asp:DropDownList ID="drpSalutation" runat="server" class="form-control input-md">
                      <asp:ListItem Text="Mr." Value="1"></asp:ListItem>
                      <asp:ListItem Text="Mrs." Value="2"></asp:ListItem>
                      <asp:ListItem Text="Ms." Value="3"></asp:ListItem>
                      <asp:ListItem Text="Dr." Value="4"></asp:ListItem>
                  </asp:DropDownList>
          </div>
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
         <div class="col-md-3">
             <label for="drpGender">Gender</label>
             <asp:DropDownList ID="drpGender" runat="server" class="form-control input-md">
                      <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                      <asp:ListItem Text="Female" Value="2"></asp:ListItem>
             </asp:DropDownList>
          </div>
         <div class="col-md-3">
                   <label for="txtDOB">Date of Birth</label>
                   <div class="input-group">
                        <asp:TextBox ID="txtDOB" runat="server" class="form-control input-md"></asp:TextBox>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                    </div>
          </div>
         <div class="col-md-3">
             <label for="drpNationality">Nationality</label>
             <asp:DropDownList ID="drpNationality" runat="server" class="form-control input-md"></asp:DropDownList>
         </div>
         <div class="col-md-3">
             <label for="drpCategory">Category</label>
             <asp:DropDownList ID="drpCategory" runat="server" class="form-control input-md">
             </asp:DropDownList>
         </div>
    </div>
     <div class="row"><div class="col-md-12">&nbsp;</div></div>
     <div class="row">
         <div class="col-md-3">
             <label for="txtCivilId">Civil ID</label>
             <asp:TextBox ID="txtCivilId" runat="server" Class="form-control input-md" MaxLength="12"></asp:TextBox>
             <asp:RequiredFieldValidator ID="reqCivilId" runat="server" ErrorMessage="*" ControlToValidate="txtCivilId"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator id="regCivilId" 
                 ControlToValidate="txtCivilId"
                 ValidationExpression="^[0-9]{12,12}$"
                 ForeColor="red"
                 ErrorMessage="Must be a Number. Length 12"
                 runat="server"></asp:RegularExpressionValidator>
          </div>
         <div class="col-md-3">
             <label for="txtPassportNumber">Passport Number</label>
             <asp:TextBox ID="txtPassportNumber" runat="server" Class="form-control input-md"></asp:TextBox>
          </div>
         <div class="col-md-3">
             <label for="txtMobileNumber">Mobile Number</label>
             <asp:TextBox ID="txtMobileNumber" runat="server" Class="form-control input-md" MaxLength="8"></asp:TextBox>
             <asp:RequiredFieldValidator ID="reqMobileNumber" runat="server" ErrorMessage="*" ControlToValidate="txtMobileNumber"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator id="regMobileNumber" 
                 ControlToValidate="txtMobileNumber" ForeColor="red"
                 runat="server" ErrorMessage="Must be a Number. Length 8"    
                 ValidationExpression="^[0-9]{8,8}$" />
          </div>
         <div class="col-md-3">
             <label for="txtEmail">Email</label>
             <asp:TextBox ID="txtEmail" runat="server" Class="form-control input-md"></asp:TextBox>
          </div>
    </div>
     <div class="row"><div class="col-md-12">&nbsp;</div></div>
    <div class="row">
         <div class="col-md-3">
             <label for="drpIsBlackListed">Is Blacklisted ?</label>
             <asp:DropDownList ID="drpIsBlackListed" runat="server" class="form-control input-md">
                      <asp:ListItem Text="False" Value="0"></asp:ListItem>
                      <asp:ListItem Text="True" Value="1"></asp:ListItem>
             </asp:DropDownList>
          </div>
         <div class="col-md-9">
             <label for="txtPreferrences">Preferrences</label>
             <asp:TextBox ID="txtPreferrences" runat="server" TextMode="MultiLine" class="form-control input-md" Rows="5"></asp:TextBox>
          </div>
    </div>
     <div class="row"><div class="col-md-12">&nbsp;</div></div>
     <div class="row">
         <div class="col-md-4">
             <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-sm" OnClick="btnSave_Click" />
             
            &nbsp;
             <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-sm" OnClick="btnCancel_Click" CausesValidation="false" />

         </div>
         <div class="col-md-8">
          </div>
    </div>
    <asp:HiddenField ID="hidGuestId" runat="server" />
    
    <div>
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </div>
           </fieldset>
    </div>
     </div>
</asp:Content>

