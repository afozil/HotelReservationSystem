﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BookingsList.aspx.cs" Inherits="Hotel_BookingsList" %>

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
                <label for="txtBookingDate">Booking Date</label>
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
            <legend>Reservations</legend>
            <div>
                <asp:GridView ID="reservationsGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="Reservation_ID"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                    PageSize="20" AllowPaging="True" AllowSorting="True" OnPageIndexChanging="reservationsGrid_OnPageIndexChanging" OnSorting="reservationsGrid_Sorting" 
                    CssClass="table table-striped table-bordered table-condensed table-hover">
                   <EmptyDataTemplate>
                            There are no Bookings at this time
                        </EmptyDataTemplate>
                     <Columns>
                        <asp:BoundField DataField="Reservation_ID" HeaderText="Booking ID" Visible="false" />
                        <%-- 
                            <asp:BoundField DataField="RoomType_EN" HeaderText="Room Type" />
                            <asp:BoundField DataField="BookingStatus_EN" HeaderText="Status" />
                            <asp:BoundField DataField="PaymentStatus_EN" HeaderText="Payment Status" />
                            <asp:BoundField DataField="RateType" HeaderText="Rate Type" SortExpression="RateType"/>
                        --%>
                        <asp:HyperLinkField DataTextField="Guest" DataNavigateUrlFields="Guest_ID" HeaderText="Guest"
                          DataNavigateUrlFormatString="~/Configuration/AddEditGuest.aspx?Guest_ID={0}" ItemStyle-HorizontalAlign="Left" />
                        <%--<asp:BoundField DataField="Guest" HeaderText="Guest" SortExpression="Guest"/>--%>
                        <asp:BoundField DataField="RoomName_EN" HeaderText="Room" SortExpression="RoomName_EN"/>
                        <asp:BoundField DataField="RoomNumber" HeaderText="Room #" SortExpression="RoomName_EN"/>
                        <asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate"/>
                        <asp:BoundField DataField="ReservationDate" HeaderText="Booking Date" DataFormatString="{0:MMMM d, yyyy}" SortExpression="FromDate"/>
                        <asp:BoundField DataField="FromDate" HeaderText="From Date" DataFormatString="{0:MMMM d, yyyy}" />
                        <asp:BoundField DataField="ToDate" HeaderText="To Date" DataFormatString="{0:MMMM d, yyyy}" />
                        <asp:TemplateField HeaderText="Reservation Type" SortExpression="ReservationPersonnel">
                             <ItemTemplate>
                                 <%# (Eval("ReservationPersonnel").ToString().Equals("0")) ? "Internet" : "In-House" %>
                             </ItemTemplate>
                        </asp:TemplateField>

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
                    <EmptyDataRowStyle BackColor="#006699" Font-Bold="True" ForeColor="Black" />
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

