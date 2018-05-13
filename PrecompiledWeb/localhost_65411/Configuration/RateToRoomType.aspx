<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_RateToRoomType, App_Web_z0qh3rc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>
                    <h1>Map Rate - To - Room Type</h1>
                </legend>
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <label for="drpRates">Rate Name</label>
            <asp:DropDownList ID="drpRates" runat="server" Class="form-control input-md" AutoPostBack="true" OnSelectedIndexChanged="drpRates_SelectedIndexChanged"></asp:DropDownList>
        </div>
        <div class="col-md-4">
            <label for="lstRoomTypes">Room Types</label>
            <asp:ListBox ID="lstRoomTypes" runat="server" Class="form-control input input-md" SelectionMode="Multiple" Rows="10"></asp:ListBox>
        </div>
        <div class="col-md-4">
            <label for="txtDescription">Description</label>
            <asp:TextBox ID="txtDescription" runat="server" Class="form-control input input-md" TextMode="MultiLine" Rows="10"> </asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            &nbsp;
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">&nbsp;</div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-md" OnClick="btnSave_Click" />
            &nbsp;
             <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-md" OnClick="btnCancel_Click" />
        </div>
        <div class="col-md-10">
            &nbsp;
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>
    </div>
    <div class="row">
        <div class="col-md-12">&nbsp;</div>
    </div>
    <div class="row">
        <div class="col-md-12">
        <fieldset>
            <legend>Rates</legend>
            <div class="row">
                <div class="col-md-6">
                    <div>
                        <asp:GridView ID="rateGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="Rate_ID"
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                            CssClass="table table-striped table-bordered table-condensed table-hover">

                            <Columns>
                                <asp:BoundField DataField="Rate_ID" HeaderText="Rate ID" Visible="false" />
                                <asp:BoundField DataField="RateTypeName" HeaderText="Rate Type" />
                                <asp:BoundField DataField="RateDescription_EN" HeaderText="Description" />
                                <asp:BoundField DataField="FromDate" HeaderText="From Date" DataFormatString="{0:MMMM d, yyyy}" />
                                <asp:BoundField DataField="ToDate" HeaderText="To Date" DataFormatString="{0:MMMM d, yyyy}" />
                                <asp:BoundField DataField="Rate" HeaderText="Rate" />

                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#3276b1" Font-Bold="True" ForeColor="Black" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <EmptyDataRowStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />

                        </asp:GridView>
                    </div>
                </div>
                <div class="col-md-1">&nbsp;</div>
                <div class="col-md-5">
                    <div>
                        <asp:GridView ID="roomTypesGrid" runat="server" AutoGenerateColumns="false" DataKeyNames="Rate_ID, RoomType_ID"
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                            CssClass="table table-striped table-bordered table-condensed table-hover">

                            <Columns>
                                <asp:BoundField DataField="Rate_ID" HeaderText="Rate ID" Visible="false" />
                                <asp:BoundField DataField="RoomType_ID" HeaderText="Room Type" Visible="false" />
                                <asp:BoundField DataField="RoomType_EN" HeaderText="Room Type" />
                                <asp:BoundField DataField="RoomType_Description" HeaderText="Description" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#3276b1" Font-Bold="True" ForeColor="Black" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <EmptyDataRowStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />

                        </asp:GridView>
                    </div>
                </div>
            </div>
        </fieldset>
        </div>
    </div>
</asp:Content>

