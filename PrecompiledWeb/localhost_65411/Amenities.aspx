<%@ page title="Amenities" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Admin_Amenities, App_Web_m42e11xx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="row"><div class="col-md-12">
    <fieldset><legend>Amenities</legend>

           <div class="row"> <div class="col-md-12"><hr /></div></div>
           <div class="row">
               <div class="col-md-12">
                   <a class="btn btn-primary" role="button" href="AddEditAmenities.aspx">
                       <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                       Add Amenities
                   </a>
               </div>
           </div>
        <br /><br />
      <div class="row">
          <div class="col-md-12">
        <asp:GridView ID="grid" runat="server"  AutoGenerateColumns="false" DataKeyNames="AmenitiesID"  
             BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
            CssClass="table table-striped table-bordered table-condensed table-hover">

            <Columns>
                <asp:BoundField DataField="AmenitiesID" HeaderText="Amenities ID"  />
                <asp:BoundField DataField="AmenitiesName" HeaderText="AmenitiesName"  />
                <asp:BoundField DataField="Description" HeaderText="Description"  />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity"  />
                <asp:BoundField DataField="Price" HeaderText="Price"  />
                <asp:BoundField DataField="CreatedUser" HeaderText="Created User"  />
                
                
                  <asp:HyperLinkField DataNavigateUrlFields="AmenitiesID" HeaderText="Edit"  ItemStyle-Width="80" DataNavigateUrlFormatString="AddEditAmenities.aspx?AmenitiesID={0}" 
                Text="Edit" ItemStyle-HorizontalAlign="Center" />

            </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="Black" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <EmptyDataRowStyle  BackColor="#006699"  Font-Bold="True" ForeColor="White"  />
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

