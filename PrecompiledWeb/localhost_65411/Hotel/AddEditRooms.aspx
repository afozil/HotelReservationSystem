<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_AddEditRooms, App_Web_oqs1aph5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   <script>
          $(function() {
              $("#MainContent_txtOutOfOrderFromDate").datepicker();
          });
          $(function () {
              $("#MainContent_txtOutOfOrderToDate").datepicker();
          });
  </script>
   <div class="row">
     <div class="col-md-12">
       <fieldset>
           <legend><h1>Add/Edit Room</h1></legend>
            <div class="row">
                <div class="col-md-4">
                   <label for="cboProperties">Property</label>   
                    <asp:DropDownList ID="cboProperties" runat="server" class="form-control input-sm"></asp:DropDownList>
                </div>
                 <div class="col-md-4">
                    <label for="cboRoomType">Room Type</label>  
                     <asp:DropDownList ID="cboRoomType" runat="server" class="form-control input-sm"></asp:DropDownList>
                 </div>
                 <div class="col-md-4">
                    <label for="txtRoomNumber">Room Number</label> 
                     <asp:TextBox ID="txtRoomNumber" runat="server" class="form-control input-md"></asp:TextBox>
                    </div>         
            </div>
            <div class="row">
               <div class="col-md-12">&nbsp;</div>
            </div>
           <div class="row">
                <div class="col-md-4">
                    <label for="txtRoomNameEn">Room Name EN</label>
                    <asp:TextBox ID="txtRoomNameEn" runat="server" class="form-control input-md"></asp:TextBox>
                   
                </div>
                    <div class="col-md-4">
                        <label for="txtRoomNameAr">Room Name Ar</label>
                        <asp:TextBox ID="txtRoomNameAr" runat="server" class="form-control input-md"></asp:TextBox>
                    </div>
                <div class="col-md-4">
                     <label for="txtDesc">Description</label>  
                    <asp:TextBox ID="txtDesc" runat="server" class="form-control input-md"></asp:TextBox>
                 </div>
            </div>
            <div class="row">
               <div class="col-md-12">&nbsp;</div>
            </div>

             <div class="row">
                 <div class="col-md-4">
                    <label for="drpRoomStatus">Set Room Status</label>  
                     <asp:DropDownList ID="drpRoomStatus" runat="server" class="form-control input-sm"></asp:DropDownList>
                </div>
                 <div class="col-md-4">
                    <label for="drpNumBeds">Number of Beds</label>  
                     <asp:DropDownList ID="drpNumBeds" runat="server" class="form-control input-sm">
                          <asp:ListItem Text="1" Value="1" Selected></asp:ListItem>
                          <asp:ListItem Text="2" Value="2"></asp:ListItem>
                          <asp:ListItem Text="3" Value="3" ></asp:ListItem>
                          <asp:ListItem Text="4" Value="4"></asp:ListItem>
                         <asp:ListItem Text="5" Value="5"></asp:ListItem>
                     </asp:DropDownList>
                 </div>
                 <div class="col-md-4">
                    <label for="drpNumBeds">Number of Bathrooms</label>  
                     <asp:DropDownList ID="drpNumBathrooms" runat="server" class="form-control input-sm">
                           <asp:ListItem Text="1" Value="1" Selected></asp:ListItem>
                          <asp:ListItem Text="2" Value="2"></asp:ListItem>
                          <asp:ListItem Text="3" Value="3" ></asp:ListItem>
                          <asp:ListItem Text="4" Value="4"></asp:ListItem>
                         <asp:ListItem Text="5" Value="5"></asp:ListItem>
                     </asp:DropDownList>
                 </div>
            </div>
            <div class="row">
               <div class="col-md-12">&nbsp;</div>
            </div>
             <div class="row">
                 <div class="col-md-4">
                    <label for="drpIsCookingFacilityVailable">Is Cooking Available ?</label>  
                     <asp:DropDownList ID="drpIsCookingFacilityVailable" runat="server" class="form-control input-sm">
                         <asp:ListItem Text="Yes" Value="1" Selected></asp:ListItem>
                          <asp:ListItem Text="No" Value="0"></asp:ListItem>
                     </asp:DropDownList>
                </div>
                 <div class="col-md-4">
                    <label for="drpIsReferigeratorVailable">Is Referigerator Available ?</label>  
                     <asp:DropDownList ID="drpIsReferigeratorVailable" runat="server" class="form-control input-sm">
                         <asp:ListItem Text="Yes" Value="1" Selected></asp:ListItem>
                          <asp:ListItem Text="No" Value="0"></asp:ListItem>
                     </asp:DropDownList>
                </div>
                 <div class="col-md-4">
                    <label for="drpNumTV">Number of TVs</label>  
                     <asp:DropDownList ID="drpNumTV" runat="server" class="form-control input-sm">
                           <asp:ListItem Text="1" Value="1" Selected></asp:ListItem>
                          <asp:ListItem Text="2" Value="2"></asp:ListItem>
                          <asp:ListItem Text="3" Value="3" ></asp:ListItem>
                          <asp:ListItem Text="4" Value="4"></asp:ListItem>
                         <asp:ListItem Text="5" Value="5"></asp:ListItem>
                     </asp:DropDownList>
                 </div>
            </div>
            <div class="row">
               <div class="col-md-12">&nbsp;</div>
            </div>
             <div class="row">
                 <div class="col-md-4">
                    <label for="drpMaxGents">Max Gents Allowed</label>  
                     <asp:DropDownList ID="drpMaxGents" runat="server" class="form-control input-sm">
                           <asp:ListItem Text="1" Value="1" Selected></asp:ListItem>
                          <asp:ListItem Text="2" Value="2"></asp:ListItem>
                          <asp:ListItem Text="3" Value="3" ></asp:ListItem>
                          <asp:ListItem Text="4" Value="4"></asp:ListItem>
                         <asp:ListItem Text="5" Value="5"></asp:ListItem>
                     </asp:DropDownList>
                </div>
                 <div class="col-md-4">
                    <label for="drpNumLivingRooms">Number of Living Rooms</label>  
                     <asp:DropDownList ID="drpNumLivingRooms" runat="server" class="form-control input-sm">
                           <asp:ListItem Text="1" Value="1" Selected></asp:ListItem>
                          <asp:ListItem Text="2" Value="2"></asp:ListItem>
                          <asp:ListItem Text="3" Value="3" ></asp:ListItem>
                          <asp:ListItem Text="4" Value="4"></asp:ListItem>
                         <asp:ListItem Text="5" Value="5"></asp:ListItem>
                     </asp:DropDownList>
                </div>
                 <div class="col-md-4">
                    <label for="drpMaxKids">Max Kids Allowed</label>  
                     <asp:DropDownList ID="drpMaxKids" runat="server" class="form-control input-sm">
                           <asp:ListItem Text="1" Value="1" Selected></asp:ListItem>
                          <asp:ListItem Text="2" Value="2"></asp:ListItem>
                          <asp:ListItem Text="3" Value="3" ></asp:ListItem>
                          <asp:ListItem Text="4" Value="4"></asp:ListItem>
                         <asp:ListItem Text="5" Value="5"></asp:ListItem>
                     </asp:DropDownList>
                </div>
            </div>
            <div class="row">
               <div class="col-md-12">&nbsp;</div>
            </div>
             <div class="row">
                 <div class="col-md-4">
                    <label for="drpMaxOccupancy">Max Occupancy Allowed</label>  
                     <asp:DropDownList ID="drpMaxOccupancy" runat="server" class="form-control input-sm">
                           <asp:ListItem Text="1" Value="1" Selected></asp:ListItem>
                          <asp:ListItem Text="2" Value="2"></asp:ListItem>
                          <asp:ListItem Text="3" Value="3" ></asp:ListItem>
                          <asp:ListItem Text="4" Value="4"></asp:ListItem>
                         <asp:ListItem Text="5" Value="5"></asp:ListItem>
                     </asp:DropDownList>
                </div>
                 <div class="col-md-4">
                    <label for="drpIsOutOfOrder">Is Out of Order</label>  
                     <asp:DropDownList ID="drpIsOutOfOrder" runat="server" class="form-control input-sm">
                         <asp:ListItem Text="Yes" Value="1" ></asp:ListItem>
                          <asp:ListItem Text="No" Value="0" Selected></asp:ListItem>
                     </asp:DropDownList>
                </div>
                 <div class="col-md-4">
                  <label for="drpNumKitchens">Number of Kitchens</label>  
                     <asp:DropDownList ID="drpNumKitchens" runat="server" class="form-control input-sm">
                           <asp:ListItem Text="1" Value="1" Selected></asp:ListItem>
                          <asp:ListItem Text="2" Value="2"></asp:ListItem>
                          <asp:ListItem Text="3" Value="3" ></asp:ListItem>
                          <asp:ListItem Text="4" Value="4"></asp:ListItem>
                         <asp:ListItem Text="5" Value="5"></asp:ListItem>
                     </asp:DropDownList>
                </div>
            </div>
            <div class="row">
               <div class="col-md-12">&nbsp;</div>
            </div>
             <div class="row">
                 <div class="col-md-2">
                    <label for="txtOutOfOrderFromDate">Out of Order From</label>  
                    <div class="input-group">
                        <asp:TextBox ID="txtOutOfOrderFromDate" runat="server" class="input-md form-control"></asp:TextBox>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                    </div>
                </div>
                 <div class="col-md-2">
                    <label for="txtOutOfOrderToDate">Out of Order To</label>  
                    <div class="input-group">
                        <asp:TextBox ID="txtOutOfOrderToDate" runat="server" class="input-md form-control"></asp:TextBox>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                    </div>
                </div>
                 <div class="col-md-8">
                     <label for="txtRemarks">Remarks</label>  
                    <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" class="input-md form-control"></asp:TextBox>
                </div>
                  <div class="col-md-4">
                    &nbsp;
                </div>                
            </div>
              <div class="row">
                  <div class="col-md-2">
                    <asp:Button ID="btnSave" runat="server" Text="Save"  OnClick="btnSave_Click" class="forms-control btn btn-primary btn-sm"/>
                      &nbsp
                      <asp:Button ID="btnCancel" runat="server" Text="Cancel"  OnClick="btnCancel_Click" class="forms-control btn btn-default btn-sm"/>
                    </div>
                  <div class="col-md-10"></div>
            </div>
                   <div class="row">
                    <div class="col-md-12">
                        
                        <asp:HiddenField ID="hidRoomId" runat="server"></asp:HiddenField>
                    </div>
                </div>
    <div>

        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </div>
    <fieldset>
        </div></div>
</asp:Content>

