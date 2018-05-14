<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_RoomStatus, App_Web_0nvmeo0o" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
               <div class="col-md-12">
        <fieldset><legend>Room Statuses</legend>
           <div class="row">
               <div class="col-md-12">
                   <a class="btn btn-primary" role="button" href="AddEditRoomStatus.aspx">
                       <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                       Add Room Status
                   </a>
               </div>
           </div>
            <div class="row"><div class="col-md-12">&nbsp;</div></div>
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" DataKeyNames="RoomStatus_ID"
                        AllowPaging="True" AllowSorting="True" OnPageIndexChanging="OnPageIndexChanging" OnSorting="grid_Sorting"
                        OnRowDeleting="grid_RowDeleting" OnRowCommand="grid_RowCommand" OnRowDataBound="grid_RowDataBound"
                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                        CssClass="table table-striped table-bordered table-condensed table-hover">
                        <Columns>
                            <asp:BoundField DataField="RoomStatus_ID" HeaderText="RoomStatus ID" Visible="false" />
                            <asp:BoundField DataField="RoomStatus_EN" HeaderText="Room Status Type" SortExpression="RoomStatus_EN"/>
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="RoomStatus_EN"/>
                            <asp:HyperLinkField DataNavigateUrlFields="RoomStatus_ID" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-Width="80" DataNavigateUrlFormatString="AddEditRoomStatus.aspx?RoomStatus_ID={0}"
                                Text="&lt;img src='../Images/icon-edit.gif' alt='alternate text' border='0'/&gt;" ItemStyle-HorizontalAlign="Center" />
                            <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete"
                                        CommandArgument='<%# Eval("RoomStatus_ID") %>'
                                        CommandName="Delete" runat="server" Text="&lt;img src='../Images/icon-delete.gif' alt='Delete' border='0'/&gt;" ToolTip="Delete Room Status">
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#3276b1" Font-Bold="True" ForeColor="Black" VerticalAlign="Middle" HorizontalAlign="Center" />
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

    </div
    </div>
</asp:Content>

