<%@ page title="" language="C#" masterpagefile="~/OnlineSite.master" autoeventwireup="true" inherits="Index, App_Web_wxkg3lpr" enableeventvalidation="False" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="Server">
    <%--<link type="text/css" rel="stylesheet" href="/Scripts/js/view.css" />--%>
    <asp:UpdatePanel ID="searchPanel" runat="server">
        <ContentTemplate>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#photos').galleryView({
                        panel_width: 800,
                        panel_height: 500,
                        frame_width: 100,
                        frame_height: 100,
                        nav_theme: 'custom'
                    });
                });
            </script>
            <style type="text/css">
                .modalBackground {
                    background-color: Gray;
                    filter: alpha(opacity=100);
                    opacity: 0.8;
                    z-index: 10000;
                }
            </style>
            <div class="container form-inline">
                <div class="row">
                    <div class="col-md-12">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-1">&nbsp;</div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="txtFromDate">Check In</label><br />
                            <asp:TextBox ID="txtFromDate" runat="server" class="input-md form-control" placeholder="mm/dd/yyyy" autocomplete="off" Width="200px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="txtFromDateExtender" PopupButtonID="imgPopup" runat="server" TargetControlID="txtFromDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="txtToDate">Check Out</label><br />
                            <asp:TextBox ID="txtToDate" runat="server" class="input-md form-control" placeholder="mm/dd/yyyy" autocomplete="off" Width="200px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="txtToDateExtender" PopupButtonID="imgPopup" runat="server" TargetControlID="txtToDate" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                        </div>
                    </div>

                    <div class="col-md-1">
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
                        </div>
                    </div>
                    <div class="col-md-1">
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
                        </div>
                    </div>
                    <div class="col-md-1">
                        <div class="form-group">
                            <br />
                            <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-primary" OnClick="btnSearch_Click" />
                        </div>
                    </div>
                    <div class="col-md-1">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                </div>
            </div>
            <asp:Panel ID="pnlResults" runat="server">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Results</h1>
                        <div class="row">
                            <div class="col-md-12">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <asp:DataList ID="roomTypesList" runat="server" OnItemDataBound="roomTypesList_ItemDataBound"
                                    RepeatColumns="1" RepeatDirection="Horizontal" DataKeyField="RoomType_ID" RepeatLayout="Flow" GridLines="Horizontal"
                                    OnItemCommand="roomTypesList_ItemCommand">
                                    <ItemTemplate>
                                        <div class="row">
                                            <asp:Panel ID="dataPanel" runat="server" CssClass="collapsePanelHeader">
                                                <div class="col-md-2">
                                                    <asp:HiddenField ID="hidIsOnline" runat="server" Value='<%# Bind("IsOnline") %>' />
                                                    <asp:HiddenField ID="hidRoomTypeID" runat="server" Value='<%# Bind("RoomType_ID") %>' />
                                                    <asp:HiddenField ID="hidRoomType" runat="server" Value='<%# Bind("RoomType_EN") %>' />
                                                    <div class="thumbnail">
                                                        <asp:Image ID="roomTypeDefaultImage" runat="server" />
                                                    </div>
                                                </div>
                                                <%--<div class="col-md-2">
                                            
                                                    <label for="lblId">ID : </label>
                                                    <asp:Label ID="lblId" runat="server"></asp:Label><br />
                                                    <label for="lblRooms">Rooms : </label>
                                                    <asp:Label ID="lblRooms" runat="server"></asp:Label><br />
                                                    <label for="lblBedRooms">Bed Rooms : </label>
                                                    <asp:Label ID="lblBedRooms" runat="server"></asp:Label><br />
                                                    <label for="lblLivingRooms">Living Rooms : </label>
                                                    <asp:Label ID="lblLivingRooms" runat="server"></asp:Label><br />
                                                    <label for="lblBathrooms">Bathrooms : </label>
                                                    <asp:Label ID="lblBathrooms" runat="server"></asp:Label><br />
                                                    <label for="lblKitchens">Kitchens : </label>
                                                    <asp:Label ID="lblKitchens" runat="server"></asp:Label><br />
                                                </div>--%>
                                                <div class="col-md-6">
                                                    <label for="lblDetails">
                                                    </label>
                                                    <asp:Label ID="lblDetails" runat="server"></asp:Label>
                                                    <br />
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="lblBookingDays">
                                                                Booking Period:
                                                            </label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:Label ID="lblBookingDays" runat="server"></asp:Label>
                                                            <asp:HiddenField ID="hidBookingDays" runat="server" />
                                                            <asp:HiddenField ID="hidRoomId" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="lblRate">
                                                                Rate :</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:Label ID="lblRate" runat="server"></asp:Label>
                                                            <asp:HiddenField ID="hidRate" runat="server" />
                                                            <asp:HiddenField ID="hidRateType" runat="server" />
                                                            <asp:HiddenField ID="hidRateId" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="lblCostAfterDiscount">
                                                                Cost :</label>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:Label ID="lblCostAfterDiscount" runat="server"></asp:Label>
                                                            <asp:HiddenField ID="hidCostAfterDiscount" runat="server" />
                                                            <asp:HiddenField ID="hidDiscountOffered" runat="server" />
                                                            <asp:HiddenField ID="hidTotalCost" runat="server" />
                                                            <asp:HiddenField ID="hidDiscountId" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            &nbsp;
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <asp:LinkButton ID="lnkBookNow" runat="server" class="btn btn-default btn-sm" CommandArgument='<%# Bind("RoomType_ID") %>' CommandName="BookNow">
                                                                    Book Now
                                                                    <span class="glyphicon glyphicon glyphicon-credit-card" aria-hidden="true"></span>
                                                            </asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                        <div class="row">
                                            <asp:Panel ID="imagePanel" runat="server" CssClass="collapsePanel" Height="0">
                                                <div class="col-md-12">
                                                    <asp:DataList ID="roomTypeImages" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                        <ItemTemplate>
                                                            <asp:HiddenField ID="hidRoomTypeId" runat="server" Value='<%# Bind("RoomType_ID") %>' />
                                                            <asp:ImageButton ID="imgRoomType" runat="server" Height="100" ImageUrl='<%# Bind("RoomType_ThumbnailPath") %>' OnClick="imgRoomType_Click" Width="100" />
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                        <ajaxToolkit:CollapsiblePanelExtender ID="cpeDemo" runat="Server" CollapseControlID="roomTypeDefaultImage" Collapsed="True" CollapsedImage="~/images/expand_blue.jpg" CollapsedText="(Show Pictures...)" ExpandControlID="roomTypeDefaultImage" ExpandedImage="~/images/collapse_blue.jpg" ExpandedText="(Hide Pictures...)" ImageControlID="Image1" SuppressPostBack="true" TargetControlID="imagePanel" TextLabelID="Label1" />
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label Visible='<%#bool.Parse((roomTypesList.Items.Count==0).ToString())%>'
                                            runat="server" ID="lblNoRecord" Text=" Your search yielded no rooms available for the chosen criteria. Please try again!" ForeColor="Red"></asp:Label>

                                    </FooterTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                &nbsp;
                            </div>
                            <div class="col-md-4">
                                <asp:LinkButton ID="lnkPrevious" runat="server" class="btn btn-default btn-sm"
                                    OnClick="lnkPrevious_Click">
                                    <span class="glyphicon glyphicon-backward" aria-hidden="true"></span>
                                </asp:LinkButton>
                                <asp:HiddenField ID="hidPageCount" runat="server"></asp:HiddenField>
                                <asp:LinkButton ID="lnkNext" runat="server" class="btn btn-default btn-sm"
                                    OnClick="lnkNext_Click">
                                    <span class="glyphicon glyphicon-forward" aria-hidden="true"></span>
                                </asp:LinkButton>
                            </div>
                            <div class="col-md-4">&nbsp;</div>
                        </div>
                        <div class="row">
                            <div class="col-md-10">
                                <asp:LinkButton ID="lbSlideShow" runat="server" Style="display: none">
                                Slide Show
                                </asp:LinkButton>
                                <asp:Panel ID="panelModalPopup" runat="server" Style="display: none; width: 800px;"
                                    CssClass="modalPopup">
                                    <%--<asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn btn-primary"/>--%>
                                    <button type="button" class="btn btn-default" aria-label="Left Align" id="btnClose" runat="server">
                                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                    </button>

                                    <!-- BEGIN: Main Strip to display focused Image Details. -->
                                    <div id="photos" class="galleryview">
                                        <asp:Repeater ID="rptrImage" runat="server">
                                            <ItemTemplate>
                                                <div class="panel">
                                                    <%--<img src='<%#Eval("ImagePath") %>' /> --%>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("RoomType_ImagePath") %>' />
                                                    <div class="panel-overlay">
                                                        <h2><%# Eval("RoomType_ImageName") %></h2>
                                                        <p>
                                                            Description: <b><%# Eval("Image_Size") %></b><br />
                                                            View full-size photo 
                                                                                            <a href='<%#Eval("RoomType_ImagePath") %>' target="_blank">here</a>.
                                                        </p>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                        <!-- Strip to display the bottom slideshow. -->
                                        <ul class="filmstrip">
                                            <asp:Repeater ID="rptrThumbnail" runat="server">
                                                <ItemTemplate>
                                                    <li>
                                                        <%--<img width="100" height="100" src='<%#Eval("ImagePath") %>' 
                                                                             alt='<%#Eval("Image_Summary") %>' title='<%# Eval("Image_Name") %>' />--%>
                                                        <asp:Image ID="imgRoomType" runat="server" Width="100" Height="100" ImageUrl='<%# Eval("RoomType_ThumbnailPath") %>' /></li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ul>
                                    </div>
                                    <!-- END: Main Strip to display focused Image Details. -->
                                </asp:Panel>
                                <ajaxToolkit:ModalPopupExtender ID="MyModalPopupExtender" runat="server"
                                    PopupControlID="panelModalPopup"
                                    OkControlID="btnClose" BackgroundCssClass="modalBackground"
                                    DropShadow="true"
                                    TargetControlID="lbSlideShow" />
                            </div>
                        </div>

                    </div>

                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

