<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_Departures, App_Web_dcln124p" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <script>
          $(function() {
              $("#MainContent_txtBookingDate").datepicker();
          });
  </script>
    <div>
    <fieldset><legend>Search</legend>
        <div class="row">
            <div class="col-md-2">
                <label for="txtBookingDate">CheckIn Date</label>
                <div class="input-group">
                    <asp:TextBox ID="txtBookingDate" runat="server" class="form-control input-sm" AutoPostBack="true" CausesValidation="false" OnTextChanged="txtBookingDate_TextChanged"></asp:TextBox>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                </div>
            </div>
            <div class="col-md-3">
                 <label for="drpBookingStatus">Booking Status</label>
                    <asp:DropDownList ID="drpBookingStatus" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="drpBookingStatus_SelectedIndexChanged" CausesValidation="false"></asp:DropDownList>
             </div>
            <div class="col-md-7">
                <br/>
               <asp:Button ID="btnReset" runat="server" Text="Clear" class="btn btn-default btn-md" OnClick="btnReset_Click" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">&nbsp</div>
        </div>
    </fieldset>
   </div>

    <div>
        <fieldset>
            <legend>Departures</legend>
            <div>
                <asp:GridView ID="reservationsGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="Reservation_ID"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                    AllowPaging="True" AllowSorting="True" OnPageIndexChanging="reservationsGrid_OnPageIndexChanging" OnSorting="reservationsGrid_Sorting" 
                    CssClass="table table-striped table-bordered table-condensed table-hover">
                    <EmptyDataTemplate>
                            There are no Departures at this time
                        </EmptyDataTemplate>
                    <Columns>
                        <asp:BoundField DataField="Reservation_ID" HeaderText="Booking ID" Visible="false" />
                        <%-- 
                            <asp:BoundField DataField="RoomType_EN" HeaderText="Room Type" />
                            <asp:BoundField DataField="BookingStatus_EN" HeaderText="Status" />
                            <asp:BoundField DataField="PaymentStatus_EN" HeaderText="Payment Status" />
                        --%>
                        <asp:BoundField DataField="Reservation_ID" HeaderText="Booking ID" Visible="false" />
                            <asp:BoundField DataField="Guest" HeaderText="Guest" SortExpression="Guest" />
                            <asp:BoundField DataField="RoomName_EN" HeaderText="Room Name" SortExpression="RoomName_EN" />
                            <asp:BoundField DataField="RoomNumber" HeaderText="Room #" SortExpression="RoomNumber" />
                            <asp:BoundField DataField="TotalOccupancy" HeaderText="Occupancy" />
                        <asp:BoundField DataField="FromDate" HeaderText="From Date" DataFormatString="{0:MMMM d, yyyy}" />
                        <asp:BoundField DataField="ToDate" HeaderText="To Date" DataFormatString="{0:MMMM d, yyyy}" />
                        <asp:TemplateField HeaderText="View" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:HyperLink ID="hyplnkEdit" runat="server" NavigateUrl='<%# Eval("Reservation_ID", "Reservation.aspx?Reservation_ID={0}") %>'
                                    Text="&lt;img src='../Images/application-view-detail-icon.png' alt='Edit' border='0'/&gt;" ></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#3276b1" Font-Bold="True" ForeColor="Black" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <EmptyDataRowStyle BackColor="#006699" Font-Bold="True" ForeColor="black" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />

                </asp:GridView>

            </div>

        </fieldset>
    </div>
</asp:Content>

