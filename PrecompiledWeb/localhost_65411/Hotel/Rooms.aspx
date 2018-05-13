<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_Rooms, App_Web_bjt2a1g0" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="row">
               <div class="col-md-12">
    <fieldset><legend>Search</legend>
        <div class="row">
            <div class="col-md-4">
                   <label for="drpRoomType">Room Type</label>
                  <asp:DropDownList ID="drpRoomType" runat="server" class="form-control input-sm"></asp:DropDownList> 
            </div>
            <div class="col-md-4">
                   <label for="drpRoomStatus">Room Status</label>
                  <asp:DropDownList ID="drpRoomStatus" runat="server" class="form-control input-sm"></asp:DropDownList>    
            </div>
            <div class="col-md-4">
                 <label for="drpProperty">Property</label>
                 <asp:DropDownList ID="drpProperty" runat="server" class="form-control input-sm"></asp:DropDownList> 
            </div>
        </div>
        <div class="row"> <div class="col-md-12"><hr /></div></div>
           <div class="row">
               <div class="col-md-12">
                   <a class="btn btn-primary" role="button" href="AddEditRooms.aspx">
                       <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                       Add Rooms
                   </a>
               </div>
           </div>
    </fieldset>
    </div></div>
    <div class="row"><div class="col-md-12">
    <fieldset><legend>Rooms</legend>
      <div class="row">
          <div class="col-md-12">
        <asp:GridView ID="grid" runat="server"  AutoGenerateColumns="false" DataKeyNames="Room_ID, RoomStatus_ID"  OnRowDeleting="grid_RowDeleting" 
             BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
            >

            <Columns>
                <asp:BoundField DataField="Room_ID" HeaderText="Room ID"  />
                <asp:BoundField DataField="RoomNumber" HeaderText="Room Number"  />
                <asp:BoundField DataField="RoomName_EN" HeaderText="RoomName EN"  />
                <asp:BoundField DataField="RoomName_AR" HeaderText="RoomName AR"  />
                <asp:BoundField DataField="Description" HeaderText="Description"  /> 
                <asp:BoundField DataField="RoomType_ID" HeaderText="RoomType ID"  />
                 <asp:BoundField DataField="Property_ID" HeaderText="Property ID"  />
                <asp:BoundField DataField="RoomStatus_ID" HeaderText="Status ID"  />
                
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="false" ShowHeader="false" /> 
                  <asp:HyperLinkField DataNavigateUrlFields="Room_ID" HeaderText="Edit"  ItemStyle-Width="80" DataNavigateUrlFormatString="AddEditRooms.aspx?Room_ID={0}" 
                Text="Edit" ItemStyle-HorizontalAlign="Center" />

            </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
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

