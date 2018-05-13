<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_AddEditGuest, App_Web_0t3h1jy2" %>

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
                      <asp:ListItem Text="Mr." Value="1" Selected></asp:ListItem>
                      <asp:ListItem Text="Mrs." Value="2"></asp:ListItem>
                      <asp:ListItem Text="Ms." Value="3"></asp:ListItem>
                      <asp:ListItem Text="Dr." Value="4"></asp:ListItem>
                  </asp:DropDownList>
          </div>
         <div class="col-md-3">
             <label for="txtFirstName">First Name</label>
             <asp:TextBox ID="txtFirstName" runat="server" Class="form-control"></asp:TextBox>
          </div>
          <div class="col-md-3">
             <label for="txtMiddleName">Middle Name</label>
             <asp:TextBox ID="txtMiddleName" runat="server" Class="form-control"></asp:TextBox>
          </div>
          <div class="col-md-3">
             <label for="txtLastName">Last Name</label>
             <asp:TextBox ID="txtLastName" runat="server" Class="form-control"></asp:TextBox>
          </div>
    </div>
     <div class="row"><div class="col-md-12">&nbsp;</div></div>
    <div class="row">
         <div class="col-md-3">
             <label for="drpGender">Gender</label>
             <asp:DropDownList ID="drpGender" runat="server" class="form-control input-md">
                      <asp:ListItem Text="Male" Value="1" Selected></asp:ListItem>
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
                      <asp:ListItem Text="Normal" Value="4" Selected></asp:ListItem>
                      <asp:ListItem Text="VIP" Value="5"></asp:ListItem>
                      <asp:ListItem Text="VVIP" Value="6"></asp:ListItem>
             </asp:DropDownList>
         </div>
    </div>
     <div class="row"><div class="col-md-12">&nbsp;</div></div>
     <div class="row">
         <div class="col-md-3">
             <label for="txtCivilId">Civil ID</label>
             <asp:TextBox ID="txtCivilId" runat="server" Class="form-control input-md"></asp:TextBox>
          </div>
         <div class="col-md-3">
             <label for="txtPassportNumber">Passport Number</label>
             <asp:TextBox ID="txtPassportNumber" runat="server" Class="form-control input-md"></asp:TextBox>
          </div>
         <div class="col-md-3">
             <label for="txtMobileNumber">Mobile Number</label>
             <asp:TextBox ID="txtMobileNumber" runat="server" Class="form-control input-md" MaxLength="12"></asp:TextBox>
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
                      <asp:ListItem Text="False" Value="0" Selected></asp:ListItem>
                      <asp:ListItem Text="True" Value="1"></asp:ListItem>
             </asp:DropDownList>
          </div>
         <div class="col-md-9">
             <label for="txtPreferrences">Preferrences</label>
             <asp:TextBox ID="txtPreferrences" runat="server" TextMode="MultiLine" class="form-control input-md"></asp:TextBox>
          </div>
    </div>
     <div class="row"><div class="col-md-12">&nbsp;</div></div>
     <div class="row">
         <div class="col-md-4">
             <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-sm" OnClick="btnSave_Click" />
            &nbsp;
             <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-sm" OnClick="btnCancel_Click" />
           
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

