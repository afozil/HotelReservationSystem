<%@ page title="Add User To Role" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Admin_UsersToRole, App_Web_jqkglsg2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
        <div class="row">
    <div class="col-md-12">
        <fieldset>
            <legend> <h1>Add User To Role</h1></legend>
        </fieldset>
    </div>

             <div class="row">
         <div class="col-md-4">
             <label for="txtUserName">User Name</label>
              <asp:DropDownList ID="CboUser" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CboUser_SelectedIndexChanged"   class="form-control input-lg">
                </asp:DropDownList>
          </div>
         <div class="col-md-8">
          </div>
     </div>       

            
    <br /><br />
    
    
    
      
        <asp:GridView ID="grid" runat="server"  AutoGenerateColumns="false" DataKeyNames="ID" 
             BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowDataBound="grid_RowDataBound"            
            CssClass="table table-striped table-bordered table-condensed table-hover">

            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="UserID" Visible="false"  />
                <asp:BoundField DataField="UserName" HeaderText="User Name"  Visible="false" />
                <asp:BoundField DataField="Name" HeaderText="Role"  />
                <asp:BoundField DataField="RoleID" HeaderText="RoleID" Visible="false"  /> 
                <asp:TemplateField HeaderText="Status">
                  <ItemTemplate>
                      <asp:CheckBox ID="chkRow" runat="server"    Checked='<%# bool.Parse( Eval("UserID").ToString() != string.Empty ? "True": "False") %>'
                           OnCheckedChanged="chkRow_CheckedChanged" AutoPostBack="true"  ToolTip='<%# Eval("UserID") %>'/>
                      <asp:HiddenField  runat="server" ID="HuserId" Value='<%# Eval("UserID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                      
 
               

            </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="black" />
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

