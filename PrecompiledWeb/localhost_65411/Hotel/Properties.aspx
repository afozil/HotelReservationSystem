<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_Properties, App_Web_dcln124p" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
               <div class="col-md-12">
       <fieldset>
           <legend>Seacrh</legend>
           <div class="row">
               <div class="col-md-3">
                   <label for="drpProperties">Filter by Property Name</label>
                   <asp:DropDownList ID="drpProperties" runat="server" class="form-control input-sm" AutoPostBack="true" OnSelectedIndexChanged="drpProperties_SelectedIndexChanged">
                   </asp:DropDownList>
               </div>
               <div class="col-md-9">&nbsp;</div>
           </div>
           <div class="row"> 
               <div class="col-md-2">
                    <div class="forms-control">
                     
                        <label for="btnReset"></label>
                        <asp:Button ID="btnReset" runat="server" Text="Reset" class="btn btn-primary btn-sm" OnClick="btnReset_Click" />
                    </div>
               </div>
             
               <div class="col-md-10">
                   &nbsp;
               </div>
           </div>
           <div class="row"> <div class="col-md-12"><hr /></div></div>
           <div class="row">
               <div class="col-md-12">
                   <a class="btn btn-primary" role="button" href="AddEditProperties.aspx">
                       <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                       Add Property
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
         
         <legend>Properties</legend>

    
    <div class="row">
          <div class="col-md-12">
            <asp:GridView ID="grid" runat="server"  AutoGenerateColumns="false" DataKeyNames="PropertyID" 
             OnRowDeleting="grid_RowDeleting" 
             BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%">
            <Columns>
                <asp:BoundField DataField="PropertyID" HeaderText="PropertyID" Visible="false" />
                <asp:BoundField DataField="PropertyName_EN" HeaderText="PropertyName EN"  />
                <asp:BoundField DataField="PropertyName_AR" HeaderText="PropertyName AR"  />
                <asp:BoundField DataField="Description" HeaderText="Description"  /> 
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="false" ShowHeader="false" /> 
                <asp:HyperLinkField DataNavigateUrlFields="PropertyID" HeaderText="Edit"  ItemStyle-Width="80" DataNavigateUrlFormatString="AddEditProperties.aspx?PropertyID={0}" 
                Text="Edit" ItemStyle-HorizontalAlign="Center" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
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
    </div>
    </fieldset>
    </div>
    </div>
</asp:Content>

