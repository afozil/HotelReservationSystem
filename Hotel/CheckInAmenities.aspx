<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CheckInAmenities.aspx.cs" Inherits="Hotel_CheckInAmenities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
     <div class="col-sm-12">
       <fieldset>
           <legend><h1>Buy Amienities</h1></legend>
        </fieldset>
       </div>
    </div>

     <div class="row">
         <div class="col-sm-4">
             <label for="drpCheckIns">Name</label>
             <asp:DropDownList ID="drpCheckIns" runat="server"  Class="form-control input input-md"></asp:DropDownList>
          </div>
         <div class="col-sm-4">
             <label for="drpAmenities">Amenity</label>
             <asp:DropDownList ID="drpAmenities" runat="server"  Class="form-control input input-md"></asp:DropDownList>
          </div>
         <div class="col-sm-6">&nbsp;
          </div>
    </div>
    <div class="row"><div class="col-sm-12">&nbsp;</div></div>
     <div class="row">
         <div class="col-sm-4">
             <label for="txtQty">Quantity</label>
                   <div class="input-group">
                        <asp:TextBox ID="txtQty" runat="server" class="input-md form-control" aria-label="Quantity"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="txtQty" Display="Static">*</asp:RequiredFieldValidator>
                    </div>
             </div>
         <div class="col-sm-4">
             <label for="txtRate">Price</label>
                   <div class="input-group">
                       <span class="input-group-addon">KD</span>
                        <asp:TextBox ID="txtPrice" runat="server" class="input-md form-control" aria-label="Amount"></asp:TextBox>
                    </div>
          </div>
    </div>
    <div class="row"><div class="col-sm-12">&nbsp;</div></div>
     <div class="row">
         <div class="col-sm-2">
             <label for="txtQty1">Quantity</label>
                   <div class="input-group">
                        <asp:TextBox ID="txtQty1" runat="server" class="input-md form-control" aria-label="Quantity"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="reqQty" runat="server" ErrorMessage="Required" ControlToValidate="txtQty1" Display="Static">*</asp:RequiredFieldValidator>
                    </div>
             </div>
         <div class="col-sm-10">&nbsp;
          </div>
    </div>
    <div class="row"><div class="col-sm-12">&nbsp;</div></div>
     <div class="row">
         <div class="col-sm-2">
             <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-md" />
               &nbsp;
             <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-md" CausesValidation="false"/>
          </div>
         
         <div class="col-sm-8">
          </div>
    </div>
       <asp:HiddenField ID="hidAmenitiesID" runat="server" />
      <div>
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </div>

</asp:Content>

