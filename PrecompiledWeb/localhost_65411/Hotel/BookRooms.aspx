<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_BookRooms, App_Web_dcln124p" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script>
        $(function () {
            $("#MainContent_txtFromDate").datepicker();
        });

        $(function () {
            $("#MainContent_txtToDate").datepicker();
        });
  </script>
<div class="row"><div class="col-md-12">
    <fieldset><legend><h1>Book Room</h1></legend>
        <div class="row">
         <div class="col-md-4">
             <label for="drpGuests">Select a Guest</label>
             <asp:DropDownList ID="drpGuests" runat="server" class="form-control input input-md"></asp:DropDownList>
         </div>
            <div class="col-md-4">
                <label for="btnAddGuest"></label><br />
                   <a class="btn btn-primary" role="button" href="AddEditGuest.aspx" id="btnAddGuest">
                       <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                       Add Guest
                   </a>
             </div>
            <div class="col-md-4"> 
                <label for="btnChkReservation"></label><br />
                   <a class="btn btn-primary" role="button" href="Reservation.aspx" id="btnChkReservation">
                       <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                       Check Room Availability
                   </a>
             </div>
      </div>
        <div class="row"><div class="col-md-12">&nbsp;</div></div>
      <div class="row">
         <div class="col-md-2">
             <label for="txtFromDate">From Date</label>
                <span class="input-group">
                    <asp:textbox id="txtFromDate" runat="server" class="form-control input-md" placeholder="mm/dd/yyyy" disabled></asp:textbox>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                </span>
              <asp:RequiredFieldValidator ID="reqFromDate" runat="server" ErrorMessage="Required" ControlToValidate="txtFromDate" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="regFromDate" runat="server" ErrorMessage="In correct Date Format" ControlToValidate="txtFromDate" Display="Static" ForeColor="Red"
                           ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$" ></asp:RegularExpressionValidator>
         </div>
        <div class="col-md-2">
            <label for="txtToDate">To Date</label>
               <span class="input-group">
                <asp:textbox id="txtToDate" runat="server" class="form-control input-md" placeholder="mm/dd/yyyy" disabled></asp:textbox>
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
               </span>
            <asp:RequiredFieldValidator ID="reqToDate" runat="server" ErrorMessage="Required" ControlToValidate="txtToDate" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="regToDate" runat="server" ErrorMessage="In correct Date Format" ControlToValidate="txtToDate" Display="Static" ForeColor="Red"
                           ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$" ></asp:RegularExpressionValidator>
        </div>
          <div class="col-md-4">
                <label for="drpRoomTypesList">Room Type</label>
                <asp:DropDownList ID="drpRoomTypesList" runat="server" class="form-control input input-md" disabled></asp:DropDownList>
        </div>
        <div class="col-md-4">
                <label for="drpRoomsList">Room </label>
                <asp:DropDownList ID="drpRoomsList" runat="server" class="form-control input input-md disabled" disabled></asp:DropDownList>
        </div>
    </div>
    <div class="row"><div class="col-md-12">&nbsp;</div></div>
      <div class="row">
          <div class="col-md-4">
                 <label for="lblRateName">Applied Rate</label>
                 <!--<label ID="lblRateName" runat="server" class="form-control"></label>-->
                <asp:DropDownList ID="drpRatesApplicable" runat="server" class="form-control input input-md" CausesValidation="false" AutoPostBack="true" OnSelectedIndexChanged="drpRatesApplicable_SelectedIndexChanged"></asp:DropDownList>
        </div>
        <div class="col-md-4">
             <label for="lblRate">Rate</label>
            <div class="input-group">
                       <span class="input-group-addon">KD</span>
                       <asp:label ID="lblRate" runat="server" class="form-control"></asp:label>
             </div>
        </div>  
         <div class="col-md-4">
             <label for="lblNumDays">Number of Days</label>
             <asp:label ID="lblNumDays" runat="server" class="form-control"></asp:label>
                <!-- 
                 <label for="lblSalesPerson">Sales Person</label>
                 <label ID="lblSalesPerson" runat="server" class="form-control"></label>
                -->
        </div>
    </div>
    <div class="row"><div class="col-md-12">&nbsp;</div></div>
      <div class="row">
         <div class="col-md-4">
                <label for="txtDiscountOffered">Discount Offered (Amount)</label>
                <div class="input-group">
                 <span class="input-group-addon">KD</span>
                 <asp:TextBox ID="txtDiscountOffered" runat="server" class="form-control input input-md" OnTextChanged="txtDiscountOffered_TextChanged" AutoPostBack="true" CausesValidation="true"></asp:TextBox>
                </div>
                <asp:CompareValidator id="cmpDiscountOffered" runat="server" ControlToValidate="txtDiscountOffered" Operator="DataTypeCheck"
                 Type="Double"  Display="Static" ErrorMessage="Illegal format" ForeColor="red"/>
        </div>
         <div class="col-md-4">&nbsp;
              <label for="txtDiscountOfferedPercent">Discount Offered (Percentage)</label>
                <div class="input-group">
                 <span class="input-group-addon">%</span>
                 <asp:TextBox ID="txtDiscountOfferedPercent" runat="server" class="form-control input input-md" OnTextChanged="txtDiscountOffered_TextChanged" AutoPostBack="true" CausesValidation="true"></asp:TextBox>
                </div>
                <asp:CompareValidator id="cmpDiscountOfferedPercent" runat="server" ControlToValidate="txtDiscountOfferedPercent" Operator="DataTypeCheck"
                 Type="Double"  Display="Static" ErrorMessage="Illegal format" ForeColor="red"/>
        </div>
         <div class="col-md-4">
                 <label for="lblTotalAmount">Total Amount</label>
             <div class="input-group">
                       <span class="input-group-addon">KD</span>
                <asp:label ID="lblTotalAmount" runat="server" class="form-control"></asp:label>
            </div>
        </div>
         <div class="col-md-4">
             <asp:HiddenField ID="hidBookingID" runat="server" />
             <asp:HiddenField ID="hidEmployeeDiscount" runat="server" />
             <asp:HiddenField ID="hidEmployeeDiscountUnit" runat="server" />
             <asp:HiddenField ID="hidTotalDiscount" runat="server" />
             <asp:HiddenField ID="hidRoomId" runat="server" />
             <asp:HiddenField ID="hidRoomTypeId" runat="server" />
             <asp:HiddenField ID="hidFromDate" runat="server" />
             <asp:HiddenField ID="hidToDate" runat="server" />
             <asp:HiddenField ID="hidPaidAmount" runat="server" />
             <!--    
             <label for="lblSalesPersonDiscount">Sales Person Discount</label>
                 <div class="input-group">
                       <span class="input-group-addon">KD</span>
                 <label ID="lblSalesPersonDiscount" runat="server" class="form-control"></label>
            </div>
             -->
        </div>
    </div>
    <div class="row"><div class="col-md-12">&nbsp;</div></div>
      <div class="row">
          <div class="col-md-4">
              <label for="txtPaidAmount">Payment Amount</label>
              <div class="input-group">
                  <span class="input-group-addon">KD</span>
                  <asp:TextBox ID="txtPaidAmount" runat="server" class="form-control input input-md" OnTextChanged="txtPaidAmount_TextChanged" AutoPostBack="true" CausesValidation="true"></asp:TextBox>
              </div>
              <asp:CompareValidator ID="cmpPaidAmount" runat="server" ControlToValidate="txtPaidAmount" Operator="DataTypeCheck"
                  Type="Currency" Display="Static" ErrorMessage="Illegal format" ForeColor="red"/>
          </div>
         <div class="col-md-4">
             <label for="drpBookingStatus">Booking Status</label>
             <asp:DropDownList ID="drpBookingStatus" runat="server" class="form-control input input-md"></asp:DropDownList>
        </div>
         <div class="col-md-4">
             <label for="drpPaymentModes">Payment Mode</label>
             <asp:DropDownList ID="drpPaymentModes" runat="server" class="form-control input input-md"></asp:DropDownList>
        </div>
    </div>
    <div class="row"><div class="col-md-12">&nbsp;</div></div>
    <div class="row">
        <div class="col-md-12">
            <div class="forms-control">
                <asp:Button ID="btnSaveBokking" runat="server" Text="Reserve" class="btn btn-md btn-primary" OnClick="btnSaveBooking_Click"/>
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-md" OnClick="btnCancel_Click" CausesValidation="false"/>
            </div> 
        </div>
     </div>
    <div class="row">
        <div class="col-md-12">

        </div>
        <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>

    </div>


    </fieldset>
</div></div>
</asp:Content>

