<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_CheckedOutList, App_Web_dcln124p" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    

    <div class="row"><div class="col-md-12">
        <div class="row">
            <div class="col-md-12">
                <fieldset>
                    <legend></legend>
                    <div class="row">
                        <div class="col-md-2">
                            &nbsp;
                        </div>
                        <div class="col-md-3">
                           &nbsp;
                        </div>
                        <div class="col-md-3">
                            &nbsp;
                        </div>
                        <div class="col-md-7">
                            &nbsp;
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">&nbsp</div>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="col-md-12">
            <fieldset>
                <legend>Checked Out List</legend>
                <div>
                    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" DataKeyNames="Reservation_ID"
                        AllowPaging="True" AllowSorting="True" OnPageIndexChanging="OnPageIndexChanging" OnSorting="grid_Sorting"
                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                        CssClass="table table-striped table-bordered table-condensed table-hover">
                        <EmptyDataTemplate>
                            There are no Check Ins at this time
                        </EmptyDataTemplate>
                        <Columns>
                            <asp:BoundField DataField="Reservation_ID" HeaderText="Booking ID" Visible="false" />
                            <asp:BoundField DataField="Guest" HeaderText="Guest" SortExpression="Guest" />
                            <asp:BoundField DataField="RoomType_EN" HeaderText="Room Type" SortExpression="RoomType_EN" />
                            <asp:BoundField DataField="RoomName_EN" HeaderText="Room" SortExpression="RoomName_EN" />
                            <asp:BoundField DataField="RateType" HeaderText="Rate Type" />
                            <asp:BoundField DataField="Rate" HeaderText="Rate" />
                            <asp:BoundField DataField="CheckOut_Date" HeaderText="Checked Out" DataFormatString="{0:MMMM d, yyyy}" SortExpression="CheckOut_Date" />
                            <asp:BoundField DataField="FromDate" HeaderText="From Date" DataFormatString="{0:MMMM d, yyyy}" SortExpression="FromDate" />
                            <asp:BoundField DataField="ToDate" HeaderText="To Date" DataFormatString="{0:MMMM d, yyyy}" />
                            <asp:BoundField DataField="BookingStatus_EN" HeaderText="Status" />
                            <asp:BoundField DataField="PaymentStatus_EN" HeaderText="Payment Status" />
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hyplnkCheckOut" runat="server" NavigateUrl='<%# Eval("Reservation_ID", "Reservation.aspx?Reservation_ID={0}") %>'
                                        Text="&lt;img src='../Images/application-view-detail-icon.png' alt='Edit' border='0'/&gt;" Visible='<%# (Eval("BookingStatus_EN").Equals("CHECKED_OUT") ? true : false) %>' ItemStyle-HorizontalAlign="Center"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#3276b1" Font-Bold="True" ForeColor="Black" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <EmptyDataRowStyle BackColor="White" Font-Bold="True" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </div>
            </fieldset>
        </div>
    </div>
</asp:Content>

