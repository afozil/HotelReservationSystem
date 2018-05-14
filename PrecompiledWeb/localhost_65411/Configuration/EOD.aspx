<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Configuration_EOD, App_Web_uh3qsns0" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>Initiate  EOD</legend>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Button ID="btnRunEOD" runat="server" class="btn btn-primary" Text="Run Now" OnClick="btnRunEOD_Click"/>
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                        </a>
                    </div>
                </div>

            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12"><hr /></div>
    </div>


    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>EOD Runs</legend>
                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" DataKeyNames="EOD_ID"
                            BackColor="White" BorderColor="#285e8e" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                            CssClass="table table-striped table-bordered table-condensed table-hover">
                            <Columns>
                                <asp:BoundField DataField="EOD_ID" HeaderText="PropertyID" Visible="false" />
                                <asp:BoundField DataField="Running_Date" HeaderText="Running Date" />
                                <asp:BoundField DataField="LastRun_Date" HeaderText="Last Run" />
                                <asp:BoundField DataField="NextRunning_Date" HeaderText="Next Run" />
                                <asp:BoundField DataField="Initiated_Date" HeaderText="Initiated" />
                                <asp:BoundField DataField="InitiatedBy" HeaderText="Inititated By" />
                                <asp:HyperLinkField DataNavigateUrlFields="EOD_ID" HeaderText="Reports" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ItemStyle-Width="80" DataNavigateUrlFormatString="EODReports.aspx?EOD_ID={0}"
                                    Text="&lt;img src='../Images/icon-edit.gif' alt='alternate text' border='0'/&gt;" ItemStyle-HorizontalAlign="Center" />
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
            </fieldset>
        </div>
    </div>
</asp:Content>

