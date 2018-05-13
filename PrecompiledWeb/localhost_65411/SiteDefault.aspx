<%@ page title="" language="C#" masterpagefile="~/OnlineSite.master" autoeventwireup="true" inherits="SiteDefault, App_Web_wxkg3lpr" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        .search-box{
            width:920px;
            height:50px;
            background: rgba(0,0,0,0.5);
            color: #fff;
            top:50%;
            left:50%;
            position:absolute;
            transform: translate(-50%,-50%);
            box-sizing: border-box;
        }
    </style>
    <div class="search-box">
        <form action="booking.aspx" method="get">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="txtFromDate">Check In</label><br />
                        <asp:TextBox ID="txtFromDate" name="txtFromDate" runat="server" class="input-md form-control" placeholder="mm/dd/yyyy" autocomplete="off" Width="200px"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="txtFromDateExtender" PopupButtonID="imgPopup" runat="server" TargetControlID="txtFromDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                        <asp:RequiredFieldValidator ID="reqFromDate" runat="server" ErrorMessage="Required" ControlToValidate="txtFromDate" Display="Static" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:HiddenField ID="hidFromDate" runat="server" />
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="txtToDate">Check Out</label><br />
                        <asp:TextBox ID="txtToDate" name="txtToDate" runat="server" class="input-md form-control" placeholder="mm/dd/yyyy" autocomplete="off" Width="200px"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="txtToDateExtender" PopupButtonID="imgPopup" runat="server" TargetControlID="txtToDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                        <asp:RequiredFieldValidator ID="reqToDate" runat="server" ErrorMessage="Required" ControlToValidate="txtToDate" Display="Static" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:HiddenField ID="hidToDate" runat="server" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label for="drpNumberOfAdults">Adults</label>
                        <asp:DropDownList ID="drpNumberOfAdults" name="drpNumberOfAdults" runat="server" class="form-control input input-md">
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                            <asp:ListItem Text="11" Value="11"></asp:ListItem>
                            <asp:ListItem Text="12" Value="12"></asp:ListItem>
                            <asp:ListItem Text="13" Value="13"></asp:ListItem>
                            <asp:ListItem Text="14" Value="14"></asp:ListItem>
                            <asp:ListItem Text="15" Value="15"></asp:ListItem>
                            <asp:ListItem Text="16" Value="16"></asp:ListItem>
                            <asp:ListItem Text="17" Value="17"></asp:ListItem>
                            <asp:ListItem Text="18" Value="18"></asp:ListItem>
                            <asp:ListItem Text="19" Value="19"></asp:ListItem>
                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:HiddenField ID="hidNumberOfAdults" runat="server" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <label for="drpNumberOfChildren">Children</label>
                        <asp:DropDownList ID="drpNumberOfChildren" name="drpNumberOfChildren" runat="server" class="form-control input input-md">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                            <asp:ListItem Text="9" Value="9"></asp:ListItem>
                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                            <asp:ListItem Text="11" Value="11"></asp:ListItem>
                            <asp:ListItem Text="12" Value="12"></asp:ListItem>
                            <asp:ListItem Text="13" Value="13"></asp:ListItem>
                            <asp:ListItem Text="14" Value="14"></asp:ListItem>
                            <asp:ListItem Text="15" Value="15"></asp:ListItem>
                            <asp:ListItem Text="16" Value="16"></asp:ListItem>
                            <asp:ListItem Text="17" Value="17"></asp:ListItem>
                            <asp:ListItem Text="18" Value="18"></asp:ListItem>
                            <asp:ListItem Text="19" Value="19"></asp:ListItem>
                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:HiddenField ID="hidNumberOfChildren" runat="server" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group">
                        <br />
                        <asp:Button ID="btnSearch" name="btnSearch" runat="server" Text="Search" class="btn btn-primary" PostBackUrl="booking.aspx" />
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>

