<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddEditRate.aspx.cs" Inherits="Hotel_AddEditRate" %>

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
                <legend>
                    <h1>Add/Edit Rate</h1>
                </legend>
            </fieldset>
        </div>
        <div class="row">
                    <div class="col-md-12"><asp:Label ID="lblMsg" runat="server"></asp:Label></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-4">
                        <label for="drpRateTypesList">Rate Type</label>
                        <asp:DropDownList ID="drpRateTypesList" runat="server" Class="form-control input-md" OnSelectedIndexChanged="drpRateTypesList_SelectedIndexChanged" CausesValidation="false" AutoPostBack="true"></asp:DropDownList>
                    </div>
                    <div class="col-md-8">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp; </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label for="txtRateNameEn">Name</label>
                        <asp:TextBox ID="txtRateNameEn" runat="server" Class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqTxtRateNameEn" runat="server" ErrorMessage="Required" ControlToValidate="txtRateNameEn" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-8">&nbsp;</div>
                </div>
                <!--
     <div class="row">
         <div class="col-md-4">
             <label for="txtRateNameAr">Rate Name - Arabic</label>
             <asp:TextBox ID="txtRateNameAr" runat="server" Class="form-control"></asp:TextBox>
          </div>
         <div class="col-md-8">&nbsp;</div>
    </div>-->
                <div class="row">
                    <div class="col-md-12">&nbsp; </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <label for="txtFromDate">From Date</label>
                        <div class="input-group">
                            <asp:TextBox ID="txtFromDate" runat="server" class="input-md form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                        </div>
                        <asp:RequiredFieldValidator ID="reqTxtFromDate" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtFromDate" Display="Static">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regTxtFromDate" runat="server" ErrorMessage="In correct Date Format" ControlToValidate="txtFromDate" Display="Static" ForeColor="Red"
                            ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-2">
                        <label for="txtToDate">To Date</label>
                        <div class="input-group">
                            <asp:TextBox ID="txtToDate" runat="server" class="input-md form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                        </div>
                        <asp:RequiredFieldValidator ID="reqTxtToDate" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtToDate" Display="Static">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regTxtToDate" runat="server" ErrorMessage="In correct Date Format" ControlToValidate="txtToDate" Display="Static" ForeColor="Red"
                            ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-8">
                        <label for="btnGetWeekEnds">&nbsp;</label>
                        <asp:Button ID="btnGetWeekEnds" runat="server" Text="Weekends" class="btn  btn-default btn-sm" CausesValidation="false" OnClick="btnGetWeekEnds_Click" Visible="false"/>
                        <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false"
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%"
                            CssClass="table table-striped table-bordered table-condensed table-hover" >
                            <Columns>
                                <asp:BoundField DataField="Weekend_Number" HeaderText="Sl_No" />
                                <asp:BoundField DataField="StartDate" HeaderText="Weekend Start" DataFormatString="{0:MMMM d, yyyy}" />
                                <asp:BoundField DataField="EndDate" HeaderText="Weekend End" DataFormatString="{0:MMMM d, yyyy}" />
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
                <div class="row">
                    <div class="col-md-12">&nbsp; </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label for="lstRoomTypes">Select a Room Type</label>
                        <div class="input-group">
                            <asp:ListBox ID="lstRoomTypes" runat="server" SelectionMode="Multiple" Rows="10" class="form-control input-md"></asp:ListBox>
                        </div>
                        <asp:RequiredFieldValidator ID="reqLstRoomTypes" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="lstRoomTypes" Display="Static">*</asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-8">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp; </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <label for="txtRate">Rate</label>
                        <div class="input-group">
                            <span class="input-group-addon">KD</span>
                            <asp:TextBox ID="txtRate" runat="server" class="input-md form-control" aria-label="Amount (to the nearest dollar)"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="reqTxtRate" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtRate" Display="Static">*</asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-10">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp; </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <label for="drpRateStatus">Status</label>
                        <asp:DropDownList ID="drpRateStatus" runat="server" class="input-md form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="reqDrpRateStatus" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="drpRateStatus" Display="Static">*</asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-10">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-md" OnClick="btnSave_Click" />
                        &nbsp;
             <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-md" OnClick="btnCancel_Click" CausesValidation="false" />
                    </div>
                    <div class="col-md-8">
                    </div>
                </div>
                <asp:HiddenField ID="hidRateId" runat="server" />
                

            </div>
    </div>
</div>
</asp:Content>

