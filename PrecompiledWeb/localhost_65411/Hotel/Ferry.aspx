<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_Ferry, App_Web_0t3h1jy2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>Search</legend>
                <div class="row">
                    <div class="col-md-3">
                        <label for="drpProperties">Filter by Ferry Name</label>
                        <asp:DropDownList ID="drpFerry" runat="server" class="form-control input-sm" AutoPostBack="true" OnSelectedIndexChanged="drpFerry_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-2">
                        <div class="forms-control">
                            <br />
                            <label for="btnReset"></label>
                            <asp:Button ID="btnReset" runat="server" Text="Reset" class="btn btn-default btn-sm" OnClick="btnReset_Click" />
                        </div>
                    </div>
                    <div class="col-md-7">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        &nbsp;
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <hr />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <a class="btn btn-primary" role="button" href="AddEditFerry.aspx">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            Add Ferry
                        </a>
                    </div>
                </div>

            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">&nbsp;</div>
    </div>
     <div class="row"> <div class="col-md-12">
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
                          </div>
        </div>
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>Ferry</legend>
                <div class="row">
                    <div class="col-md-12">
                        
                            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" DataKeyNames="Ferry_ID"
                  AllowPaging="True" AllowSorting="True" 
                  OnRowDeleting="grid_RowDeleting" OnRowCommand="grid_RowCommand" OnRowDataBound="grid_RowDataBound"
                  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                  CssClass="table table-striped table-bordered table-condensed table-hover">
                            <Columns>
                                <asp:BoundField DataField="Ferry_ID" HeaderText="Ferry ID" Visible="false" />
                                <asp:BoundField DataField="FerryName_EN" HeaderText="FerryName EN" />
                                <asp:BoundField DataField="FerryName_AR" HeaderText="FerryName AR" />
                                <asp:BoundField DataField="Cost_For_Adults" HeaderText="Cost for Adults" />
                                <asp:BoundField DataField="Cost_For_Kids" HeaderText="Cost for Kids" />
                                <asp:HyperLinkField DataNavigateUrlFields="Ferry_ID" HeaderText="Edit" ItemStyle-Width="80" DataNavigateUrlFormatString="AddEditFerry.aspx?FerryID={0}"
                                    Text="&lt;img src='../Images/icon-edit.gif' alt='Edit' border='0'/&gt;" ItemStyle-HorizontalAlign="Center" />
                                <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkDelete"
                                            CommandArgument='<%# Eval("Ferry_ID") %>'
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

