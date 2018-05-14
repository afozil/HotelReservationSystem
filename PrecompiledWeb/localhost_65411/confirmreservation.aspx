<%@ page title="" language="C#" masterpagefile="~/OnlineInside.master" autoeventwireup="true" inherits="confirmreservation, App_Web_3u0vitlg" enableeventvalidation="False" %>
<asp:Content ID="BookingContent" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="conformReseversationPanel" runat="server">
        <ContentTemplate>
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
                            <a title="Confirm Reservation" href="confirmreservation.aspx">Confirm Reservation</a>
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
                                    <table align="left" style="border-collapse: collapse; width: 100%; border: medium none; background-color: rgb(6, 58, 86);">
                                        <tbody>
                                            <tr>
                                                <td style="border: medium none;">
                                                    <span style="font-size: 18pt; color: rgb(255, 255, 255);"></span>
                                                    <span style="font-size: 12pt;">
                                                        <span style="font-size: 18pt;">
                                                            <span style="font-size: 18pt; color: rgb(255, 255, 255);">&nbsp;&nbsp; Confirm My Reservation</span>
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
                                            <td style="border: medium none;">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="panel panel-info">
                                                                    <div class="panel-heading">
                                                                        <h3 class="panel-title">Payment Details</h3>
                                                                    </div>
                                                                    <div class="panel-body">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <asp:Panel ID="pnlStatus" runat="server" role="alert">
                                                                                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                                                                                        </asp:Panel>
                                                                                    </div>
                                                                                </div>
                                                                               <!-- Guest Info -->
                                                                                <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <span style="font-size: 10pt;"></span>
                                                                                        <span style="font-weight: bold; font-size: 12pt;"></span>
                                                                                        <span style="font-size: 18pt;">
                                                                                            <br>
                                                                                            <table align="left" style="border-collapse: collapse; width: 100%; border: medium none; background-color: rgb(6, 58, 86);">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td style="border: medium none;">
                                                                                                            <span style="font-size: 18pt; color: rgb(255, 255, 255);"></span>
                                                                                                            <span style="font-size: 12pt;">
                                                                                                                <span style="font-size: 18pt;">
                                                                                                                    <span style="font-size: 18pt; color: rgb(255, 255, 255);">&nbsp;&nbsp; Guest Info</span>
                                                                                                                </span>
                                                                                                            </span>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                            <br>
                                                                                        </span>
                                                                                        <br>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblGuestName">Guest Name</label>
                                                                                        <asp:Label ID="lblGuestName" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblGuestMobile">Guest Contact</label>
                                                                                        <asp:Label ID="lblGuestMobile" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">&nbsp;</div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblGuestCvd">Civil ID</label>
                                                                                        <asp:Label ID="lblGuestCvd" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblGuestEmail">Email</label>
                                                                                        <asp:Label ID="lblGuestEmail" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                                <!-- Reservation Info -->
                                                                                <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <span style="font-size: 10pt;"></span>
                                                                                        <span style="font-weight: bold; font-size: 12pt;"></span>
                                                                                        <span style="font-size: 18pt;">
                                                                                            <br>
                                                                                            <table align="left" style="border-collapse: collapse; width: 100%; border: medium none; background-color: rgb(6, 58, 86);">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td style="border: medium none;">
                                                                                                            <span style="font-size: 18pt; color: rgb(255, 255, 255);"></span>
                                                                                                            <span style="font-size: 12pt;">
                                                                                                                <span style="font-size: 18pt;">
                                                                                                                    <span style="font-size: 18pt; color: rgb(255, 255, 255);">&nbsp;&nbsp; Reservation Info</span>
                                                                                                                </span>
                                                                                                            </span>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                            <br>
                                                                                        </span>
                                                                                        <br>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblFromDate">Arrival Date</label>
                                                                                        <asp:Label ID="lblFromDate" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblToDate">Departure Date</label>
                                                                                        <asp:Label ID="lblToDate" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">&nbsp;</div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblAdults">Total Adults</label>
                                                                                        <asp:Label ID="lblAdults" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblKids">Total Kids</label>
                                                                                        <asp:Label ID="lblKids" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">&nbsp;</div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblRoomType">Room Type</label>
                                                                                        <asp:Label ID="lblRoomType" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblDays">No. Of Days</label>
                                                                                        <asp:Label ID="lblDays" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                                <!-- Ticket Info -->
                                                                               <%-- <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <span style="font-size: 10pt;"></span>
                                                                                        <span style="font-weight: bold; font-size: 12pt;"></span>
                                                                                        <span style="font-size: 18pt;">
                                                                                            <br>
                                                                                            <table align="left" style="border-collapse: collapse; width: 100%; border: medium none; background-color: rgb(6, 58, 86);">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td style="border: medium none;">
                                                                                                            <span style="font-size: 18pt; color: rgb(255, 255, 255);"></span>
                                                                                                            <span style="font-size: 12pt;">
                                                                                                                <span style="font-size: 18pt;">
                                                                                                                    <span style="font-size: 18pt; color: rgb(255, 255, 255);">&nbsp;&nbsp; Ticket Info</span>
                                                                                                                </span>
                                                                                                            </span>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                            <br>
                                                                                        </span>
                                                                                        <br>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblFerryAdults">Tickets for Adults</label>
                                                                                        <asp:Label ID="lblFerryAdults" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblFerryAdultsValidity">Valid On</label>
                                                                                        <asp:Label ID="lblFerryAdultsValidity" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">&nbsp;</div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblFerryKids">Tickets for Kids</label>
                                                                                        <asp:Label ID="lblFerryKids" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblFerryKidsValidity">Valid On</label>
                                                                                        <asp:Label ID="lblFerryKidsValidity" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">&nbsp;</div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblDepartureTickets">Departure from Faillaka</label>
                                                                                        <asp:Label ID="lblDepartureTickets" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblDepartureDate">Valid On</label>
                                                                                        <asp:Label ID="lblDepartureDate" Class="form-control" runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                </div>--%>
                                                                                <!-- Payment Info -->
                                                                                <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <span style="font-size: 10pt;"></span>
                                                                                        <span style="font-weight: bold; font-size: 12pt;"></span>
                                                                                        <span style="font-size: 18pt;">
                                                                                            <br>
                                                                                            <table align="left" style="border-collapse: collapse; width: 100%; border: medium none; background-color: rgb(6, 58, 86);">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td style="border: medium none;">
                                                                                                            <span style="font-size: 18pt; color: rgb(255, 255, 255);"></span>
                                                                                                            <span style="font-size: 12pt;">
                                                                                                                <span style="font-size: 18pt;">
                                                                                                                    <span style="font-size: 18pt; color: rgb(255, 255, 255);">&nbsp;&nbsp; Payment Info</span>
                                                                                                                </span>
                                                                                                            </span>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                            <br>
                                                                                        </span>
                                                                                        <br>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblRoomCharges">Room Charges</label>
                                                                                        <div class="input-group">
                                                                                            <span class="input-group-addon">KD</span>
                                                                                            <asp:Label ID="lblRoomCharges" Class="form-control" runat="server">
                                                                                            </asp:Label>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-md-6">&nbsp;
                                                                                        <%--<label for="lblFerryCharges">Ferry Charges</label>
                                                                                        <div class="input-group">
                                                                                            <span class="input-group-addon">KD</span>
                                                                                            <asp:Label ID="lblFerryCharges" runat="server" Class="form-control"></asp:Label>
                                                                                        </div>--%>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">&nbsp;</div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-6">
                                                                                        <label for="lblTotalCharges">Total Charges</label>
                                                                                        <div class="input-group">
                                                                                            <span class="input-group-addon">KD</span>
                                                                                            <asp:Label ID="lblTotalCharges" Class="form-control" runat="server">
                                                                                            </asp:Label>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-md-6">
                                                                                        <label for="drpCardType">Payment Type</label>
                                                                                        <asp:DropDownList ID="drpCardType" runat="server" class="form-control input-md">
                                                                                            <asp:ListItem Text="K-NET" Value="1" Selected></asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">&nbsp;</div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12"><h2>Terms & Conditions</h2>
                                                                                        <div class="panel-body" runat="server" style="overflow-y: scroll; height: 200px">
                                                                                            <div class="mid-width wrapItems" style="background-color: #fff; height: 300px">
                                                                                                <p>Last modified: October 25, 2017  </p>
                                                                                                <h3>Welcome to Failaka Online!</h3>
                                                                                                <table>
                                                                                                    <tr>
                                                                                                        <td style=" width:50% ; border:solid; border-color:burlywood">
                                                                                                            <h3>Instructions of Heritage Village Management</h3>
                                                                                                            <p> &#8226; When booking please check the following:<br />
                                                                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Receipt of receipt for delivery at reception and proof of identity.</p>
                                                                                                            <p>&#8226; In the case of cancelling the reservation by the guest, no payment is made by the village administration.</p>
                                                                                                            <p>&#8226; Do not allow exceeding the number allowed inside the house and the number includes servants.
</p>
                                                                                                            <p>&#8226; The guest is responsible for his / her full responsibility as recorded in the village register at entry.</p>
                                                                                                            <p>&#8226; It is strictly forbidden to bring any blankets, furniture, blankets or food to be used inside the house (excluding infant blankets and food), cooking utensils or food storage boxes.</p>
                                                                                                            <p>&#8226; The resort is family-run and no single or single occupancy is allowed.
</p>
                                                                                                            <p>&#8226; It is not permitted to change the name of the owner of the reservation upon arrival in the village.</p>
                                                                                                            <p>&#8226; When arriving at the village, the data is recorded at the reception desk of the guests inside the house and the civil ID of the husband and wife is given and a copy of the marriage contract is taken.</p>
                                                                                                            <p>&#8226; It is strictly forbidden to bring gas cylinders to be used in cooking inside the house because of the danger or other dangerous substances and the occupant acknowledges that he is responsible for all damages  that happens.</p>
                                                                                                            <p>&#8226; The shipping department shall check the dates of departure and return, not later than the date of departure from the village on departure day at 12:00 noon. In case of desire to stay inside the house longer, the reception must be checked.
</p>
                                                                                                            <p>&#8226; Every head of household is committed to the duty of supervision and supervision of his family and his followers within the village as a full responsibility for them.</p>
                                                                                                            <p>&#8226; The village administration is not responsible for any injuries that occur inside the village or any losses of the guest or any damage of any kind, cause or nature that may affect the guest or a member of his family or his followers or is located for any reason in the village where the guest is responsible for using the attachments the village.
</p>
                                                                                                            <p>&#8226; Do not use any noisy sound equipment indoors or in the hotel rooms.
</p>
                                                                                                            <p>&#8226; Food and drinks are not allowed from outside the village.
</p>
                                                                                                            <p>&#8226; The date of entering the house or room until after 14:00.
</p>
                                                                                                            <p>&#8226; Visitors are not permitted to visit guests unless they notify the village administration in advance.</p>
                                                                                                            <p>&#8226; In the event of any damage or loss inside the house that was discovered after the exit, the guest will bear the value of these damages or losses.
</p>
                                                                                                            <p>&#8226; Each house has a number of beds as shown at the booking desk. In case of any increase in the number of beds, please check the reception. The bed price is 25 KD per night. There is also a small empty refrigerator, a laundry and an electric kettle.
</p>
                                                                                                            <p>&#8226; Guests must adhere to the opening and closing times of the swimming pool and the appropriate swimwear, follow the procedures of the swimming pool and accompany children under 16 years of age.
</p>
                                                                                                            <p>&#8226; The village administration has the right to cancel the reservation for any guest who does not comply with the village's instructions without compensation.
</p>
                                                                                                            <p>&#8226; Animals of all kinds are prohibited.</p>
                                                                                                            <p>&#8226; In the case of the use of the phrase cars not to be attached to the car any type of motorcycles or Bajayat not allowed to enter the village.
</p>
                                                                                                            <p>&#8226; Village staff are at your service, so please cooperate with them for the convenience and recreation of all.

</p>
                                                                                                            <p></p>
                                                                                                            <p></p>
                                                                                                            <p></p>
                                                                                                        </td>
                                                                                                        <td style="width:50% ; border:solid; border-color:burlywood;direction:rtl; margin-top:-10px;vertical-align:top">
                                                                                                            <h3>&#1578;&#1593;&#1604;&#1610;&#1605;&#1575;&#1578; &#1575;&#1583;&#1575;&#1585;&#1577; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577; &#1575;&#1604;&#1578;&#1585;&#1575;&#1579;&#1610;&#1577; </h3>
                                                                                                             <p>&#8226;	&#1593;&#1606;&#1583; &#1575;&#1604;&#1581;&#1580;&#1586; &#1575;&#1604;&#1585;&#1580;&#1575;&#1569; &#1575;&#1604;&#1578;&#1571;&#1603;&#1583; &#1605;&#1606; &#1575;&#1604;&#1570;&#1578;&#1610; :-  
                        - &#1581;&#1589;&#1608;&#1604;&#1603; &#1593;&#1604;&#1609; &#1575;&#1604;&#1573;&#1610;&#1589;&#1575;&#1604; &#1604;&#1578;&#1587;&#1604;&#1610;&#1605;&#1607; &#1593;&#1606;&#1583; &#1605;&#1603;&#1578;&#1576; &#1575;&#1604;&#1573;&#1587;&#1578;&#1602;&#1576;&#1575;&#1604; &#1608;&#1571;&#1579;&#1576;&#1575;&#1578; &#1575;&#1604;&#1588;&#1582;&#1589;&#1610;&#1577;.
       
</p>
                                                                                                            <p>&#8226;	&#1601;&#1609; &#1581;&#1575;&#1604;&#1577; &#1575;&#1604;&#1594;&#1575;&#1569; &#1575;&#1604;&#1581;&#1580;&#1586; &#1605;&#1606; &#1602;&#1576;&#1604; &#1575;&#1604;&#1606;&#1586;&#1610;&#1604; &#1604;&#1575; &#1610;&#1585;&#1583; &#1575;&#1609; &#1605;&#1576;&#1604;&#1594; &#1605;&#1583;&#1601;&#1608;&#1593; &#1605;&#1606; &#1602;&#1576;&#1604; &#1573;&#1583;&#1575;&#1585;&#1577; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577;.</p>
                                                                                                            <p>&#8226;	&#1604;&#1575; &#1610;&#1578;&#1605; &#1575;&#1604;&#1587;&#1605;&#1575;&#1581; &#1576;&#1578;&#1580;&#1575;&#1608;&#1586; &#1575;&#1604;&#1593;&#1583;&#1583; &#1575;&#1604;&#1605;&#1587;&#1605;&#1608;&#1581; &#1576;&#1607; &#1583;&#1575;&#1582;&#1604; &#1575;&#1604;&#1576;&#1610;&#1578; &#1608; &#1575;&#1604;&#1593;&#1583;&#1583; &#1610;&#1578;&#1590;&#1605;&#1606; &#1575;&#1604;&#1582;&#1583;&#1605; .</p>
                                                                                                             <p>&#8226;	&#1575;&#1604;&#1606;&#1586;&#1610;&#1604; &#1605;&#1587;&#1572;&#1608;&#1604; &#1605;&#1585;&#1575;&#1601;&#1602;&#1610;&#1607; &#1605;&#1587;&#1572;&#1608;&#1604;&#1610;&#1577; &#1603;&#1575;&#1605;&#1604;&#1577; &#1581;&#1587;&#1576; &#1605;&#1575; &#1607;&#1608; &#1605;&#1587;&#1580;&#1604; &#1570;&#1587;&#1605;&#1575;&#1574;&#1607;&#1605; &#1601;&#1610; &#1587;&#1580;&#1604; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577; &#1593;&#1606;&#1583; &#1575;&#1604;&#1583;&#1582;&#1608;&#1604;..</p>
                                                                                                            <p>&#8226;	&#1610;&#1605;&#1606;&#1593; &#1605;&#1606;&#1593;&#1575; &#1576;&#1575;&#1578;&#1575; &#1575;&#1581;&#1590;&#1575;&#1585; &#1575;&#1609; &#1575;&#1594;&#1591;&#1610;&#1607; &#1575;&#1608; &#1605;&#1601;&#1585;&#1608;&#1588;&#1575;&#1578; &#1575;&#1608; &#1576;&#1591;&#1575;&#1591;&#1610;&#1606; &#1575;&#1608; &#1571;&#1594;&#1584;&#1610;&#1577; &#1604;&#1575;&#1587;&#1578;&#1582;&#1583;&#1575;&#1605;&#1607;&#1575; &#1583;&#1575;&#1582;&#1604; &#1575;&#1604;&#1576;&#1610;&#1578; )&#1610;&#1587;&#1578;&#1579;&#1606;&#1609; &#1605;&#1606; &#1584;&#1604;&#1603; &#1575;&#1594;&#1591;&#1610;&#1577; &#1575;&#1604;&#1575;&#1591;&#1601;&#1575;&#1604; &#1575;&#1604;&#1585;&#1590;&#1593; &#1608;&#1571;&#1603;&#1604;&#1607;&#1605;( &#1575;&#1608; &#1571;&#1610; &#1575;&#1583;&#1608;&#1575;&#1578; &#1591;&#1576;&#1582; &#1575;&#1608; &#1589;&#1606;&#1575;&#1583;&#1610;&#1602; &#1581;&#1601;&#1592; &#1575;&#1604;&#1591;&#1593;&#1575;&#1605; &#1608;&#1604;&#1575; &#1610;&#1587;&#1605;&#1581; &#1576;&#1575;&#1604;&#1591;&#1576;&#1582; &#1583;&#1575;&#1582;&#1604; &#1575;&#1604;&#1576;&#1610;&#1608;&#1578; &#1575;&#1608; &#1575;&#1604;&#1594;&#1585;&#1601;.</p>
                                                                                                            <p>&#8226;	&#1575;&#1604;&#1605;&#1606;&#1578;&#1580;&#1593; &#1593;&#1575;&#1574;&#1604;&#1610; &#1608;&#1604;&#1575; &#1610;&#1587;&#1605;&#1581; &#1604;&#1604;&#1588;&#1576;&#1575;&#1576; &#1575;&#1608; &#1575;&#1604;&#1593;&#1575;&#1586;&#1576;&#1610;&#1606;  &#1576;&#1575;&#1604;&#1581;&#1580;&#1586; &#1575;&#1608; &#1575;&#1604;&#1583;&#1582;&#1608;&#1604;. </p>
                                                                                                             <p>&#8226;	&#1604;&#1575; &#1610;&#1587;&#1605;&#1581; &#1576;&#1578;&#1594;&#1610;&#1610;&#1585; &#1575;&#1587;&#1605; &#1589;&#1575;&#1581;&#1576; &#1575;&#1604;&#1581;&#1580;&#1586; &#1593;&#1606;&#1583; &#1575;&#1604;&#1608;&#1589;&#1608;&#1604; &#1575;&#1604;&#1609; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577;.</p>
                                                                                                            <p>&#8226;	&#1593;&#1606;&#1583; &#1575;&#1604;&#1608;&#1589;&#1608;&#1604; &#1575;&#1604;&#1609; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577; &#1610;&#1578;&#1605; &#1578;&#1587;&#1580;&#1610;&#1604; &#1575;&#1604;&#1576;&#1610;&#1575;&#1606;&#1575;&#1578; &#1593;&#1606;&#1583; &#1605;&#1603;&#1578;&#1576; &#1575;&#1604;&#1575;&#1587;&#1578;&#1602;&#1576;&#1575;&#1604; &#1576;&#1571;&#1587;&#1605;&#1575;&#1569; &#1575;&#1604;&#1606;&#1586;&#1604;&#1575;&#1569; &#1575;&#1604;&#1605;&#1578;&#1608;&#1575;&#1580;&#1583;&#1610;&#1606; &#1583;&#1575;&#1582;&#1604; &#1575;&#1604;&#1576;&#1610;&#1578; &#1608;&#1578;&#1587;&#1604;&#1610;&#1605; &#1575;&#1604;&#1576;&#1591;&#1575;&#1602;&#1577; &#1575;&#1604;&#1605;&#1583;&#1606;&#1610;&#1577; &#1604;&#1604;&#1586;&#1608;&#1580; &#1608;&#1575;&#1604;&#1586;&#1608;&#1580;&#1577; &#1608; &#1610;&#1578;&#1605; &#1575;&#1582;&#1584; &#1589;&#1608;&#1585;&#1577; &#1605;&#1606; &#1593;&#1602;&#1583; &#1575;&#1604;&#1586;&#1608;&#1575;&#1580; .</p>
                                                                                                            <p>&#8226;	&#1610;&#1605;&#1606;&#1593; &#1605;&#1606;&#1593;&#1575; &#1576;&#1575;&#1578;&#1575; &#1575;&#1581;&#1590;&#1575;&#1585; &#1575;&#1587;&#1591;&#1608;&#1575;&#1606;&#1575;&#1578; &#1575;&#1604;&#1594;&#1575;&#1586; &#1604;&#1575;&#1587;&#1578;&#1582;&#1583;&#1575;&#1605;&#1607;&#1575; &#1601;&#1609; &#1575;&#1604;&#1591;&#1607;&#1609; &#1583;&#1575;&#1582;&#1604; &#1575;&#1604;&#1576;&#1610;&#1578; &#1604;&#1605;&#1575; &#1578;&#1605;&#1579;&#1604;&#1607; &#1605;&#1606; &#1582;&#1591;&#1608;&#1585;&#1577; &#1571;&#1608; &#1571;&#1610; &#1605;&#1608;&#1575;&#1583; &#1582;&#1591;&#1585;&#1577; &#1571;&#1582;&#1585;&#1609; &#1608;&#1610;&#1602;&#1585; &#1575;&#1604;&#1606;&#1586;&#1610;&#1604; &#1576;&#1571;&#1606;&#1607; &#1605;&#1587;&#1572;&#1608;&#1604; &#1593;&#1606; &#1603;&#1575;&#1601;&#1577; &#1575;&#1604;&#1571;&#1590;&#1585;&#1575;&#1585; &#1575;&#1604;&#1606;&#1575;&#1578;&#1580;&#1577; &#1593;&#1606; &#1584;&#1604;&#1603;.</p>
                                                                                                             <p>&#8226;	&#1610;&#1578;&#1605; &#1605;&#1585;&#1575;&#1580;&#1593;&#1577; &#1573;&#1583;&#1575;&#1585;&#1577; &#1575;&#1604;&#1606;&#1602;&#1604; &#1575;&#1604;&#1576;&#1581;&#1585;&#1610; &#1593;&#1604;&#1609; &#1605;&#1608;&#1575;&#1593;&#1610;&#1583; &#1575;&#1604;&#1584;&#1607;&#1575;&#1576; &#1608;&#1575;&#1604;&#1593;&#1608;&#1583;&#1577; &#1593;&#1604;&#1609; &#1575;&#1604;&#1575; &#1610;&#1578;&#1593;&#1583;&#1609; &#1605;&#1610;&#1593;&#1575;&#1583; &#1575;&#1604;&#1582;&#1585;&#1608;&#1580; &#1605;&#1606; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577; &#1610;&#1608;&#1605; &#1575;&#1604;&#1605;&#1594;&#1575;&#1583;&#1585;&#1577; &#1575;&#1604;&#1587;&#1575;&#1593;&#1577; 12:00 &#1592;&#1607;&#1585;&#1575; &#1608;&#1601;&#1609; &#1581;&#1575;&#1604;&#1577; &#1575;&#1604;&#1585;&#1594;&#1576;&#1607; &#1601;&#1609; &#1575;&#1604;&#1576;&#1602;&#1575;&#1569; &#1583;&#1575;&#1582;&#1604; &#1575;&#1604;&#1576;&#1610;&#1578; &#1605;&#1583;&#1577; &#1575;&#1591;&#1608;&#1604; &#1610;&#1580;&#1576; &#1605;&#1585;&#1575;&#1580;&#1593;&#1577; &#1575;&#1604;&#1575;&#1587;&#1578;&#1602;&#1576;&#1575;&#1604; .</p>
                                                                                                            <p>&#8226;	&#1610;&#1604;&#1578;&#1586;&#1605; &#1603;&#1604; &#1585;&#1576; &#1571;&#1587;&#1585;&#1577; &#1576;&#1608;&#1575;&#1580;&#1576; &#1575;&#1604;&#1585;&#1602;&#1575;&#1576;&#1577; &#1608;&#1575;&#1604;&#1573;&#1588;&#1585;&#1575;&#1601; &#1593;&#1604;&#1609; &#1571;&#1587;&#1585;&#1578;&#1607; &#1608;&#1578;&#1575;&#1576;&#1593;&#1610;&#1607; &#1583;&#1575;&#1582;&#1604; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577; &#1576;&#1575;&#1593;&#1578;&#1576;&#1575;&#1585;&#1607; &#1605;&#1587;&#1574;&#1608;&#1604; &#1593;&#1606;&#1607;&#1605; &#1605;&#1587;&#1574;&#1608;&#1604;&#1610;&#1577; &#1603;&#1575;&#1605;&#1604;&#1577;.</p>
                                                                                                            <p>&#8226;	&#1573;&#1583;&#1575;&#1585;&#1577; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577; &#1594;&#1610;&#1585; &#1605;&#1587;&#1574;&#1608;&#1604;&#1577; &#1593;&#1606; &#1571;&#1609; &#1573;&#1589;&#1575;&#1576;&#1575;&#1578; &#1578;&#1581;&#1583;&#1579; &#1583;&#1575;&#1582;&#1604; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577; &#1571;&#1608; &#1571;&#1610; &#1605;&#1601;&#1602;&#1608;&#1583;&#1575;&#1578; &#1582;&#1575;&#1589;&#1577; &#1576;&#1575;&#1604;&#1606;&#1586;&#1610;&#1604; &#1571;&#1608; &#1571;&#1609; &#1590;&#1585;&#1585; &#1605;&#1607;&#1605;&#1575; &#1603;&#1575;&#1606; &#1606;&#1608;&#1593;&#1607; &#1571;&#1608; &#1587;&#1576;&#1576;&#1607; &#1571;&#1608; &#1591;&#1576;&#1610;&#1593;&#1578;&#1607; &#1605;&#1605;&#1575; &#1602;&#1583; &#1610;&#1589;&#1610;&#1576; &#1575;&#1604;&#1606;&#1586;&#1610;&#1604; &#1571;&#1608; &#1571;&#1581;&#1583; &#1571;&#1601;&#1585;&#1575;&#1583; &#1571;&#1587;&#1585;&#1578;&#1607; &#1571;&#1608; &#1578;&#1575;&#1576;&#1593;&#1610;&#1607; &#1571;&#1608; &#1610;&#1602;&#1593; &#1604;&#1571;&#1609; &#1587;&#1576;&#1576; &#1605;&#1575; &#1601;&#1609; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577; &#1581;&#1610;&#1579; &#1571;&#1606; &#1575;&#1604;&#1606;&#1586;&#1610;&#1604; &#1605;&#1587;&#1572;&#1608;&#1604; &#1593;&#1606; &#1573;&#1587;&#1578;&#1582;&#1583;&#1575;&#1605;&#1607; &#1604;&#1605;&#1585;&#1601;&#1602;&#1575;&#1578; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577;.</p>
                                                                                                             <p>&#8226;	&#1605;&#1605;&#1606;&#1608;&#1593; &#1575;&#1587;&#1578;&#1582;&#1583;&#1575;&#1605; &#1571;&#1610; &#1571;&#1580;&#1607;&#1586;&#1577; &#1589;&#1608;&#1578;&#1610;&#1577; &#1578;&#1579;&#1610;&#1585; &#1575;&#1604;&#1573;&#1586;&#1593;&#1575;&#1580; &#1583;&#1575;&#1582;&#1604; &#1575;&#1604;&#1576;&#1610;&#1608;&#1578; &#1571;&#1608; &#1594;&#1585;&#1601; &#1575;&#1604;&#1601;&#1606;&#1583;&#1602;.</p>
                                                                                                            <p>&#8226;	&#1604;&#1575; &#1610;&#1587;&#1605;&#1581; &#1576;&#1583;&#1582;&#1608;&#1604; &#1575;&#1604;&#1605;&#1571;&#1603;&#1608;&#1604;&#1575;&#1578; &#1608;&#1575;&#1604;&#1605;&#1588;&#1585;&#1608;&#1576;&#1575;&#1578; &#1605;&#1606; &#1582;&#1575;&#1585;&#1580; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577;.</p>
                                                                                                            <p>&#8226;	&#1605;&#1608;&#1593;&#1583; &#1583;&#1582;&#1608;&#1604; &#1575;&#1604;&#1576;&#1610;&#1578; &#1571;&#1608; &#1575;&#1604;&#1594;&#1585;&#1601;&#1577; &#1573;&#1604;&#1575; &#1576;&#1593;&#1583; &#1575;&#1604;&#1587;&#1575;&#1593;&#1577; &#1634;:&#1632;&#1632; &#1592;&#1607;&#1585;&#1575;.</p>
                                                                                                             <p>&#8226;	&#1604;&#1575; &#1610;&#1587;&#1605;&#1581; &#1576;&#1575;&#1604;&#1586;&#1608;&#1575;&#1585;&#1605;&#1606; &#1575;&#1604;&#1582;&#1575;&#1585;&#1580; &#1604;&#1604;&#1606;&#1586;&#1604;&#1575;&#1569; &#1573;&#1604;&#1575; &#1576;&#1593;&#1583; &#1575;&#1582;&#1591;&#1575;&#1585; &#1573;&#1583;&#1575;&#1585;&#1577; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577; &#1605;&#1587;&#1576;&#1602;&#1575;.</p>
                                                                                                            <p>&#8226;	&#1601;&#1610; &#1581;&#1575;&#1604;&#1577; &#1608;&#1580;&#1608;&#1583; &#1571;&#1610; &#1578;&#1604;&#1601;&#1610;&#1575;&#1578; &#1571;&#1608; &#1605;&#1601;&#1602;&#1608;&#1583;&#1575;&#1578; &#1583;&#1575;&#1582;&#1604; &#1575;&#1604;&#1576;&#1610;&#1578; &#1578;&#1605; &#1575;&#1603;&#1578;&#1588;&#1575;&#1601;&#1607;&#1575; &#1576;&#1593;&#1583; &#1575;&#1604;&#1582;&#1585;&#1608;&#1580; &#1587;&#1608;&#1601; &#1610;&#1578;&#1581;&#1605;&#1604; &#1575;&#1604;&#1606;&#1586;&#1610;&#1604;   &#1602;&#1610;&#1605;&#1577; &#1607;&#1584;&#1607; &#1575;&#1604;&#1578;&#1604;&#1601;&#1610;&#1575;&#1578; &#1571;&#1608; &#1575;&#1604;&#1605;&#1601;&#1602;&#1608;&#1583;&#1575;&#1578;.</p>
                                                                                                            <p>&#8226;	&#1610;&#1581;&#1578;&#1608;&#1610; &#1603;&#1604; &#1576;&#1610;&#1578; &#1593;&#1604;&#1609; &#1593;&#1583;&#1583; &#1605;&#1606; &#1575;&#1604;&#1575;&#1587;&#1585;&#1577; &#1603;&#1605;&#1575;&#1607;&#1608; &#1605;&#1608;&#1590;&#1581; &#1593;&#1606;&#1583; &#1605;&#1603;&#1578;&#1576; &#1575;&#1604;&#1581;&#1580;&#1586;  &#1608;&#1601;&#1610; &#1581;&#1575;&#1604;&#1577; &#1591;&#1604;&#1576; &#1571;&#1610; &#1586;&#1610;&#1575;&#1583;&#1577; &#1601;&#1610; &#1593;&#1583;&#1583; &#1575;&#1604;&#1575;&#1587;&#1585;&#1577; &#1610;&#1585;&#1580;&#1609; &#1605;&#1585;&#1575;&#1580;&#1593;&#1577; &#1605;&#1603;&#1578;&#1576; &#1575;&#1604;&#1575;&#1587;&#1578;&#1602;&#1576;&#1575;&#1604;&#1548;&#1593;&#1604;&#1605;&#1575; &#1576;&#1571;&#1606; &#1587;&#1593;&#1585; &#1575;&#1604;&#1587;&#1585;&#1610;&#1585; &#1634;&#1637; &#1583;.&#1603; &#1604;&#1604;&#1610;&#1604;&#1577; &#1548; &#1603;&#1605;&#1575; &#1610;&#1608;&#1580;&#1583; &#1601;&#1610; &#1575;&#1604;&#1605;&#1591;&#1576;&#1582; &#1579;&#1604;&#1575;&#1580;&#1577; &#1589;&#1594;&#1610;&#1585;&#1577; &#1601;&#1575;&#1585;&#1594;&#1577; &#1608;&#1605;&#1594;&#1587;&#1604;&#1577; &#1608;&#1594;&#1604;&#1575;&#1610;&#1577; &#1605;&#1610;&#1575;&#1607; &#1603;&#1607;&#1585;&#1576;&#1575;&#1574;&#1610;&#1577; &#1601;&#1602;&#1591; .</p>
                                                                                                             <p>&#8226;	&#1610;&#1604;&#1578;&#1586;&#1605; &#1575;&#1604;&#1606;&#1586;&#1604;&#1575;&#1569; &#1576;&#1605;&#1608;&#1575;&#1593;&#1610;&#1583; &#1601;&#1578;&#1581; &#1608;&#1594;&#1604;&#1602; &#1581;&#1605;&#1575;&#1605; &#1575;&#1604;&#1587;&#1576;&#1575;&#1581;&#1577; &#1608;&#1575;&#1604;&#1586;&#1610; &#1575;&#1604;&#1605;&#1606;&#1575;&#1587;&#1576; &#1604;&#1604;&#1587;&#1576;&#1575;&#1581;&#1577; &#1608;&#1575;&#1578;&#1576;&#1575;&#1593; &#1575;&#1604;&#1573;&#1580;&#1585;&#1575;&#1569;&#1575;&#1578; &#1575;&#1604;&#1582;&#1575;&#1589;&#1577; &#1576;&#1581;&#1605;&#1575;&#1605; &#1575;&#1604;&#1587;&#1576;&#1575;&#1581;&#1577; &#1608;&#1605;&#1589;&#1575;&#1581;&#1576;&#1577; &#1575;&#1604;&#1571;&#1591;&#1601;&#1575;&#1604; &#1583;&#1608;&#1606; &#1587;&#1606; &#1633;&#1638; &#1576;&#1608;&#1604;&#1610; &#1575;&#1605;&#1585;.</p>
                                                                                                            <p>&#8226;	&#1610;&#1581;&#1602; &#1604;&#1573;&#1583;&#1575;&#1585;&#1577; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577; &#1573;&#1604;&#1594;&#1575;&#1569; &#1575;&#1604;&#1581;&#1580;&#1586; &#1604;&#1571;&#1610; &#1606;&#1586;&#1610;&#1604; &#1604;&#1575; &#1610;&#1604;&#1578;&#1586;&#1605; &#1576;&#1578;&#1593;&#1604;&#1610;&#1605;&#1575;&#1578; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577; &#1583;&#1608;&#1606; &#1578;&#1593;&#1608;&#1610;&#1590;&#1607; .
&#8226;	&#1605;&#1605;&#1606;&#1608;&#1593; &#1583;&#1582;&#1608;&#1604; &#1575;&#1604;&#1581;&#1610;&#1608;&#1575;&#1606;&#1575;&#1578; &#1576;&#1603;&#1575;&#1601;&#1577; &#1575;&#1606;&#1608;&#1575;&#1593;&#1607;&#1575;.
</p>
                                                                                                            <p>&#8226;	&#1601;&#1609; &#1581;&#1575;&#1604;&#1607; &#1575;&#1587;&#1578;&#1582;&#1583;&#1575;&#1605; &#1593;&#1576;&#1575;&#1585;&#1577; &#1575;&#1604;&#1587;&#1610;&#1575;&#1585;&#1575;&#1578; &#1610;&#1585;&#1575;&#1593;&#1609; &#1593;&#1583;&#1605; &#1575;&#1604;&#1581;&#1575;&#1602; &#1575;&#1604;&#1587;&#1610;&#1575;&#1585;&#1577; &#1576;&#1575;&#1609; &#1606;&#1608;&#1593; &#1605;&#1606; &#1575;&#1604;&#1583;&#1585;&#1575;&#1580;&#1575;&#1578; &#1575;&#1604;&#1606;&#1575;&#1585;&#1610;&#1607; &#1575;&#1608; &#1575;&#1604;&#1576;&#1575;&#1580;&#1610;&#1575;&#1578; &#1608;&#1604;&#1575; &#1610;&#1587;&#1605;&#1581; &#1576;&#1583;&#1582;&#1608;&#1604;&#1607;&#1575; &#1575;&#1604;&#1609; &#1605;&#1608;&#1575;&#1602;&#1601; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577;.</p>
                                                                                                             <p>&#8226;	&#1605;&#1608;&#1592;&#1601;&#1609; &#1575;&#1604;&#1602;&#1585;&#1610;&#1577; &#1607;&#1605; &#1601;&#1609; &#1582;&#1583;&#1605;&#1578;&#1603;&#1605; &#1548; &#1604;&#1584;&#1575; &#1610;&#1585;&#1580;&#1609; &#1575;&#1604;&#1578;&#1593;&#1575;&#1608;&#1606; &#1605;&#1593;&#1607;&#1605; &#1605;&#1606; &#1571;&#1580;&#1604; &#1578;&#1581;&#1602;&#1610;&#1602; &#1575;&#1604;&#1585;&#1575;&#1581;&#1577; &#1608;&#1575;&#1604;&#1575;&#1587;&#1578;&#1580;&#1605;&#1575;&#1605; &#1604;&#1604;&#1580;&#1605;&#1610;&#1593;.</p>
                                                                                                            <p></p>
                                                                                                            <p></p>

                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                               <div id="left" style="  width:50%; margin-left:0;  "></div>
                                                                                                <div id="right" style="  width:50%; margin-right:0;  position:absolute "></div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">&nbsp;</div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-md-12">
                                                                                        <div class="checkbox">
                                                                                            <label>
                                                                                                <asp:CheckBox ID="chkTerms" runat="server" OnCheckedChanged="chkTerms_CheckedChanged" CausesValidation="false" AutoPostBack="true" />
                                                                                                I've read and agree to the Terms and Conditions
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="panel-footer">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <div class="forms-control">
                                                                                    <asp:Button ID="btnBack" runat="server" Text="Back" class="btn  btn-default btn-md" OnClick="btnBack_Click" CausesValidation="false" />
                                                                                    &nbsp;
                                                                                    <asp:Button ID="btnConfirmBooking" runat="server" Text="Proceed to Pay" CssClass="btn btn-md btn-primary" OnClick="btnConfirmBooking_Click"/>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
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
            <asp:HiddenField ID="hidFromDate" runat="server" />
            <asp:HiddenField ID="hidToDate" runat="server" />
            <asp:HiddenField ID="hidNumRooms" runat="server" />
            <asp:HiddenField ID="hidNumAdults" runat="server" />
            <asp:HiddenField ID="hidNumKids" runat="server" />
            <asp:HiddenField ID="hidRoomTypeId" runat="server" />
            <asp:HiddenField ID="hidRoomType" runat="server" />
            <asp:HiddenField ID="hidBookingDays" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidRoomId" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidRate" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidRateType" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidRateId" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidRoomCharges" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidCostAfterDiscount" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidDiscountOffered" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidTotalCost" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidDiscountId" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidGuestId" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidReservationId" runat="server"></asp:HiddenField>
            <asp:HiddenField ID="hidPaymentId" runat="server"></asp:HiddenField>
            <!-- For KNET Form Post -->
            <input type="hidden" id="id" name="id" value="340301"></input>
            <input type="hidden" id="password" name="password" value="340301"></input>
            <input type="hidden" id="action" name="action" value="1"></input>
            <input type="hidden" id="alias" name="alias" value="safir"></input>
            <input type="hidden" id="amt" name="amt" value="<%= Session["TotalCostAfterDiscount"].ToString() %>"></input>
            <input type="hidden" id="currencycode" name="currencycode" value="414"></input>
            <input type="hidden" id="langid" name="langid" value="ENG"></input>
            <input type="hidden" id="responseURL" name="responseURL" value="https://www.failakaonline.com/app/response.aspx"></input>
            <input type="hidden" id="errorurl" name="errorurl" value="https://www.failakaonline.com/app/Error.aspx"></input>
            <input type="hidden" id="trackId" name="trackId" value="<%= (new Random().Next(10000000) + 1).ToString() %>"></input>


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

