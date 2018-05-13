<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_Properties, App_Web_z0qh3rc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
               <div class="col-md-12">
       <fieldset>
           <legend>Seacrh</legend>
           <div class="row">
               <div class="col-md-3">
                   <label for="drpProperties">Filter by Property Name</label>
                   <asp:DropDownList ID="drpProperties" runat="server" class="form-control input-md" AutoPostBack="true" OnSelectedIndexChanged="drpProperties_SelectedIndexChanged">
                   </asp:DropDownList>
               </div>
               <div class="col-md-9">
                   <label for="btnReset"></label><br />
                   <asp:Button ID="btnReset" runat="server" Text="Reset" class="btn btn-default btn-md" OnClick="btnReset_Click" /></div>
           </div>
           <div class="row"> <div class="col-md-12"><hr /></div></div>
           <div class="row">
               <div class="col-md-12">
                   <a class="btn btn-primary" role="button" href="AddEditProperties.aspx" disabled="true">
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
             BackColor="White" BorderColor="#285e8e" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%" 
                CssClass="table table-striped table-bordered table-condensed table-hover" >
            <Columns>
                <asp:BoundField DataField="PropertyID" HeaderText="PropertyID" Visible="false" />
                <asp:BoundField DataField="PropertyName_EN" HeaderText="Property Name"  />
                <asp:BoundField DataField="Description" HeaderText="Description"  /> 
                <asp:HyperLinkField DataNavigateUrlFields="PropertyID" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-Width="80" DataNavigateUrlFormatString="AddEditProperties.aspx?PropertyID={0}" 
                Text="&lt;img src='../Images/icon-edit.gif' alt='alternate text' border='0'/&gt;" ItemStyle-HorizontalAlign="Center" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#3276b1" Font-Bold="True" ForeColor="Black" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <EmptyDataRowStyle  BackColor="#006699"  Font-Bold="True" ForeColor="White"  />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
              <!--<asp:CommandField HeaderText="Delete" ShowDeleteButton="true" ShowHeader="True" DeleteImageUrl="../Images/icon-delete.gif" ButtonType="Image" ItemStyle-HorizontalAlign="Center"/> -->
    </div>
    </div>
    </fieldset>
    </div>
    </div>
</asp:Content>

