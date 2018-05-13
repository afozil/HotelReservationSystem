<%@ page title="Contact" language="C#" masterpagefile="~/OnlineSite.Master" autoeventwireup="true" inherits="Contact, App_Web_m42e11xx" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <%--<address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>--%>

<%--    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Room_ID" >
            <Columns>
                <asp:BoundField DataField="Room_ID" HeaderText="Room_ID" InsertVisible="False" ReadOnly="True" SortExpression="Room_ID" />
                <asp:BoundField DataField="RoomName_EN" HeaderText="RoomName_EN" SortExpression="RoomName_EN" />
                <asp:BoundField DataField="RoomName_AR" HeaderText="RoomName_AR" SortExpression="RoomName_AR" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="RoomType_ID" HeaderText="RoomType_ID" SortExpression="RoomType_ID" />
                <asp:BoundField DataField="Property_ID" HeaderText="Property_ID" SortExpression="Property_ID" />
                <asp:BoundField DataField="CreatedUser" HeaderText="CreatedUser" SortExpression="CreatedUser" />
                <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate" />
                <asp:BoundField DataField="LastModifiedUser" HeaderText="LastModifiedUser" SortExpression="LastModifiedUser" />
                <asp:BoundField DataField="LastModifiedDate" HeaderText="LastModifiedDate" SortExpression="LastModifiedDate" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HotelReservationSystemConnectionString %>" SelectCommand="SELECT * FROM [Rooms]"></asp:SqlDataSource>
    </address>--%>
</asp:Content>
