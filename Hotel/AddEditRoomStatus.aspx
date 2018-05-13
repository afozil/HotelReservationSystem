<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddEditRoomStatus.aspx.cs" Inherits="Hotel_AddEditRoomStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div>
        <h1>Add/Edit Room Status</h1>

    </div>
    <div>
        <table>
            <tr>
                <td> ID</td><td> <asp:TextBox ID="txtStatusID" Enabled="false" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td> Name En</td><td> <asp:TextBox ID="txtStatusEn" runat="server"></asp:TextBox></td>
            </tr>
               <tr>
                <td> Name Ar</td><td> <asp:TextBox ID="txtStatusAr" runat="server"></asp:TextBox></td>
            </tr>
             <tr>
                <td>Description</td><td> <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox></td>
            </tr>
            <tr><td></td></tr>
             <tr>
                <td></td><td> <asp:Button ID="btnSave" runat="server" Text="Save" Height="27px" Width="117px" OnClick="btnSave_Click" /></td>
            </tr>

        </table>

    </div>
    <div>

        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

