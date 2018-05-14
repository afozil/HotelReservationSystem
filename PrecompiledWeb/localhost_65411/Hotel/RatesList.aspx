<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_RatesList, App_Web_dcln124p" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script>
  $(function() {
      $("#MainContent_txtFromDate").datepicker();
  });

  $(function () {
      $("#MainContent_txtToDate").datepicker();
  });
  </script>

 <div class="container-fluid">

         <div class="row">
               <div class="col-md-12">
       <fieldset>
           <legend>Seacrh</legend>
           <div class="row">
               <div class="col-md-2">
                   <label for="drpRateTypesList">Filter by Rate Type</label>
                   <asp:DropDownList ID="drpRateTypesList" runat="server" class="form-control input-sm" AutoPostBack="true" OnSelectedIndexChanged="drpRateTypesList_SelectedIndexChanged">
                   </asp:DropDownList>
               </div>
               <div class="col-md-2">
                  <label for="txtFromDate">From Date</label>
                   <div class="input-group">
                        <asp:TextBox ID="txtFromDate" runat="server" class="input-sm form-control"></asp:TextBox>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                    </div>
                  </div>
              <div class="col-md-2">
                  <label for="txtToDate">To Date</label>
                  <div class="input-group">
                      <asp:TextBox ID="txtToDate" runat="server" class="input-sm form-control"></asp:TextBox>
                       <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                    </div>
              </div>
               <div class="col-md-2">
                   <label for="txtRate">Rate</label>
                   <div class="input-group">
                       <span class="input-group-addon">KD</span>
                        <asp:TextBox ID="txtRate" runat="server" class="input-sm form-control" aria-label="Amount (to the nearest dollar)"></asp:TextBox>
                       </div>
               </div>
               <div class="col-md-4">
              &nbsp;
              </div>
           </div>
           <div class="row"> 
               <div class="col-md-2">
                    <div class="forms-control">
                      <label for="btnSrchRates"></label>
                        <asp:Button ID="btnSrchRates" runat="server" Text="Search" class="btn btn-primary btn-sm" OnClick="btnSrchRates_Click" />
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
                   <a class="btn btn-primary" role="button" href="AddEditRate.aspx">
                       <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                       Add Rate
                   </a>
               </div>
           </div>
           
    </fieldset>
                   </div>
        </div>
  <div class="row"> <div class="col-md-12">&nbsp;</div></div>

      <div class="row"><div class="col-md-12"></div>
     <fieldset><legend>Rates</legend>
    
    <div class="row">
          <div class="col-md-12"> <div>
   
              <asp:GridView ID="grid" runat="server"  AutoGenerateColumns="false" DataKeyNames="Rate_ID"  
             BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%">

            <Columns>
                <asp:BoundField DataField="Rate_ID" HeaderText="Rate ID"  Visible="false"/>
                <asp:BoundField DataField="RateTypeName" HeaderText="Rate Type"  />
                <asp:BoundField DataField="RateDescription_EN" HeaderText="Description"  />
                <asp:BoundField DataField="FromDate" HeaderText="From Date"  /> 
                <asp:BoundField DataField="ToDate" HeaderText="To Date"  />
                 <asp:BoundField DataField="Rate" HeaderText="Rate"  />
                <asp:BoundField DataField="Modified_By" HeaderText="Modified User"  />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="false" ShowHeader="True" /> 
                  <asp:HyperLinkField DataNavigateUrlFields="Rate_ID" HeaderText="Edit"  ItemStyle-Width="80" DataNavigateUrlFormatString="AddEditRate.aspx?Rate_ID={0}" 
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

