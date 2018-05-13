<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ChangeRoom.aspx.cs" Inherits="Hotel_ChangeRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>
                    <h1>Change Room of Reservation</h1>
                </legend>

                 <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-2">
                                <label for="lblReservationID">Reservation #</label>
                                <asp:Label ID="lblReservationID" runat="server" Class="form-control"></asp:Label>
                            </div>
                            <div class="col-md-4">&nbsp;</div>
                            <div class="col-md-6">&nbsp;</div>
                        </div>
                        <div class="row"><div class="col-md-12">&nbsp;</div></div>
                        <div class="row">
                            <div class="col-md-2">
                                <label for="lblFromDate">From Date</label>
                                <div class="input-group">
                                    <asp:Label ID="lblFromDate" runat="server" class="input-md form-control" placeholder="mm/dd/yyyy"></asp:Label>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <label for="lblToDate">To Date</label>
                                <div class="input-group">
                                    <asp:Label ID="lblToDate" runat="server" class="input-md form-control" placeholder="mm/dd/yyyy"></asp:Label>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                                </div>
                            </div>
                            <div class="col-md-8">&nbsp;</div>
                        </div>
                        <div class="row"><div class="col-md-12">&nbsp;</div></div>
                        <div class="row">
                            <div class="col-md-5">
                                <label for="lblRoomType">Room Type</label>
                                <asp:Label ID="lblRoomType" runat="server" class="input-md form-control"></asp:Label>
                            </div>
                            <div class="col-md-7">&nbsp;</div>
                        </div>
                        <div class="row"><div class="col-md-12">&nbsp;</div></div>
                        <div class="row">
                            <div class="col-md-5">
                                <label for="lblBookedRoom">Booked Room</label>
                                <asp:Label ID="lblBookedRoom" runat="server" class="input-md form-control"></asp:Label>
                            </div>
                            <div class="col-md-7">&nbsp;</div>
                        </div>
                        <div class="row"><div class="col-md-12">&nbsp;</div></div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="lstSelectedRoom">Choose a different Room</label>
                                <div class="input-group">
                                    <asp:ListBox ID="lstSelectedRoom" runat="server" SelectionMode="Single" Rows="10" class="form-control input-md"></asp:ListBox>
                                </div>
                            </div>
                            <div class="col-md-6">&nbsp;</div>
                        </div>
                        <div class="row"><div class="col-md-12">&nbsp;</div></div>
                        <div class="row">
                    <div class="col-md-2">
                        <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-md" OnClick="btnSave_Click" />
                        &nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-md" OnClick="btnCancel_Click" CausesValidation="false" />
                    </div>
                    <div class="col-md-8">
                    </div>
                </div>
                    </div>
                     </div>

            </fieldset>
            </div>
        </div>
    <asp:HiddenField ID="hidReservationId" runat="server" />
</asp:Content>

