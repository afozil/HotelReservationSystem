<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BillsServices.aspx.cs" Inherits="Configuration_BillsServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
       <div class="row"><div class="col-md-12">
    <fieldset><legend>Bills & Services</legend>

           <div class="row"> <div class="col-md-12">&nbsp;</div></div>
           <div class="row">
               <div class="col-md-12">
                   <a class="btn btn-primary" role="button" href="AddEditBillsServices.aspx">
                       <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                       Add Bills & Services
                   </a>
               </div>
           </div>
        <div class="row"> <div class="col-md-12">&nbsp;</div></div>
        <div class="row"> <div class="col-md-12">
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
                          </div></div>
      <div class="row">
          <div class="col-md-12">
              <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" DataKeyNames="BillsServices_ID"
                  AllowPaging="True" AllowSorting="True" OnPageIndexChanging="OnPageIndexChanging" OnSorting="grid_Sorting" 
                  OnRowDeleting="grid_RowDeleting" OnRowCommand="grid_RowCommand" OnRowDataBound="grid_RowDataBound"
                  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                  CssClass="table table-striped table-bordered table-condensed table-hover">
                  <Columns>
                      <asp:BoundField DataField="BillsServices_ID" HeaderText="Amenities ID" Visible="false" />
                      <asp:BoundField DataField="Name" HeaderText="AmenitiesName" SortExpression="Name"/>
                      <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"/>
                      <asp:BoundField DataField="Quantity" HeaderText="Units" />
                      <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price"/>
                      <asp:HyperLinkField DataNavigateUrlFields="BillsServices_ID" HeaderText="Edit" ItemStyle-Width="80" DataNavigateUrlFormatString="AddEditBillsServices.aspx?BillsServices_ID={0}"
                          Text="&lt;img src='../Images/icon-edit.gif' alt='Edit' border='0'/&gt;" ItemStyle-HorizontalAlign="Center" />
                      <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                          <ItemTemplate>
                              <asp:LinkButton ID="lnkDelete"
                                  CommandArgument='<%# Eval("BillsServices_ID") %>'
                                  CommandName="Delete" runat="server" Text="&lt;img src='../Images/icon-delete.gif' alt='Delete' border='0'/&gt;" ToolTip="Delete Bills & Service">
                              </asp:LinkButton>
                          </ItemTemplate>
                      </asp:TemplateField>
                  </Columns>
                  <FooterStyle BackColor="White" ForeColor="#000066" />
                  <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="Black" />
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

