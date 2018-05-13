<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_RoomStatus, App_Web_bjt2a1g0" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <h1>Room Status</h1>

    </div>

    <div>
        <asp:GridView ID="grid" runat="server"  AutoGenerateColumns="false" DataKeyNames="RoomStatus_ID"  OnRowDeleting="grid_RowDeleting" 
             BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3"
            >

            <Columns>
                <asp:BoundField DataField="RoomStatus_ID" HeaderText="RoomStatus ID"  />
                <asp:BoundField DataField="RoomStatus_EN" HeaderText="RoomStatus EN"  />
                <asp:BoundField DataField="RoomStatus_AR" HeaderText="RoomStatus AR"  />
                <asp:BoundField DataField="Description" HeaderText="Description"  /> 
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" /> 
                  <asp:HyperLinkField DataNavigateUrlFields="RoomStatus_ID" HeaderText="Edit"  ItemStyle-Width="80" DataNavigateUrlFormatString="AddEditRoomStatus.aspx?RoomStatus_ID={0}" 
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
</asp:Content>

