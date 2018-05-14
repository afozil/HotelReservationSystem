<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="CheckAvailability, App_Web_oqs1aph5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script>
          $(function() {
              $("#MainContent_txtFromDate").datepicker();
          });

          $(function () {
              $("#MainContent_txtToDate").datepicker();
          });
  </script>
    <div class="row">
     <div class="col-md-12">
       <fieldset>
           <legend><h1>Check Availability</h1></legend>
              <div class="row">
                <div class="col-md-2">
                  <label for="txtFromDate">Check In Date</label>
                   <span class="input-group">
                        <asp:TextBox ID="txtFromDate" runat="server" class="input-md form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                    </span>
                    <asp:RequiredFieldValidator ID="reqFromDtae" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFromDate" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regTxtFromDate" runat="server" ErrorMessage="In correct Date Format" ControlToValidate="txtFromDate" Display="Static" ForeColor="Red"
                           ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$" ></asp:RegularExpressionValidator>
                </div>
                 <div class="col-md-2">
                    <label for="txtToDate">Check Out Date</label>
                    <span class="input-group">
                      <asp:TextBox ID="txtToDate" runat="server" class="input-md form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
                       <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                    </span>
                     <asp:RequiredFieldValidator ID="reqToDate" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtToDate" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regTxtToDate" runat="server" ErrorMessage="In correct Date Format" ControlToValidate="txtToDate" Display="Static" ForeColor="Red"
                           ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$" ></asp:RegularExpressionValidator>
                      </div>
                  <div class="col-md-2">
                      <label for="drpRoomTypes">Room Types</label>
                      <asp:DropDownList ID="drpRoomTypes" runat="server" class="form-control input input-md"></asp:DropDownList>
                  </div>
                 <div class="col-md-2">
                     <label for="lnkSearch">Find Room Types</label>
                     <span class="input-group">
                         <asp:LinkButton ID="lnkSearch" runat="server" Class="form-control btn btn-primary" OnClick="lnkSearch_Click">
                             Search
                         </asp:LinkButton><span class="input-group-addon"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></span>
                 </span>
            </div>
                  <div class="col-md-2">
                      <label for="btnCancel"></label><br />
                      <asp:Button ID="btnCancel" runat="server" Text="Reset" class="btn  btn-default btn-md" OnClick="btnCancel_Click" CausesValidation="false"/>
                 </div>
        </div>
           <div class="row"><div class="col-md-12"><asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label></div></div>
           <div class="row"><div class="col-md-12">
               <fieldset>
           <legend><h1>Available Room Types</h1></legend>
               
               <ASP:DataList id="RoomTypesList" RepeatColumns="2" runat="server" RepeatLayout="Table" RepeatDirection="Vertical" width="100%" CellPadding="5" CellSpacing="5" AlternatingItemStyle-BackColor="#f1f1f1" BorderColor="#e9e9e9">
                    <ItemTemplate>
                     <div class="row">
                          <div class="col-md-8">
                          <b>Room Type: </b><%# DataBinder.Eval(Container.DataItem, "RoomType_EN") %><br>
                          <b>Room Number:</b><%# DataBinder.Eval(Container.DataItem, "RoomNumber") %><br>
                          <b>Room Desc: </b><%# DataBinder.Eval(Container.DataItem, "RoomName_EN") %><br>  
                          <b>Rate Desc: </b><%# DataBinder.Eval(Container.DataItem, "RateDescription_EN") %><br>  
                          <b>Rate: </b><%# DataBinder.Eval(Container.DataItem, "Rate", "KWD {0}") %><br> 
                          <asp:LinkButton ID="lnkBookNow" runat="server" OnClick="lnkBookNow_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Room_ID")%>' CssClass="btn btn-default btn-sm">Book Now</asp:LinkButton>
                         </div>
                         <div class="col-md-4">
                             <img alt="book room" align="top" src='../images/room.jpg' class="img-rounded img-responsive">
                         </div>
                     </div> 
                  </ItemTemplate>
            </ASP:DataList>

                   </fieldset>
           </div>

           </div>

    </div>
        </div>
</asp:Content>

