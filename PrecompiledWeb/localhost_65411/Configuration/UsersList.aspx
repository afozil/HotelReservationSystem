<%@ page title="User's List" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Configuration_UsersList, App_Web_0nvmeo0o" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="panel panel-default">
        <div class="panel-heading"><h1>Users List</h1></div>
        <div class="panel-body">
            <asp:GridView ID="grid" runat="server" DataKeyNames="Employee_ID" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True"
                OnPageIndexChanging="OnPageIndexChanging" OnSorting="grid_Sorting" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                CssClass="table table-striped table-bordered table-condensed table-hover" PageSize="5">
                <Columns>
                    <%-- <asp:BoundField DataField="ID" HeaderText="ID"  Visible="false" />
                    <asp:BoundField DataField="UserName" HeaderText="User Name"  />
                    <asp:HyperLinkField DataNavigateUrlFields="ID" HeaderText="Manage"  ItemStyle-Width="80" DataNavigateUrlFormatString="manageUser.aspx?ID={0}" 
                 Text="&lt;img src='../Images/icon-edit.gif' alt='alternate text' border='0'/&gt;" ItemStyle-HorizontalAlign="Center" />--%>
                    <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID" Visible="false" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" SortExpression="MiddleName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:HyperLinkField DataNavigateUrlFields="Employee_ID" HeaderText="Manage" ItemStyle-Width="80" DataNavigateUrlFormatString="manageUser.aspx?Employee_ID={0}"
                        Text="&lt;img src='../Images/icon-edit.gif' alt='alternate text' border='0'/&gt;" ItemStyle-HorizontalAlign="Center">

                        <ItemStyle HorizontalAlign="Center" Width="80px"></ItemStyle>
                    </asp:HyperLinkField>
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>

        </div>
    </div>


</asp:Content>

