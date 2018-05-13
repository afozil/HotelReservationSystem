<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_RatesList, App_Web_p5sxnoyk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script>
        $(function () {
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
                    <legend>Filter</legend>
                    <div class="row">
                        <div class="col-md-2">
                            <label for="drpRateTypesList">Filter by Rate Type</label>
                            <asp:DropDownList ID="drpRateTypesList" runat="server" class="form-control input-md" AutoPostBack="true" OnSelectedIndexChanged="drpRateTypesList_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-2">&nbsp;
                            <label for="txtFromDate">From Date</label>
                            <div class="input-group">
                                <asp:TextBox ID="txtFromDate" runat="server" class="input-md form-control"></asp:TextBox>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                            </div>
                        </div>
                        <div class="col-md-2">&nbsp;
                            <label for="txtToDate">To Date</label>
                            <div class="input-group">
                                <asp:TextBox ID="txtToDate" runat="server" class="input-md form-control"></asp:TextBox>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                            </div>
                        </div>
                        <div class="col-md-2">&nbsp;
                            <label for="txtRate">Rate</label>
                            <div class="input-group">
                                <span class="input-group-addon">KD</span>
                                <asp:TextBox ID="txtRate" runat="server" class="input-md form-control" aria-label="Amount (to the nearest KD)"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">&nbsp;
                            <%--<div class="forms-control">
                                <label for="btnsrchrates"></label>
                                <br />
                                <asp:button id="btnsrchrates" runat="server" text="search" class="btn btn-primary btn-md" onclick="btnsrchrates_click" />
                                <label for="btnreset"></label>
                                <asp:button id="btnreset" runat="server" text="reset" class="btn btn-default btn-md" onclick="btnreset_click" causesvalidation="false" />
                            </div>--%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            &nbsp;
                        </div>
                    </div>
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
        <div class="row">
            <div class="col-md-12">&nbsp;</div>
        </div>

        <div class="row">
            <div class="col-md-12">
            <fieldset>
                <legend>Rates</legend>

                <div class="row">
                    <div class="col-md-12">
                        <div>

                            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" DataKeyNames="Rate_ID"
                                AllowPaging="True" AllowSorting="True" OnPageIndexChanging="OnPageIndexChanging" OnSorting="grid_Sorting"
                                OnRowDeleting="grid_RowDeleting" OnRowCommand="grid_RowCommand" OnRowDataBound="grid_RowDataBound"
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                                CssClass="table table-striped table-bordered table-condensed table-hover" PageSize="25">
                                <Columns>
                                    <asp:BoundField DataField="Rate_ID" HeaderText="Rate ID" Visible="true" />
                                    <asp:BoundField DataField="RateTypeName" HeaderText="Rate Type" SortExpression="RateTypeName" />
                                    <asp:BoundField DataField="RateDescription_EN" HeaderText="Description" SortExpression="RateDescription_EN" />
                                    <asp:BoundField DataField="FromDate" HeaderText="From Date" DataFormatString="{0:MMMM d, yyyy}" SortExpression="FromDate" />
                                    <asp:BoundField DataField="ToDate" HeaderText="To Date" DataFormatString="{0:MMMM d, yyyy}" SortExpression="ToDate" />
                                    <asp:BoundField DataField="Rate" HeaderText="Rate (KD)" SortExpression="Rate" />
                                    <asp:HyperLinkField DataNavigateUrlFields="Rate_ID" HeaderText="Edit" ItemStyle-Width="80" DataNavigateUrlFormatString="AddEditRate.aspx?Rate_ID={0}"
                                        Text="&lt;img src='../Images/icon-edit.gif' alt='alternate text' border='0'/&gt;" ItemStyle-HorizontalAlign="Center" />
                                    <%-- <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                          <ItemTemplate>
                              <asp:LinkButton ID="lnkDelete"
                                  CommandArgument='<%# Eval("Rate_ID") %>'
                                  CommandName="Delete" runat="server" Text="&lt;img src='../Images/icon-delete.gif' alt='Delete' border='0'/&gt;" ToolTip="Delete Room Type">
                              </asp:LinkButton>
                          </ItemTemplate>
                      </asp:TemplateField>--%>
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
    </div>


</asp:Content>

