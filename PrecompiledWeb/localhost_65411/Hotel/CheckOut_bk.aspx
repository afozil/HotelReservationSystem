<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_CheckOut_bk, App_Web_oqs1aph5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="panel panel-default">
          <div class="panel-heading"><h1>Check Out</h1></div>
          <div class="panel-body">
              <div class="row" >
          <div class="col-md-12">
        <div class="row">
         <div class="col-md-4">
             <label for="lblCehckInId">Check In Number</label>
             <asp:DropDownList ID="drpCheckIns" runat="server" class="form-control input input-md" OnSelectedIndexChanged="drpCheckIns_SelectedIndexChanged" AutoPostBack="true" CausesValidation="false"></asp:DropDownList>
         </div>
         <div class="col-md-2">
           <label for="lblCheckInDate">Check In Date</label>
               <span class="input-group">
                <asp:Label id="lblCheckInDate" runat="server" class="form-control input-md"></asp:Label>
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
               </span>
        </div>
        <div class="col-md-2">
           <label for="lblCheckOutDate">Check Out Date</label>
               <span class="input-group">
                <asp:label ID="txtCheckOutDate" runat="server" class="form-control input input-md"></asp:label>
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
               </span>
        </div>
            <div class="col-md-4">&nbsp;</div>
      </div>
        <div class="row"><div class="col-md-12">&nbsp;</div></div>
              <div class="row">
                   <div class="col-md-2">
                      <label for="lblNumBookedDays">Number of Days Booked</label>
                      <asp:Label ID="lblNumBookedDays" runat="server" class="form-control input-md"></asp:Label>
                  </div>
                  <div class="col-md-2">
                      <label for="lblNumStayDays">Number of Days Stayed</label>
                      <asp:Label ID="lblNumStayDays" runat="server" class="form-control input-md"></asp:Label>
                  </div>
                  <div class="col-md-2">
                      <label for="lblCostOfStay">Total Boarding Cost</label>
                      <div class="input-group">
                          <span class="input-group-addon">KD</span>
                          <asp:Label ID="lblCostOfStay" runat="server" class="form-control"></asp:Label>
                      </div>
                  </div>
                  <div class="col-md-2">
                      <label for="lblPaidAmount">Amount Received</label>
                      <div class="input-group">
                          <span class="input-group-addon">KD</span>
                          <asp:Label ID="lblPaidAmount" runat="server" class="form-control"></asp:Label>
                      </div>
                  </div>
                  <div class="col-md-2">
                      <label for="lblOutstandingBoardingPayment">Outstanding Boarding Payment</label>
                      <div class="input-group">
                          <span class="input-group-addon">KD</span>
                          <asp:Label ID="lblOutstandingBoardingPayment" runat="server" class="form-control"></asp:Label>
                      </div>
                  </div>
              </div>
              <div class="row"><div class="col-md-12">&nbsp;</div></div>
    <div class="row">
         <div class="panel panel-default" style="width:45%; position:absolute">
             <div class="panel-heading">Bill Service</div>
                  <div class="panel-body">
                      <div class="col-md-4">
                          <asp:GridView ID="gridB" runat="server" AutoGenerateColumns="False" DataKeyNames="Availed_ID" CssClass="table table-striped table-bordered table-condensed table-hover">
                              <Columns>
                                  <asp:BoundField DataField="Availed_ID" HeaderText="Availed_ID" Visible="false" />
                                  <asp:BoundField DataField="RoomNumber" HeaderText="Room&nbsp;Number"></asp:BoundField>
                                  <asp:BoundField DataField="CheckIn_ID" HeaderText="CheckIn_ID" Visible="false" />
                                  <asp:BoundField DataField="Name" HeaderText="Serive&nbsp;Name"></asp:BoundField>
                                  <asp:BoundField DataField="TotalCost" HeaderText="Total&nbsp;Cost" />
                                  <asp:BoundField DataField="InvoiceID" HeaderText="Invoice ID" Visible="false" />
                              </Columns>
                          </asp:GridView>
                      </div>
                 </div>
        </div>
         <div class="panel panel-default" style="width:50%; position:relative; margin-left:50%; ">
          <div class="panel-heading">Amenities</div>
            <div class="panel-body">
                <div class="col-md-4">
                    <asp:GridView ID="gridA" runat="server" AutoGenerateColumns="false" DataKeyNames="AvailedAmenity_ID" CssClass="table table-striped table-bordered table-condensed table-hover">
                        <Columns>
                            <asp:BoundField DataField="RoomNumber" HeaderText="Room&nbsp;Number" />
                            <asp:BoundField DataField="CheckIn_ID" HeaderText="CheckIn_ID" Visible="false" />
                            <asp:BoundField DataField="AmenitiesName" HeaderText="Amenities&nbsp;Name" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                            <asp:BoundField DataField="TotalCost" HeaderText="Total&nbsp;Cost" />
                        </Columns>
                    </asp:GridView>
                </div>
             </div>
          </div>
        </div>
<div class="row"><div class="col-md-12">&nbsp;</div></div>
       <div class="row">
         <div class="col-md-4">
             <label for="txtTotalInvoiceAmount">Total Invoice</label>
             <div class="input-group">
                       <span class="input-group-addon">KD</span>
                 <asp:TextBox id="txtTotalInvoiceAmount" runat="server" class="form-control input-md" ></asp:TextBox>
            </div> 
             <asp:CompareValidator ID="cmpTotalInvoiceAmount" runat="server" ControlToValidate="txtTotalInvoiceAmount" Operator="DataTypeCheck"
                  Type="Currency" Display="Static" ErrorMessage="Illegal format" ForeColor="red"/>
         </div>
         <div class="col-md-4">
             <label for="txtTotaOutstandingAmount">Total Outstanding</label>
             <div class="input-group">
                <span class="input-group-addon">KD</span>
                 <asp:TextBox id="txtTotaOutstandingAmount" runat="server" class="form-control input-md"></asp:TextBox>
            </div>           
          </div>
          <div class="col-md-4">
             <label for="drpPaymentModes">Payment Mode</label>
             <asp:DropDownList ID="drpPaymentModes" runat="server" class="form-control input input-md"></asp:DropDownList>
        </div>
      </div>

        <div class="row"><div class="col-md-12">&nbsp;</div></div>
         <div class="row">
             <div class="col-md-4">
                 <div class="forms-control">
                <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" class="btn btn-md btn-primary" OnClick="btnCheckOut_Click"/>
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-md" OnClick="btnCancel_Click" />
            </div>
             </div>

         </div>
                <div class="row"><div class="col-md-12">
            <asp:Label ID="lblStatus" runat="server"></asp:Label></div></div>
        </div>
        </div>
        </div>
     </div>
     <asp:HiddenField ID="hidTotAmenities" runat="server" />
     <asp:HiddenField ID="hidTotBills" runat="server" />
</asp:Content>

