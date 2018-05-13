<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GuestsList.aspx.cs" Inherits="Hotel_GuestsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
               <div class="col-md-12">
    <fieldset><legend>Search
              </legend>
        <div class="row">
            <div class="col-md-2">
                <label for="drpSrchCriteria">Filter By</label>
                <asp:DropDownList ID="drpSrchCriteria" runat="server" class="form-control input input-md">
                    <asp:ListItem text="First Name" Value="1"></asp:ListItem>
                    <asp:ListItem text="Mobile Number" Value="2"></asp:ListItem>
                    <asp:ListItem text="Civil ID" Value="3"></asp:ListItem>
                </asp:DropDownList>
                 </div>
            <div class="col-md-3">
                     <label for="txtSrchValue">Criteria</label>
                    <asp:TextBox ID="txtSrchValue" runat="server"  class=" form-control input-md"></asp:TextBox>
            </div>
             <div class="col-md-7">
                     <label for="btnSrchGuest"></label><br />
                        <asp:Button ID="btnSrchGuest" runat="server" Text="Search" class="btn btn-primary btn-md" OnClick="btnSrchGuest_Click" />
                &nbsp;
                    <asp:Button ID="btnReset" runat="server" Text="Clear" class="btn btn-default btn-md" OnClick="btnReset_Click" />
                 
            </div>
       </div>
            <div class="row">
            <div class="col-md-6">
                
            </div>
            <div class="col-md-6">
               &nbsp;
            </div>
        </div>
        <div class="row"> <div class="col-md-12"><hr /></div></div>
           <div class="row">
               <div class="col-md-12">
                   <a class="btn btn-primary" role="button" href="AddEditGuest.aspx">
                       <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                       Add Guest
                   </a>
               </div>
           </div>
    </fieldset>
    </div></div>
    <div class="row"><div class="col-md-12">
    <fieldset><legend>Guests</legend>
         <div class="row"> <div class="col-md-12"> <asp:Label ID="lblMsg" runat="server"></asp:Label></div></div>
      <div class="row">
          <div class="col-md-12">
              <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" DataKeyNames="Guest_ID" 
                  AllowPaging="True" AllowSorting="True" OnPageIndexChanging="OnPageIndexChanging" OnSorting="grid_Sorting"
                  OnRowDeleting="grid_RowDeleting" OnRowCommand="grid_RowCommand" OnRowDataBound="grid_RowDataBound"
                  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                  CssClass="table table-striped table-bordered table-condensed table-hover">
                  <Columns>
                      <asp:BoundField DataField="Guest_ID" HeaderText="Guest_ID" Visible="false" />
                      <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                      <asp:BoundField DataField="MiddleName" HeaderText="Middle Name" />
                      <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                      <asp:BoundField DataField="Civil_ID" HeaderText="Civil ID" SortExpression="Civil_ID"/>
                      <asp:BoundField DataField="MobileNumber" HeaderText="Mobile" SortExpression="MobileNumber" />
                      <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category"/>
                      <%--<asp:BoundField DataField="IsBlacklisted" HeaderText="Is Blacklisted ?" DataFormatString="{0:N0}" /> --%>
                      <asp:BoundField DataField="CountryName_EN" HeaderText="Nationality" SortExpression="CountryName_EN"/>
                      <%--<asp:BoundField DataField="LastBookingDate" HeaderText="LastBookingDate" DataFormatString="{0:MMMM d, yyyy}" />--%>
                      <asp:HyperLinkField DataNavigateUrlFields="Guest_ID" HeaderText="Edit" ItemStyle-Width="80" DataNavigateUrlFormatString="~/Configuration/AddEditGuest.aspx?Guest_ID={0}"
                          Text="&lt;img src='../Images/icon-edit.gif' alt='Edit' border='0'/&gt;" ItemStyle-HorizontalAlign="Center" />
                      <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                          <ItemTemplate>
                              <asp:LinkButton ID="lnkDelete"
                                  CommandArgument='<%# Eval("Guest_ID") %>'
                                  CommandName="Delete" runat="server" Text="&lt;img src='../Images/icon-delete.gif' alt='Delete' border='0'/&gt;" ToolTip="Delete Guest">
                              </asp:LinkButton>
                          </ItemTemplate>
                      </asp:TemplateField>
                  </Columns>
                  <FooterStyle BackColor="White" ForeColor="#000066" />
                  <HeaderStyle BackColor="#3276b1" Font-Bold="True" ForeColor="Black" />
                  <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                  <RowStyle ForeColor="#000066" />
                  <EmptyDataRowStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                  <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                  <SortedAscendingCellStyle BackColor="#F1F1F1" />
                  <SortedAscendingHeaderStyle BackColor="#007DBB" />
                  <SortedDescendingCellStyle BackColor="#CAC9C9" />
                  <SortedDescendingHeaderStyle BackColor="#00547E" />
              </asp:GridView>
          </div>
    </div>
   </fieldset>
</div>
       </div>
</asp:Content>

