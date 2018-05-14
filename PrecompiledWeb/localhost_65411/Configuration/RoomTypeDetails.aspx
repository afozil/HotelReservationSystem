<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Configuration_RoomTypeDetails, App_Web_uh3qsns0" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <link type="text/css" rel="stylesheet" href="../Scripts/js/view.css" />
    <script type="text/javascript" src="../Scripts/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../Scripts/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="../Scripts/js/jquery-galleryview-1.1/jquery.galleryview-1.1.js"></script>
    <script type="text/javascript" src="../Scripts/js/jquery-galleryview-1.1/jquery.timers-1.1.2.js"></script>
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
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>
                    <h1>Online Room Details</h1>
                </legend>
                <!-- Room Spec -->
                <div class="row">
                    <div class="col-md-12">
                        <ajaxToolkit:Accordion ID="MyAccordion" runat="server"
                            SelectedIndex="0"
                            HeaderCssClass="accordionHeader"
                            ContentCssClass="accordionContent"
                            FadeTransitions="true"
                            FramesPerSecond="40"
                            TransitionDuration="250"
                            AutoSize="None">
                            <Panes>
                                <ajaxToolkit:AccordionPane ID="RoomDetailsPane" runat="server">
                                    <Header>
                                        <a href="" onclick="return false;" class="list-group-item active">
                                            <span class="glyphicon glyphicon-folder"></span>
                                            &nbsp;Room Type Details
                                                        <span class="badge"></span>
                                        </a>
                                    </Header>
                                    <Content>
                                        <a href="#" class="list-group-item">
                                            
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:HiddenField ID="hidRoomTypeId" runat="server" />
                                                    <asp:HiddenField ID="hidRoomTypeOnlineId" runat="server" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">&nbsp;</div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label for="txtDescription">Description</label>
                                                    <asp:TextBox ID="txtDescription" runat="server" 
                                                        TextMode="MultiLine" class="form-control" 
                                                        Rows="15" placeholder="Description"></asp:TextBox>
                                                    <ajaxToolkit:HtmlEditorExtender ID="txtDescriptionExtender"
                                                        TargetControlID="txtDescription" DisplaySourceTab="true"
                                                        runat="server"  />
                                                    <toolbar> 
                                                        <ajaxToolkit:Undo />
                                                        <ajaxToolkit:Redo />
                                                        <ajaxToolkit:Bold />
                                                        <ajaxToolkit:Italic />
                                                        <ajaxToolkit:Underline />
                                                        <ajaxToolkit:StrikeThrough />
                                                        <ajaxToolkit:Subscript />
                                                        <ajaxToolkit:Superscript />
                                                        <ajaxToolkit:JustifyLeft />
                                                        <ajaxToolkit:JustifyCenter />
                                                        <ajaxToolkit:JustifyRight />
                                                        <ajaxToolkit:JustifyFull />
                                                        <ajaxToolkit:InsertOrderedList />
                                                        <ajaxToolkit:InsertUnorderedList />
                                                        <ajaxToolkit:CreateLink />
                                                        <ajaxToolkit:UnLink />
                                                        <ajaxToolkit:RemoveFormat />
                                                        <ajaxToolkit:SelectAll />
                                                        <ajaxToolkit:UnSelect />
                                                        <ajaxToolkit:Delete />
                                                        <ajaxToolkit:Cut />
                                                        <ajaxToolkit:Copy />
                                                        <ajaxToolkit:Paste />
                                                        <ajaxToolkit:BackgroundColorSelector />
                                                        <ajaxToolkit:ForeColorSelector />
                                                        <ajaxToolkit:FontNameSelector />
                                                        <ajaxToolkit:FontSizeSelector />
                                                        <ajaxToolkit:Indent />
                                                        <ajaxToolkit:Outdent />
                                                        <ajaxToolkit:InsertHorizontalRule />
                                                        <ajaxToolkit:HorizontalSeparator />
                                                        <ajaxToolkit:InsertImage />
                                                    </toolbar>
                                                    </ajaxToolkit:HtmlEditorExtender>											
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">&nbsp;</div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <asp:Button ID="btnSave" runat="server" Text="Save" class="forms-control btn btn-primary btn-md" OnClick="btnSave_Click" />
                                                    &nbsp
                                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="forms-control btn btn-default btn-md" OnClick="btnCancel_Click" CausesValidation="false" />
                                                </div>
                                                <div class="col-md-8">
                                                    <asp:Label ID="lblResult" runat="server" Text="" ForeColor="Red"></asp:Label>
                                                </div>
                                            </div>
                                            <span class="badge"></span>
                                        </a>
                                    </Content>
                                </ajaxToolkit:AccordionPane>
                                <ajaxToolkit:AccordionPane ID="ImagesPane" runat="server">
                                    <Header>
                                        <a href="" onclick="return false;" class="list-group-item active">
                                            <span class="glyphicon glyphicon-folder"></span>
                                            &nbsp;Room Type Images
                                                        <span class="badge"></span>
                                        </a>
                                    </Header>
                                    <Content>
                                        <a href="#" class="list-group-item">
                                            <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                                            <label for="upldImage">Upload Image</label>
                                                                            <asp:FileUpload ID="upldImage" runat="server" class="form-control input input-md" />
                                                            
                                                            <button id="btnUpload" runat="server" class="btn btn-primary btn-md" onserverclick="btnUpload_Click" causesvalidation="false">
                                                                            <span class="glyphicon glyphicon-upload" aria-hidden="true"></span>Upload
                                                                        </button>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <asp:DataList ID="imagesList" runat="server" BorderColor="#666666"
                                                            BorderStyle="Inset" BorderWidth="1px" CellPadding="3" CellSpacing="2"
                                                            Font-Names="Verdana" Font-Size="Small" GridLines="Both" RepeatColumns="2" RepeatDirection="Horizontal"
                                                            DataKeyField="RoomType_ImageID" OnDeleteCommand="imagesList_DeleteCommand">
                                                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                                            <HeaderStyle BackColor="#333333" Font-Bold="True" Font-Size="Large" ForeColor="White"
                                                                HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <HeaderTemplate>
                                                                Room Type Pictures
                                                            </HeaderTemplate>
                                                            <ItemTemplate>

                                                                <%--<asp:ImageButton ID="roomTypeImage" runat="server" ImageUrl='<%#Eval("RoomType_Thumbnail").ToString() == ""?"": GetImageString64((byte[])Eval("RoomType_Thumbnail")) %>' />--%>
                                                                <asp:Image ID="roomTypeImage" runat="server" ImageUrl='<%# Bind("RoomType_ThumbnailPath") %>'/>
                                                                <p>
                                                                    <label for="lblImgName">Name</label>
                                                                    <asp:Label ID="lblImgName" runat="server" Text='<%# Bind("RoomType_ImageName") %>'></asp:Label>
                                                                    <br />
                                                                    <label for="lblContentType">Content Type:</label>
                                                                    <asp:Label ID="lblContentType" runat="server" Text='<%# Bind("Image_ContentType") %>'></asp:Label>
                                                                    <br />
                                                                    <label for="lblSize">Size:</label>
                                                                    <asp:Label ID="lblSize" runat="server" Text='<%# Bind("Image_Size") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Button ID="Delete" runat="server" class="btn btn-primary" Text="Delete" CommandName="delete" CausesValidation="false" />
                                                                </p>
                                                            </ItemTemplate>

                                                        </asp:DataList>

                                                    </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lblUploadResult" runat="server" Text="" ForeColor="Red"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
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
                                                
                                                </div>
                                            </div>
                                            <span class="badge"></span>
                                        </a>
                                    </Content>
                                </ajaxToolkit:AccordionPane>
                            </Panes>
                        </ajaxToolkit:Accordion>
                    </div>
                </div>
                <!-- Room Spec -->


            </fieldset>
        </div>
    </div>
</asp:Content>

