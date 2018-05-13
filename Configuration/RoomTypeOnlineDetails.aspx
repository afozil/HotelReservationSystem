<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RoomTypeOnlineDetails.aspx.cs" Inherits="Configuration_RoomTypeOnlineDetails" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript" src="../Site2_references/jssor.slider.min.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            var jssor_1_SlideshowTransitions = [
                { $Duration: 1200, x: 0.3, $During: { $Left: [0.3, 0.7] }, $Easing: { $Left: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, x: -0.3, $SlideOut: true, $Easing: { $Left: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, x: -0.3, $During: { $Left: [0.3, 0.7] }, $Easing: { $Left: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, x: 0.3, $SlideOut: true, $Easing: { $Left: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, y: 0.3, $During: { $Top: [0.3, 0.7] }, $Easing: { $Top: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, y: -0.3, $SlideOut: true, $Easing: { $Top: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, y: -0.3, $During: { $Top: [0.3, 0.7] }, $Easing: { $Top: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, y: 0.3, $SlideOut: true, $Easing: { $Top: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, x: 0.3, $Cols: 2, $During: { $Left: [0.3, 0.7] }, $ChessMode: { $Column: 3 }, $Easing: { $Left: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, x: 0.3, $Cols: 2, $SlideOut: true, $ChessMode: { $Column: 3 }, $Easing: { $Left: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, y: 0.3, $Rows: 2, $During: { $Top: [0.3, 0.7] }, $ChessMode: { $Row: 12 }, $Easing: { $Top: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, y: 0.3, $Rows: 2, $SlideOut: true, $ChessMode: { $Row: 12 }, $Easing: { $Top: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, y: 0.3, $Cols: 2, $During: { $Top: [0.3, 0.7] }, $ChessMode: { $Column: 12 }, $Easing: { $Top: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, y: -0.3, $Cols: 2, $SlideOut: true, $ChessMode: { $Column: 12 }, $Easing: { $Top: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, x: 0.3, $Rows: 2, $During: { $Left: [0.3, 0.7] }, $ChessMode: { $Row: 3 }, $Easing: { $Left: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, x: -0.3, $Rows: 2, $SlideOut: true, $ChessMode: { $Row: 3 }, $Easing: { $Left: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, x: 0.3, y: 0.3, $Cols: 2, $Rows: 2, $During: { $Left: [0.3, 0.7], $Top: [0.3, 0.7] }, $ChessMode: { $Column: 3, $Row: 12 }, $Easing: { $Left: $Jease$.$InCubic, $Top: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, x: 0.3, y: 0.3, $Cols: 2, $Rows: 2, $During: { $Left: [0.3, 0.7], $Top: [0.3, 0.7] }, $SlideOut: true, $ChessMode: { $Column: 3, $Row: 12 }, $Easing: { $Left: $Jease$.$InCubic, $Top: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, $Delay: 20, $Clip: 3, $Assembly: 260, $Easing: { $Clip: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, $Delay: 20, $Clip: 3, $SlideOut: true, $Assembly: 260, $Easing: { $Clip: $Jease$.$OutCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, $Delay: 20, $Clip: 12, $Assembly: 260, $Easing: { $Clip: $Jease$.$InCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 },
                { $Duration: 1200, $Delay: 20, $Clip: 12, $SlideOut: true, $Assembly: 260, $Easing: { $Clip: $Jease$.$OutCubic, $Opacity: $Jease$.$Linear }, $Opacity: 2 }
            ];

            var jssor_1_options = {
                $AutoPlay: 1,
                $SlideshowOptions: {
                    $Class: $JssorSlideshowRunner$,
                    $Transitions: jssor_1_SlideshowTransitions,
                    $TransitionsOrder: 1
                },
                $ArrowNavigatorOptions: {
                    $Class: $JssorArrowNavigator$
                },
                $ThumbnailNavigatorOptions: {
                    $Class: $JssorThumbnailNavigator$,
                    $Cols: 5,
                    $SpacingX: 5,
                    $SpacingY: 5,
                    $Align: 390
                }
            };

            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

            /*#region responsive code begin*/

            var MAX_WIDTH = 980;

            function ScaleSlider() {
                var containerElement = jssor_1_slider.$Elmt.parentNode;
                var containerWidth = containerElement.clientWidth;

                if (containerWidth) {

                    var expectedWidth = Math.min(MAX_WIDTH || containerWidth, containerWidth);

                    jssor_1_slider.$ScaleWidth(expectedWidth);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }

            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            /*#endregion responsive code end*/
        });
    </script>
    <style>
        /* jssor slider loading skin spin css */
        .jssorl-009-spin img {
            animation-name: jssorl-009-spin;
            animation-duration: 1.6s;
            animation-iteration-count: infinite;
            animation-timing-function: linear;
        }

        @keyframes jssorl-009-spin {
            from {
                transform: rotate(0deg);
            }

            to {
                transform: rotate(360deg);
            }
        }


        .jssora106 {
            display: block;
            position: absolute;
            cursor: pointer;
        }

            .jssora106 .c {
                fill: #fff;
                opacity: .3;
            }

            .jssora106 .a {
                fill: none;
                stroke: #000;
                stroke-width: 350;
                stroke-miterlimit: 10;
            }

            .jssora106:hover .c {
                opacity: .5;
            }

            .jssora106:hover .a {
                opacity: .8;
            }

            .jssora106.jssora106dn .c {
                opacity: .2;
            }

            .jssora106.jssora106dn .a {
                opacity: 1;
            }

            .jssora106.jssora106ds {
                opacity: .3;
                pointer-events: none;
            }

        .jssort101 .p {
            position: absolute;
            top: 0;
            left: 0;
            box-sizing: border-box;
            background: #000;
        }

            .jssort101 .p .cv {
                position: relative;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                border: 2px solid #000;
                box-sizing: border-box;
                z-index: 1;
            }

        .jssort101 .a {
            fill: none;
            stroke: #fff;
            stroke-width: 400;
            stroke-miterlimit: 10;
            visibility: hidden;
        }

        .jssort101 .p:hover .cv, .jssort101 .p.pdn .cv {
            border: none;
            border-color: transparent;
        }

        .jssort101 .p:hover {
            padding: 2px;
        }

            .jssort101 .p:hover .cv {
                background-color: rgba(0,0,0,6);
                opacity: .35;
            }

            .jssort101 .p:hover.pdn {
                padding: 0;
            }

                .jssort101 .p:hover.pdn .cv {
                    border: 2px solid #fff;
                    background: none;
                    opacity: .35;
                }

        .jssort101 .pav .cv {
            border-color: #fff;
            opacity: .35;
        }

        .jssort101 .pav .a, .jssort101 .p:hover .a {
            visibility: visible;
        }

        .jssort101 .t {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: none;
            opacity: .6;
        }

        .jssort101 .pav .t, .jssort101 .p:hover .t {
            opacity: 1;
        }
    </style>
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
                                        <%--<a href="#" class="list-group-item">--%>
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
                                                    runat="server" DisplayPreviewTab="true" EnableSanitization="false" />
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
                                        <%--</a>--%>
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
                                                        <asp:Image ID="roomTypeImage" runat="server" ImageUrl='<%# Bind("RoomType_ThumbnailPath") %>' />
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
                                            <div class="col-md-6">
                                                <asp:Label ID="lblUploadResult" runat="server" Text="" ForeColor="Red"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 980px; height: 480px; overflow: hidden; visibility: hidden;">
                                                    <!-- Loading Screen -->
                                                    <div data-u="loading" class="jssorl-009-spin" style="position: absolute; top: 0px; left: 0px; width: 100%; height: 100%; text-align: center; background-color: rgba(0,0,0,0.7);">
                                                        <img style="margin-top: -19px; position: relative; top: 50%; width: 38px; height: 38px;" src="../Site2_references/svg/spin.svg" />
                                                    </div>
                                                    <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 980px; height: 380px; overflow: hidden;">
                                                        <asp:Repeater ID="rptrImage" runat="server">
                                                            <ItemTemplate>
                                                                <div>
                                                                    <asp:Image ID="imageFull" data-u="image" runat="server" ImageUrl='<%#Eval("RoomType_ImagePath") %>' />
                                                                    <asp:Image ID="thumbImage" data-u="thumb" runat="server" ImageUrl='<%# Bind("RoomType_ThumbnailPath") %>' />
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <%--<div>
                <img data-u="image" src="/Site2_References/svg/980x380/031.jpg" />
                <img data-u="thumb" src="/Site2_References/svg/980x380/031-s190x90.jpg" />
            </div>
            <div>
                <img data-u="image" src="/Site2_References/svg/980x380/032.jpg" />
                <img data-u="thumb" src="/Site2_References/svg/980x380/032-s190x90.jpg" />
            </div>
            <div>
                <img data-u="image" src="/Site2_References/svg/980x380/033.jpg" />
                <img data-u="thumb" src="/Site2_References/svg/980x380/033-s190x90.jpg" />
            </div>
            <div>
                <img data-u="image" src="/Site2_References/svg/980x380/034.jpg" />
                <img data-u="thumb" src="/Site2_References/svg/980x380/034-s190x90.jpg" />
            </div>
            <div>
                <img data-u="image" src="/Site2_References/svg/980x380/035.jpg" />
                <img data-u="thumb" src="/Site2_References/svg/980x380/035-s190x90.jpg" />
            </div>
            <div>
                <img data-u="image" src="/Site2_References/svg/980x380/036.jpg" />
                <img data-u="thumb" src="/Site2_References/svg/980x380/036-s190x90.jpg" />
            </div>
            <div>
                <img data-u="image" src="/Site2_References/svg/980x380/037.jpg" />
                <img data-u="thumb" src="/Site2_References/svg/980x380/037-s190x90.jpg" />
            </div>
            <div>
                <img data-u="image" src="/Site2_References/svg/980x380/038.jpg" />
                <img data-u="thumb" src="/Site2_References/svg/980x380/038-s190x90.jpg" />
            </div>
            <div>
                <img data-u="image" src="/Site2_References/svg/980x380/039.jpg" />
                <img data-u="thumb" src="/Site2_References/svg/980x380/039-s190x90.jpg" />
            </div>
            <div>
                <img data-u="image" src="/Site2_References/svg/980x380/040.jpg" />
                <img data-u="thumb" src="/Site2_References/svg/980x380/040-s190x90.jpg" />
            </div>--%>
                                                        <%-- <div style="background-color:#ff7c28;">
                <div style="position:absolute;top:50px;left:50px;width:450px;height:62px;z-index:0;font-size:16px;color:#000000;line-height:24px;text-align:left;padding:5px;box-sizing:border-box;">Photos in this slider are to demostrate jssor slider,<br />
                    which are not licensed for any other purpose.
                </div>
                <img data-u="thumb" src="/Site2_References/svg/980x380/039.jpg" />
            </div>--%>
                                                    </div>
                                                    <!-- Thumbnail Navigator -->
                                                    <div data-u="thumbnavigator" class="jssort101" style="position: absolute; left: 0px; bottom: 0px; width: 980px; height: 100px; background-color: #000;" data-autocenter="1" data-scale-bottom="0.75">
                                                        <div data-u="slides">
                                                            <div data-u="prototype" class="p" style="width: 190px; height: 84px;">
                                                                <div data-u="thumbnailtemplate" class="t"></div>
                                                                <svg viewBox="0 0 16000 16000" class="cv">
                                                                    <circle class="a" cx="8000" cy="8000" r="3238.1"></circle>
                                                                    <line class="a" x1="6190.5" y1="8000" x2="9809.5" y2="8000"></line>
                                                                    <line class="a" x1="8000" y1="9809.5" x2="8000" y2="6190.5"></line>
                                                                </svg>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Arrow Navigator -->
                                                    <div data-u="arrowleft" class="jssora106" style="width: 55px; height: 55px; top: 162px; left: 30px;" data-scale="0.75">
                                                        <svg viewBox="0 0 16000 16000" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                                                            <circle class="c" cx="8000" cy="8000" r="6260.9"></circle>
                                                            <polyline class="a" points="7930.4,5495.7 5426.1,8000 7930.4,10504.3 "></polyline>
                                                            <line class="a" x1="10573.9" y1="8000" x2="5426.1" y2="8000"></line>
                                                        </svg>
                                                    </div>
                                                    <div data-u="arrowright" class="jssora106" style="width: 55px; height: 55px; top: 162px; right: 30px;" data-scale="0.75">
                                                        <svg viewBox="0 0 16000 16000" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                                                            <circle class="c" cx="8000" cy="8000" r="6260.9"></circle>
                                                            <polyline class="a" points="8069.6,5495.7 10573.9,8000 8069.6,10504.3 "></polyline>
                                                            <line class="a" x1="5426.1" y1="8000" x2="10573.9" y2="8000"></line>
                                                        </svg>
                                                    </div>
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

