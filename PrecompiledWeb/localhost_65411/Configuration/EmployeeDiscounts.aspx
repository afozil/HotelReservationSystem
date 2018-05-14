<%@ page title="Employee Discounts" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Admin_EmployeeDiscounts, App_Web_0nvmeo0o" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>Employee Discounts</legend>

                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <a class="btn btn-primary" role="button" href="AddEditEmployeeDiscount.aspx">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            Add Discounts
                        </a>
                    </div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" DataKeyNames="DiscountID"
                            AllowPaging="True" AllowSorting="True" OnPageIndexChanging="OnPageIndexChanging" OnSorting="grid_Sorting"
                            OnRowDeleting="grid_RowDeleting" OnRowCommand="grid_RowCommand" OnRowDataBound="grid_RowDataBound"
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                            CssClass="table table-striped table-bordered table-condensed table-hover">
                            <Columns>
                                <asp:BoundField DataField="DiscountID" HeaderText="Discount ID" Visible="false" />
                                <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" SortExpression="EmployeeID" />
                                <asp:BoundField DataField="FirstName" HeaderText="Name" SortExpression="FirstName" />
                                <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" />
                                <asp:BoundField DataField="Discount" HeaderText="Discount %" DataFormatString="{0:F0}" SortExpression="Discount"/>
                                <asp:BoundField DataField="DiscountStatus_Desc" HeaderText="Status" />
                                <asp:HyperLinkField DataNavigateUrlFields="DiscountID" HeaderText="Edit" ItemStyle-Width="80" DataNavigateUrlFormatString="AddEditEmployeeDiscount.aspx?DiscountID={0}"
                                    Text="&lt;img src='../Images/icon-edit.gif' alt='Edit' border='0'/&gt;" ItemStyle-HorizontalAlign="Center" />
                               <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkDelete" Visible="false"
                                            CommandArgument='<%# Eval("DiscountID") %>'
                                            CommandName="Delete" runat="server" Text="&lt;img src='../Images/icon-delete.gif' alt='Delete' border='0'/&gt;" ToolTip="Delete Employee Discount">
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
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

