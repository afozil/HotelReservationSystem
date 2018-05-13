<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_RateToRoomType, App_Web_0t3h1jy2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="row">
     <div class="col-md-12">
       <fieldset>
           <legend><h1>Rate - To - Room Type</h1></legend>
        </fieldset>
       </div>
    </div>
     <div class="row">
         <div class="col-md-4">
             <label for="drpRates">Rate Name</label>
             <asp:DropDownList ID="drpRates" runat="server" Class="form-control input-sm" AutoPostBack="true" OnSelectedIndexChanged="drpRates_SelectedIndexChanged"></asp:DropDownList>
          </div>
         <div class="col-md-4">
             <label for="lstRoomTypes">Room Types</label>
             <asp:ListBox ID="lstRoomTypes" runat="server" Class="form-control" SelectionMode="Multiple"></asp:ListBox>
          </div>
         <div class="col-md-4">
             <label for="txtDescription">Description</label>
             <asp:TextBox ID="txtDescription" runat="server" Class="form-control"></asp:TextBox>
         </div>
    </div>
     <div class="row">
         <div class="col-md-4">
             
          </div>
         <div class="col-md-4">
             
          </div>
         <div class="col-md-4">
         </div>
    </div>
     <div class="row"><div class="col-md-12">&nbsp;</div></div>
    <div class="row">     
        <div class="col-md-2">
             <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-sm" OnClick="btnSave_Click" />
          &nbsp;
             <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-sm" OnClick="btnCancel_Click" />
          </div>
         <div class="col-md-10">
          </div>
    </div>
     <div>
      <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </div> 

    <div class="row"> <div class="col-md-12">&nbsp;</div></div>




      <div class="row"><div class="col-md-12"></div>
     <fieldset><legend>Rates</legend>
    
    <div class="row">
          <div class="col-md-7">
            <div>
              <asp:GridView ID="rateGrid" runat="server"  AutoGenerateColumns="false" DataKeyNames="Rate_ID"  
             BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%">

            <Columns>
                <asp:BoundField DataField="Rate_ID" HeaderText="Rate ID"  Visible="false"/>
                <asp:BoundField DataField="RateTypeName" HeaderText="Rate Type"  />
                <asp:BoundField DataField="RateDescription_EN" HeaderText="Description"  />
                <asp:BoundField DataField="FromDate" HeaderText="From Date"  /> 
                <asp:BoundField DataField="ToDate" HeaderText="To Date"  />
                 <asp:BoundField DataField="Rate" HeaderText="Rate"  />

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
    <div class="col-md-1"></div>
    <div class="col-md-4">
            <div>
              <asp:GridView ID="roomTypesGrid" runat="server"  AutoGenerateColumns="false" DataKeyNames="Rate_ID, RoomType_ID"  
             BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%">

            <Columns>
                <asp:BoundField DataField="Rate_ID" HeaderText="Rate ID"  Visible="false"/>
                <asp:BoundField DataField="RoomType_ID" HeaderText="Room Type" Visible="false" />
                <asp:BoundField DataField="RoomType_EN" HeaderText="Room Type"  />
                <asp:BoundField DataField="RoomType_Description" HeaderText="Description"  />
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
</asp:Content>

