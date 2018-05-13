<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="test, App_Web_wxkg3lpr" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="Server">
    <link type="text/css" rel="stylesheet" href="/Scripts/js/view.css" />
    <script type="text/javascript" src="/Scripts/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/Scripts/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="/Scripts/js/jquery-galleryview-1.1/jquery.galleryview-1.1.js"></script>
    <script type="text/javascript" src="/Scripts/js/jquery-galleryview-1.1/jquery.timers-1.1.2.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#photos').galleryView({
                panel_width: 800,
                panel_height: 300,
                frame_width: 100,
                frame_height: 100,
                nav_theme: 'custom'
            });
        });
    </script> 

    <script>
        $(function () {
            $("#MainContent_txtFromDate").datepicker();
        });

        $(function () {
            $("#MainContent_txtToDate").datepicker();
        });
    </script>
<style type="text/css">
    .modalBackground
    {
        background-color: Gray;
        filter: alpha(opacity=80);
        opacity: 0.8;
        z-index: 10000;
    }
</style>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <nav class="navbar navbar-default navbar-static-top">
        <div class="container form-inline">
            <div class="form-group">
                <label for="txtSearchTerm">Search</label><br />
                <asp:TextBox ID="txtSearchTerm" runat="server" class="form-control" placeholder="Search"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtFromDate">Check In</label><br />
                <asp:TextBox ID="txtFromDate" runat="server" class="input-md form-control" placeholder="Check In: mm/dd/yyyy" Width="200px"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtToDate">Check Out</label><br />
                <asp:TextBox ID="txtToDate" runat="server" class="input-md form-control" placeholder="Check Out: mm/dd/yyyy" Width="200px"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="drpNumberOfRooms">Rooms</label>
                <asp:DropDownList ID="drpNumberOfRooms" runat="server" class="form-control input input-md">
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
                </asp:DropDownList>
            </div>
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
            <div class="form-group">
                <label for="drpNumberOfChildren">Children</label>
                <asp:DropDownList ID="drpNumberOfChildren" runat="server" class="form-control input input-md">
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
            <div class="form-group">
                <br />
                <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-primary" OnClick="btnSearch_Click" />
            </div>
        </div>
    </nav>
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>
                    <h3>Results</h3>
                </legend>
                <div class="row">
                    <%--<div class="col-sm-2">&nbsp;</div>--%>
                    <div class="col-md-12">
                        <ul class="nav nav-pills nav-justified">
                            <li role="presentation" class="">Sort Results by</li>
                            <li role="presentation" class="">Recommended</li>
                            <li role="presentation" class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Price <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li role="presentation" class=""><a href="#">Price, high to low</a></li>
                                    <li role="presentation" class=""><a href="#">Price, low to high</a></li>
                                </ul>

                            </li>
                            <li role="presentation" class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Living Rooms <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li role="presentation" class=""><a href="#">Living Rooms, high to low</a></li>
                                    <li role="presentation" class=""><a href="#">Living Rooms, low to high</a></li>
                                </ul>
                            </li>
                            <li role="presentation" class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Occupancy <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li role="presentation" class=""><a href="#">Occupancy, high to low</a></li>
                                    <li role="presentation" class=""><a href="#">Occupancy, low to high</a></li>
                                </ul>
                            </li>
                            <li role="presentation" class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Rooms <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li role="presentation" class=""><a href="#">Rooms, high to low</a></li>
                                    <li role="presentation" class=""><a href="#">Rooms, low to high</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <hr />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:DataList ID="roomTypesList" runat="server" OnItemDataBound="roomTypesList_ItemDataBound"
                            RepeatColumns="1" RepeatDirection="Horizontal" DataKeyField="RoomType_ID" RepeatLayout="Flow">

                            <ItemTemplate>
                                <div class="row">
                                    <asp:Panel ID="dataPanel" runat="server" CssClass="collapsePanelHeader" Height="30px">

                                        <div class="col-md-2">
                                            <asp:HiddenField ID="hidIsOnline" runat="server" Value='<%# Bind("IsOnline") %>'></asp:HiddenField>
                                            <div class="thumbnail">
                                                <asp:Image ID="roomTypeDefaultImage" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label for="lblRoomTypeId">RoomType ID : </label>
                                            <asp:Label ID="lblRoomTypeId" runat="server"></asp:Label><br />
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

                                        </div>
                                        <div class="col-md-4">
                                            <label for="lblDetails"></label>
                                            <asp:Label ID="lblDetails" runat="server"></asp:Label><br />
                                        </div>
                                        <div class="col-md-2">
                                            Price
                                        </div>

                                    </asp:Panel>
                                </div>
                                <div class="row">
                                    <asp:Panel ID="imagePanel" runat="server" CssClass="collapsePanel" Height="0">
                                        <div class="col-md-12">
                                            <asp:DataList ID="roomTypeImages" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                <ItemTemplate>
                                                    <asp:HiddenField ID="hidRoomTypeId" runat="server" Value='<%# Bind("RoomType_ID") %>'></asp:HiddenField>
                                                    <asp:ImageButton ID="imgRoomType" runat="server" Width="100" Height="100" ImageUrl='<%# Bind("RoomType_ThumbnailPath") %>' OnClick="imgRoomType_Click"/>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </div>
                                    </asp:Panel>
                                </div>
                                <ajaxToolkit:CollapsiblePanelExtender ID="cpeDemo" runat="Server" TargetControlID="imagePanel"
                                    ExpandControlID="dataPanel" CollapseControlID="dataPanel" Collapsed="True" TextLabelID="Label1"
                                    ImageControlID="Image1" ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)"
                                    ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                                    SuppressPostBack="true" />
                            </ItemTemplate>
                        </asp:DataList>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:LinkButton ID="lnkPrevious" runat="server"
                            OnClick="lnkPrevious_Click"><< Previous</asp:LinkButton>
                        &nbsp;
                       <asp:LinkButton ID="lnkNext" runat="server"
                           OnClick="lnkNext_Click">Next >></asp:LinkButton>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                    <asp:LinkButton ID="lbSlideShow" runat="server" style="display:none">
                        Slide Show
                    </asp:LinkButton>
                        <asp:Panel ID="panelModalPopup" runat="server" Style="display: none; width: 700px;"
                        CssClass="modalPopup">
                       
                            <!-- Main Strip to display focused Image Details. -->
                                                     <div id="photos" class="galleryview">
                                                        <asp:Repeater ID="rptrImage" runat="server">
                                                        <ItemTemplate>
                                                          <div class="panel"> 
                                                                <%--<img src='<%#Eval("ImagePath") %>' /> --%>
                                                              <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("RoomType_ImagePath") %>' /> 
                                                              <div class="panel-overlay"> 
                                                                    <h2><%# Eval("RoomType_ImageName") %></h2> 
                                                                    <p>Description: <b><%# Eval("Image_Size") %></b><br />  View full-size photo 
                                                                                    <a href='<%#Eval("RoomType_ImagePath") %>' target="_blank">here</a>.</p> 
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
                                                                <asp:Image ID="imgRoomType" runat="server" width="100" height="100" ImageUrl='<%# Eval("RoomType_ThumbnailPath") %>' /></li>
                                                        </ItemTemplate>
                                                        </asp:Repeater>
                                                        </ul>
                                                        </div>
                            <!--------------->


                        
                            <asp:ImageButton ID="lbSlideClose" runat="server" ImageUrl="~/Images/delete.PNG" />

                            
                                                
                    
                        </asp:Panel>
                    <ajaxToolkit:ModalPopupExtender ID="MyModalPopupExtender" runat="server" 
                        PopupControlID="panelModalPopup"
                        OkControlID="lbSlideClose" BackgroundCssClass="modalBackground" 
                        DropShadow="true"
                        TargetControlID="lbSlideShow" />


                    </div>
                </div>
            </fieldset>
        </div>

    </div>
</asp:Content>

