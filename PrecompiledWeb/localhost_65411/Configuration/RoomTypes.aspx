<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_RoomTypes, App_Web_0nvmeo0o" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
               <div class="col-md-12">
       <fieldset>
           <legend>Search</legend>
           <div class="row">
               <div class="col-md-3">
                   <label for="drpProperties">Filter by Room Type</label>
                   <asp:DropDownList ID="drpRoomType" runat="server" class="form-control input-md" AutoPostBack="true" OnSelectedIndexChanged="drpRoomType_SelectedIndexChanged">
                   </asp:DropDownList>
               </div>
               <div class="col-md-9">
                   <div class="forms-control">
                        <label for="btnReset"></label><br />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" class="btn btn-default btn-md" OnClick="btnReset_Click" CausesValidation="false"/>
                    </div></div>
           </div>
           <div class="row"> <div class="col-md-12"><hr /></div></div>
           <div class="row">
               <div class="col-md-12">
                   <a class="btn btn-primary" role="button" href="AddEditRoomTypes.aspx">
                       <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                       Add Room Type
                   </a>
               </div>
           </div>
           
    </fieldset>
                   </div>
        </div>
  <div class="row"> <div class="col-md-12">&nbsp;</div></div>
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>Room Types</legend>
                <div class="row"> <div class="col-md-12"> <asp:Label ID="lblMsg" runat="server"></asp:Label></div></div>
                <div class="row">
                    <div class="col-md-12">
                        <div>
                            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" DataKeyNames="RoomType_ID" 
                                AllowPaging="True" AllowSorting="True" OnPageIndexChanging="OnPageIndexChanging" OnSorting="grid_Sorting" 
                                OnRowDeleting="grid_RowDeleting" OnRowCommand="grid_RowCommand" OnRowDataBound="grid_RowDataBound" 
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                                CssClass="table table-striped table-bordered table-condensed table-hover" PageSize="25">
                                <Columns>
                                    <asp:BoundField DataField="RoomType_ID" HeaderText="RoomType ID" Visible="false" />
                                    <asp:BoundField DataField="RoomType_EN" HeaderText="Room Type" SortExpression="RoomType_EN"/>
                                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"/>
                                    <asp:TemplateField HeaderText="Is Available Online" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Image runat="server" ImageUrl='<%# Eval("IsOnline").Equals(true) ? "~/images/true.PNG" : "~/images/false.PNG" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Online Details" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                          <asp:HyperLink runat="server" ID="btnGo" Text="&lt;img src='../Images/view-details.PNG' alt='Delete' border='0'/&gt;" ToolTip="View Online Details" NavigateUrl='<%# "RoomTypeOnlineDetails.aspx?RoomType_ID=" + Eval("RoomType_ID") %>' Visible='<%# Eval("IsOnline").Equals(true) %>'/>
                                        </ItemTemplate>
                                      </asp:TemplateField>
                                    <asp:HyperLinkField DataNavigateUrlFields="RoomType_ID" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-Width="80" DataNavigateUrlFormatString="AddEditRoomTypes.aspx?RoomType_ID={0}"
                                        Text="&lt;img src='../Images/icon-edit.gif' alt='Edit' border='0'/&gt;" ItemStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDelete"
                                                CommandArgument='<%# Eval("RoomType_ID") %>'
                                                CommandName="Delete" runat="server" Text="&lt;img src='../Images/icon-delete.gif' alt='Delete' border='0'/&gt;" ToolTip="Delete Room Type">
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
                </div>
            </fieldset>
        </div>
    </div>
</asp:Content>

