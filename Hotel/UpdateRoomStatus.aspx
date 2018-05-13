<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UpdateRoomStatus.aspx.cs" Inherits="Hotel_UpdateRoomStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="row">
        <div class="col-md-12">
            <div class="row">
               <div class="col-md-12">
                <fieldset>
                   <legend><h1>Update Room Status</h1></legend>
                    <div class="row">
                        <div class="col-md-12"><asp:Label ID="lblMsg" runat="server" ></asp:Label> </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                           <label for="drpRooms">Room</label>   
                            <asp:DropDownList ID="drpRooms" runat="server" class="form-control input-md" AutoPostBack="true" OnSelectedIndexChanged="drpRooms_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col-md-8">&nbsp;</div>
                    </div>
                    <div class="row"><div class="col-md-12">&nbsp;</div></div>
                    <div class="row">
                        <div class="col-md-4">
                           <label for="ltrlNumber">Room Number</label>   
                            <asp:Label ID="ltrlNumber" runat="server" CssClass="form-control"></asp:Label>
                        </div>
                        <div class="col-md-8">&nbsp;</div>
                    </div>
                    <div class="row"><div class="col-md-12">&nbsp;</div></div>
                    <div class="row">
                        <div class="col-md-4">
                           <label for="ltrlRoomType">Room Type</label>   
                            <asp:Label ID="ltrlRoomType" runat="server" CssClass="form-control"></asp:Label>
                        </div>
                        <div class="col-md-8">&nbsp;</div>
                    </div>
                    <div class="row"><div class="col-md-12">&nbsp;</div></div>
                     <div class="row">
                        <div class="col-md-4">
                           <label for="ltrlProperty">Property</label>   
                            <asp:Label ID="ltrlProperty" runat="server" CssClass="form-control"></asp:Label>
                        </div>
                         <div class="col-md-8">&nbsp;</div>
                    </div>
                    <div class="row"><div class="col-md-12">&nbsp;</div></div>
                     <div class="row">
                        <div class="col-md-4">
                           <label for="ltrlCurrentStatus">Current Status</label>   
                            <asp:label ID="ltrlCurrentStatus" runat="server" CssClass="form-control"></asp:label>
                        </div>
                         <div class="col-md-8">&nbsp;</div>
                    </div>
                    <div class="row"><div class="col-md-12">&nbsp;</div></div>
                     <div class="row">
                        <div class="col-md-4">
                           <label for="drpStatus">Change Status</label>   
                            <asp:DropDownList ID="drpStatus" runat="server" class="form-control input-md"></asp:DropDownList>
                         <asp:RequiredFieldValidator ID="reqVldtrdrpStatus" runat="server" ErrorMessage="Select a status" ControlToValidate="drpStatus" 
                             InitialValue="-1" Display="Static">Select a status</asp:RequiredFieldValidator>
                        </div>
                         <div class="col-md-8">&nbsp;</div>
                    </div>
                    <div class="row"><div class="col-md-12">&nbsp;</div></div>
                     <div class="row">
                        <div class="col-md-4">
                           <label for="txtRemarks">Remarks</label>   
                            <asp:TextBox ID="txtRemarks" runat="server" class="form-control" TextMode="MultiLine" Rows="5" Width="100%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqVZaldtrTxtRemarks" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtRemarks" Display="Static">*</asp:RequiredFieldValidator>
                        </div>
                         <div class="col-md-8">&nbsp;</div>
                    </div>
                    <div class="row"><div class="col-md-12">&nbsp;</div></div>
                     <div class="row">
                        <div class="col-md-4">
                           <asp:Button ID="btnSave" runat="server" Text="Save"  OnClick="btnSave_Click" class="btn btn-primary btn-md"/>
                      &nbsp
                      <asp:Button ID="btnCancel" runat="server" Text="Cancel"  OnClick="btnCancel_Click" class="btn btn-default btn-md" CausesValidation="false"/>
                    </div>
                         <div class="col-md-8">&nbsp;</div>
                        </div>
                    </div>
                </fieldset>
                </div>
            </div>
            <div class="row">
               <div class="col-md-12">
                </div>
            </div>
</asp:Content>

