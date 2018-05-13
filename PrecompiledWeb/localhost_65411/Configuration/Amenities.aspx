<%@ page title="Amenities" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Admin_Amenities, App_Web_z0qh3rc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="row"><div class="col-md-12">
    <fieldset><legend>Amenities</legend>

           <div class="row"> <div class="col-md-12">&nbsp;</div>
           <div class="row">
               <div class="col-md-12">
                   <a class="btn btn-primary" role="button" href="AddEditAmenities.aspx">
                       <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                       Add Amenities
                   </a>
               </div>
           </div>
               <div class="row"> <div class="col-md-12">&nbsp;</div></div>
        <div class="row"> <div class="col-md-12">
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
                          </div>
        </div>
               
      <div class="row">
          <div class="col-md-12">
              <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" DataKeyNames="AmenitiesID"
                  AllowPaging="True" AllowSorting="True" OnPageIndexChanging="OnPageIndexChanging" OnSorting="grid_Sorting"
                  OnRowDeleting="grid_RowDeleting" OnRowCommand="grid_RowCommand" OnRowDataBound="grid_RowDataBound"
                  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                  CssClass="table table-striped table-bordered table-condensed table-hover">
                  <Columns>
                      <asp:BoundField DataField="AmenitiesID" HeaderText="Amenities ID" Visible="false" />
                      <asp:BoundField DataField="AmenitiesName" HeaderText="AmenitiesName" SortExpression="AmenitiesName"/>
                      <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"/>
                      <asp:BoundField DataField="Quantity" HeaderText="Units" />
                      <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price"/>
                      <asp:HyperLinkField DataNavigateUrlFields="AmenitiesID" HeaderText="Edit" ItemStyle-Width="80" DataNavigateUrlFormatString="AddEditAmenities.aspx?AmenitiesID={0}"
                          Text="&lt;img src='../Images/icon-edit.gif' alt='Edit' border='0'/&gt;" ItemStyle-HorizontalAlign="Center" />
                      <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                          <ItemTemplate>
                              <asp:LinkButton ID="lnkDelete"
                                  CommandArgument='<%# Eval("AmenitiesID") %>'
                                  CommandName="Delete" runat="server" Text="&lt;img src='../Images/icon-delete.gif' alt='Delete' border='0'/&gt;" ToolTip="Delete Amenity">
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

