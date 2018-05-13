<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_Rooms, App_Web_z0qh3rc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="row">
               <div class="col-md-12">
    <fieldset><legend>Search</legend>
        <div class="row">
            <div class="col-md-4">
                   <label for="drpRoomType">Room Type</label>
                  <asp:DropDownList ID="drpRoomType" runat="server" class="form-control input-sm" CausesValidation="false" AutoPostBack="true" OnSelectedIndexChanged="drpRoomType_SelectedIndexChanged"></asp:DropDownList> 
            </div>
            <div class="col-md-4">
                   <label for="drpRoomStatus">Room Status</label>
                  <asp:DropDownList ID="drpRoomStatus" runat="server" class="form-control input-sm" CausesValidation="false" AutoPostBack="true" OnSelectedIndexChanged="drpRoomStatus_SelectedIndexChanged"></asp:DropDownList>    
            </div>
            <div class="col-md-2">
                <br />
                <asp:Button ID="btnCancel" runat="server" Text="Reset" class="btn  btn-default btn-md" OnClick="btnCancel_Click" CausesValidation="false"/>
            </div>
            <div class="col-md-2">&nbsp;
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
        <div class="row"><div class="col-md-12">
            <asp:Label ID="lblMsg" runat="server"></asp:Label></div></div>
      <div class="row">
          <div class="col-md-12">
              <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" DataKeyNames="Room_ID, RoomStatus_ID" 
                  AllowPaging="True" AllowSorting="True" OnPageIndexChanging="OnPageIndexChanging" OnSorting="grid_Sorting"
                  OnRowDeleting="grid_RowDeleting" OnRowCommand="grid_RowCommand" OnRowDataBound="grid_RowDataBound"
                  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                  CssClass="table table-striped table-bordered table-condensed table-hover" PageSize="25">
                  <Columns>
                      <asp:BoundField DataField="Room_ID" HeaderText="Room ID" Visible="false" />
                      <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" SortExpression="RoomType_EN" />
                      <asp:BoundField DataField="RoomName_EN" HeaderText="RoomName EN" SortExpression="RoomType_EN" />
                      <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="RoomType_EN" />
                      <asp:BoundField DataField="RoomType_EN" HeaderText="Room Type" SortExpression="RoomType_EN" />
                      <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                      <asp:HyperLinkField DataTextField="RoomStatus_EN" DataNavigateUrlFields="Room_ID,RoomStatus_ID" HeaderText="Room Status" ItemStyle-Width="80"
                          DataNavigateUrlFormatString="~/Hotel/UpdateRoomStatus.aspx?Room_ID={0}&RoomStatus={1}" ItemStyle-HorizontalAlign="Center" />
                      <asp:HyperLinkField DataNavigateUrlFields="Room_ID" HeaderText="Edit" ItemStyle-Width="80" DataNavigateUrlFormatString="AddEditRooms.aspx?Room_ID={0}"
                          Text="&lt;img src='../Images/icon-edit.gif' alt='Edit' border='0'/&gt;" ItemStyle-HorizontalAlign="Center" />
                      <%-- <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                          <ItemTemplate>
                              <asp:LinkButton ID="lnkDelete"
                                  CommandArgument='<%# Eval("Room_ID") %>'
                                  CommandName="Delete" runat="server" Text="&lt;img src='../Images/icon-delete.gif' alt='Delete' border='0'/&gt;" ToolTip="Delete Room">
                              </asp:LinkButton>
                          </ItemTemplate>
                      </asp:TemplateField>--%>
                  </Columns>
                  <FooterStyle BackColor="White" ForeColor="#000066" />
                  <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="black" />
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

