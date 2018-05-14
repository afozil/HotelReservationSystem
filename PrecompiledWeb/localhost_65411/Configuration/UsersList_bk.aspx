<%@ page title="User's List" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Configuration_UsersList_bk, App_Web_uh3qsns0" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="panel panel-default">
        <div class="panel-heading"><h1>Users List</h1></div>
        <div class="panel-body">
            <asp:GridView ID="grid" runat="server" DataKeyNames="ID" AutoGenerateColumns="false">

               <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID"  Visible="false" />
                    <asp:BoundField DataField="UserName" HeaderText="User Name"  />
                    <asp:HyperLinkField DataNavigateUrlFields="ID" HeaderText="Manage"  ItemStyle-Width="80" DataNavigateUrlFormatString="manageUser.aspx?ID={0}" 
                 Text="&lt;img src='../Images/icon-edit.gif' alt='alternate text' border='0'/&gt;" ItemStyle-HorizontalAlign="Center" />
               </Columns>
            </asp:GridView>
        </div>
    </div>


</asp:Content>

