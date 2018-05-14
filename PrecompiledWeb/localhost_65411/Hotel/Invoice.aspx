<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_Invoice, App_Web_dcln124p" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>
                    <h1>Invoice</h1>
                </legend>
                <div class="row">
                    <div class="col-md-3">
                        Check In:
                        <asp:Label ID="lblCheckIn" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        Check Out:
                        <asp:Label ID="lblCheckOut" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        Days Stayed:
                        <asp:Label ID="lblDaysStayed" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-3">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        Total Boarding:
                        <asp:Label ID="lblBoardingCost" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        Total Invoices:
                        <asp:Label ID="lblTotalInvoice" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        Total Amenities:
                        <asp:Label ID="lblAmenities" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-3">
                        Advance Payment Received:
                        <asp:Label ID="lblPaidAmount" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        Final Payment:
                        <asp:Label ID="lblSettlementAmount" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-3">&nbsp;
                    </div>
                    <div class="col-md-3">&nbsp;
                    </div>
                    <div class="col-md-3">&nbsp;
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</asp:Content>

