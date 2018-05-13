<%@ Page Title="Manage User" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageUser.aspx.cs" Inherits="Configuration_ManageUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="panel panel-default">
        <div class="panel-heading"><h1> User : <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label></h1></div>
        <div class="panel-body">
          

             <div class="row">
        <div class="col-md-4">
            <div class="forms-control">
                <asp:Button ID="btnEdit" runat="server" Text="Edit User Details" class="btn btn-md btn-primary" OnClick="btnEdit_Click"  />
               
            </div> 
        </div>
          <div class="col-md-3">
             <label for="chkLockout">Lockout</label>
              <asp:CheckBox ID="chkLockout" runat="server" AutoPostBack="true" OnCheckedChanged="chkLockout_CheckedChanged" />
          </div>


     </div>


    <div>
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

    </div>
            <hr />
    <div class="row">
        <div class="col-md-12">
            <section id="passwordForm">
                <asp:PlaceHolder runat="server" ID="setPassword" Visible="true">
                   
                    <div class="form-horizontal">
                        <h4>Set Password Form</h4>
                        <hr />
                        <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" />
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="password" CssClass="col-md-2 control-label">Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="password" TextMode="Password"  CssClass="form-control"  />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                                    CssClass="text-danger" ErrorMessage="The password field is required."
                                    Display="Dynamic" ValidationGroup="SetPassword" />
                                <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                                    CssClass="text-danger" SetFocusOnError="true" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password"  CssClass="form-control"  />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required."
                                    ValidationGroup="SetPassword" />
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match."
                                    ValidationGroup="SetPassword" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button runat="server" Text="Set Password" ValidationGroup="SetPassword" OnClick="SetPassword_Click" CssClass="btn btn-default" />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>

                
            </section>
            <hr />
        </div>
    </div>

 </div>
    </div>
</asp:Content>

