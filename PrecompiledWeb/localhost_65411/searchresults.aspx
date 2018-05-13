<%@ page title="" language="C#" masterpagefile="~/OnlineInside.master" autoeventwireup="true" inherits="searchresults, App_Web_m42e11xx" enableeventvalidation="False" %>
<asp:Content ID="searchResults" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="myReseversationPanel" runat="server">
        <ContentTemplate>
            <script type="text/javascript">
            function ShowFullImg(url) {
                var img = $get("<%=FullImage.ClientID %>");
                img.src = url;
                $find("MPEImage").show();
            }
        </script>
            <div style="position: relative; float: left; width: 942px; margin-left: 20px;">
                <div style="position: relative; float: left;">
                    <div class="exfont" style="position: relative; height: 100%; margin: 10px 0px; float: left; border: 0px solid red;">
                        <div class="exfont" id="submenu1" style="position: relative; height: 100%; font-size: 10pt; float: left; border: 0px solid red;">
                            <a title="" href="default.asp">Home</a>
                        </div>
                        <div class="exfont" style="position: relative; height: 100%; margin: 3px 7px; float: left; border: 0px solid red;">
                            <img style="width: 10px; height: 10px;" alt="" src="https://www.failakaonline.com/app/Site2_references/arrow.png">
                        </div>
                        <div class="exfont" id="submenu77" style="position: relative; height: 100%; font-size: 10pt; float: left; border: 0px solid red;">
                            <a title="" href="booking.aspx">Search</a>
                        </div>
                        <div class="exfont" style="position: relative; height: 100%; margin: 3px 7px; float: left; border: 0px solid red;">
                            <img style="width: 10px; height: 10px;" alt="" src="https://www.failakaonline.com/app/Site2_references/arrow.png">
                        </div>
                        <div class="exfont" id="menu85" style="position: relative; font-size: 10pt; float: left; border: 0px solid red;">
                            <a title="My Reservation" href="booking.aspx">Book a Room</a>
                        </div>
                    </div>
                </div>
                <div style="position: relative; float: left;">
                </div>
            </div>
            <div class="maintextInside exfont" id="ContentPanelInsidePage">
                <table width="100%" class="maintext" border="0" cellspacing="0" cellpadding="0" summary="">
                    <tbody>
                        <tr>
                            <td valign="top">
                                <span style="font-size: 10pt;"></span>
                                <span style="font-weight: bold; font-size: 12pt;"></span>
                                <span style="font-size: 18pt;">
                                    <br>
                                    <table width="" align="left" style="border-collapse: collapse; width: 100%; border: medium none; background-color: rgb(6, 58, 86);">
                                        <tbody>
                                            <tr>
                                                <td style="border: medium none;">
                                                    <span style="font-size: 18pt; color: rgb(255, 255, 255);"></span>
                                                    <span style="font-size: 12pt;">
                                                        <span style="font-size: 18pt;">
                                                            <span style="font-size: 18pt; color: rgb(255, 255, 255);">&nbsp;&nbsp; Find Rooms</span>
                                                        </span>
                                                    </span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br>
                                </span>
                                <br>
                                <table width="941px" align="center">
                                    <tbody>
                                        <tr>
                                            <td style="border: medium none;"></td>
                                        </tr>
                                        <tr>
                                            <td style="border: medium none;">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="panel panel-info">
                                                                    <div class="panel-heading">
                                                                        <div class="row">
                                                                            <div class="col-md-3">
                                                                                <div class="form-group">
                                                                                    <label for="txtFromDate">Check In</label><br />
                                                                                    <asp:TextBox ID="txtFromDate" runat="server" class="input-md form-control" placeholder="mm/dd/yyyy" autocomplete="off" Width="200px"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender ID="txtFromDateExtender" PopupButtonID="imgPopup" runat="server" TargetControlID="txtFromDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                                                                                    <asp:RequiredFieldValidator ID="reqFromDate" runat="server" ErrorMessage="Required" ControlToValidate="txtFromDate" Display="Static" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                                    <asp:HiddenField ID="hidFromDate" runat="server" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-3">
                                                                                <div class="form-group">
                                                                                    <label for="txtToDate">Check Out</label><br />
                                                                                    <asp:TextBox ID="txtToDate" runat="server" class="input-md form-control" placeholder="mm/dd/yyyy" autocomplete="off" Width="200px"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender ID="txtToDateExtender" PopupButtonID="imgPopup" runat="server" TargetControlID="txtToDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                                                                                    <asp:RequiredFieldValidator ID="reqToDate" runat="server" ErrorMessage="Required" ControlToValidate="txtToDate" Display="Static" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                                                    <asp:HiddenField ID="hidToDate" runat="server" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-2">
                                                                                <div class="form-group">
                                                                                    <label for="drpNumberOfAdults">Adults</label>
                                                                                    <asp:DropDownList ID="drpNumberOfAdults" runat="server" class="form-control input input-md">
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
                                                                                    <asp:DropDownList ID="drpNumberOfChildren" runat="server" class="form-control input input-md">
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
                                                                                    <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-primary" OnClick="btnSearch_Click" />
                                                                                    <asp:HiddenField ID="hidNumberOfRooms" runat="server" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <asp:Panel ID="pnlResults" runat="server" Visible="false">
                                                                        <div class="panel-body">
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <asp:GridView ID="roomTypesList" runat="server" AutoGenerateColumns="false" DataKeyNames="RoomType_ID" 
                                                                                        GridLines="None" Width="100%" 
                                                                                        CssClass="table table-striped table-hover" PagerStyle-CssClass="pager"
                                                                                        PageSize="3" AllowPaging="True" AllowSorting="True" 
                                                                                        OnRowCommand="roomTypesList_RowCommand" OnRowDataBound="roomTypesList_RowDataBound" OnPageIndexChanging="roomTypesList_OnPageIndexChanging" OnSorting="roomTypesList_Sorting">
                                                                                        <EmptyDataTemplate>
                                                                                            There are no Rooms available for the chosen criteria
                                                                                        </EmptyDataTemplate>
                                                                                        <Columns>
                                                                                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="25%">
                                                                                                <ItemTemplate>
                                                                                                    <asp:HiddenField ID="hidIsOnline" runat="server" Value='<%# Bind("IsOnline") %>' />
                                                                                                    <asp:HiddenField ID="hidRoomTypeID" runat="server" Value='<%# Bind("RoomType_ID") %>' />
                                                                                                    <asp:HiddenField ID="hidRoomType" runat="server" Value='<%# Bind("RoomType_EN") %>' />
                                                                                                    <asp:ImageButton ID="roomTypeDefaultImage" runat="server" Style="cursor: pointer" CommandName="DefaultImageClick" CommandArgument='<%# Bind("RoomType_ID") %>' />
                                                                                                    <asp:Button ID="btnShowPopup" runat="server" style="display:none" />
                                                                                                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup" 
                                                                                                        CancelControlID="btnCancel" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
                                                                                                    <asp:Panel ID="pnlpopup" runat="server" CssClass="PopupPanel"  style="display:none">
                                                                                                        <asp:DataList ID="roomTypeImages" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:HiddenField ID="hidRoomTypeId" runat="server" Value='<%# Bind("RoomType_ID") %>' />
                                                                                                                <asp:ImageButton ID="imgRoomType" runat="server" Height="100" ImageUrl='<%# Bind("RoomType_ThumbnailPath") %>' OnClientClick='<%# Eval("Full_URL","ShowFullImg(\"{0}\");return false;") %>' Width="100" />
                                                                                                            </ItemTemplate>
                                                                                                        </asp:DataList>
                                                                                                        <%--<asp:Button ID="btnCancel" runat="server" CssClass="CloseButton"/>--%>
                                                                                                        <asp:ImageButton ID="btnCancel" runat="server" CssClass="CloseButton"/>
                                                                                                    </asp:Panel>
                                                                                                    
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="50%">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblDetails" runat="server"></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField ShowHeader="false" ItemStyle-Width="25%" ItemStyle-CssClass="BookingColumn">
                                                                                                <ItemTemplate>
                                                                                                    <div class="row">
                                                                                                        <div class="col-md-2">&nbsp;</div>
                                                                                                        <div class="col-md-5"><label for="lblBookingDays">Booking Period:</label></div>
                                                                                                        <div class="col-md-5">
                                                                                                            <asp:Label ID="lblBookingDays" runat="server"></asp:Label>
                                                                                                            <asp:HiddenField ID="hidBookingDays" runat="server" />
                                                                                                            <asp:HiddenField ID="hidRoomId" runat="server" />
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="row"><div class="col-md-12">&nbsp;</div></div>
                                                                                                    <div class="row">
                                                                                                        <div class="col-md-2">&nbsp;</div>
                                                                                                        <div class="col-md-5"><label for="lblRate">Rate :</label></div>
                                                                                                        <div class="col-md-5">
                                                                                                            <asp:Label ID="lblRate" runat="server"></asp:Label>
                                                                                                            <asp:HiddenField ID="hidRate" runat="server" />
                                                                                                            <asp:HiddenField ID="hidRateType" runat="server" />
                                                                                                            <asp:HiddenField ID="hidRateId" runat="server" />
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="row"><div class="col-md-12">&nbsp;</div></div>
                                                                                                    <div class="row">
                                                                                                        <div class="col-md-2">&nbsp;</div>
                                                                                                        <div class="col-md-5"><label for="lblCostAfterDiscount">Cost :</label></div>
                                                                                                        <div class="col-md-5">
                                                                                                            <asp:Label ID="lblCostAfterDiscount" runat="server"></asp:Label>
                                                                                                            <asp:HiddenField ID="hidCostAfterDiscount" runat="server" />
                                                                                                            <asp:HiddenField ID="hidDiscountOffered" runat="server" />
                                                                                                            <asp:HiddenField ID="hidTotalCost" runat="server" />
                                                                                                            <asp:HiddenField ID="hidDiscountId" runat="server" />
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="row"><div class="col-md-12">&nbsp;</div></div>
                                                                                                    <div class="row">
                                                                                                        <div class="col-md-2">&nbsp;</div>
                                                                                                        <div class="col-md-4">&nbsp;</div>
                                                                                                        <div class="col-md-6">
                                                                                                            <asp:LinkButton ID="lnkBookNow" runat="server" class="btn btn-default btn-sm" CommandArgument='<%# Bind("RoomType_ID") %>' CommandName="BookNow">
                                                                                                                                                Book Now
                                                                                                            <span class="glyphicon glyphicon-step-forward" aria-hidden="true"></span>
                                                                                                            </asp:LinkButton>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                        </Columns>
                                                                                    </asp:GridView>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="panel-footer">
                                                                            <div class="row">
                                                                                <div class="col-md-4">&nbsp;</div>
                                                                                <div class="col-md-4">
                                                                                    &nbsp;
                                                                                </div>
                                                                                <div class="col-md-4">&nbsp;</div>
                                                                            </div>
                                                                        </div>
                                                                    </asp:Panel>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
         <asp:Panel ID="PnlImage" runat="server" Style="display: none">
            <asp:Image ID="FullImage" runat="server" />
            <%--<asp:Button ID="btnClose" runat="server" CssClass="CloseButton"/>--%>
             <asp:ImageButton ID="btnClose" runat="server" CssClass="CloseButton"/>
        </asp:Panel>
        <asp:Button ID="BtnHidden" runat="server" Text="Hidden" Style="display: none" />
        <ajaxToolkit:ModalPopupExtender ID="FullImageModalPopupExtender" TargetControlID="BtnHidden" PopupControlID="PnlImage"
            BehaviorID="MPEImage" CancelControlID="btnClose" runat="server">
        </ajaxToolkit:ModalPopupExtender>

        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="myRoomTypeUpdateProgress" runat="server">
        <ProgressTemplate>
            <div style="background-color: Gray; filter: alpha(opacity=80); opacity: 0.80; width: 100%; top: 0px; left: 0px; position: fixed; height: 800px;">
            </div>
            <div style="margin: auto; font-family: Trebuchet MS; filter: alpha(opacity=100); opacity: 1; font-size: small; vertical-align: middle; top: auto; position: absolute; right: auto; color: #FFFFFF;">
                <table width="100%">
                    <tr>
                        <td align="center" valign="middle">
                            <span style="font-family: Georgia; font-size: medium; font-weight:bold ; color: #FFFFFF">Loading....</span><br />
                            <img src="Images/progress.gif" alt="Loading..." /></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

