<%@ page title="Add/Edit Amenities" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Admin_AddEditAmenities, App_Web_z0qh3rc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
       <div class="row">
           
     <div class="col-sm-12">
       <fieldset>
           <legend><h1>Add/Edit Amienities</h1></legend>
        </fieldset>
       </div>
    </div>

     <div class="row">
         <div class="col-sm-4">
             <label for="txtRateNameEn">Name</label>
             <asp:TextBox ID="txtAName" runat="server" Class="form-control"></asp:TextBox>
             <asp:RequiredFieldValidator ID="reqAName" runat="server" ErrorMessage="Required" ControlToValidate="txtAName" Display="Static">*</asp:RequiredFieldValidator>
          </div>
         <div class="col-sm-8">&nbsp;
          </div>
    </div>
    <div class="row"><div class="col-sm-12">&nbsp;</div></div>
     <div class="row">
         <div class="col-sm-4">
             <label for="txtRateNameEn">Description</label>
             <asp:TextBox ID="txtDescription" runat="server" Class="form-control"></asp:TextBox>
          </div>
         <div class="col-sm-8">&nbsp;
          </div>
    </div>
    <div class="row"><div class="col-sm-12">&nbsp;</div></div>
     <div class="row">
         <div class="col-sm-2">
             <label for="txtRate">Units</label>
                   <div class="input-group">
                        <asp:TextBox ID="txtQty" runat="server" class="input-md form-control" aria-label="Quantity"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="reqQty" runat="server" ErrorMessage="Required" ControlToValidate="txtQty" Display="Static">*</asp:RequiredFieldValidator>
                    </div>
             </div>
         <div class="col-sm-10">&nbsp;
          </div>
    </div>
    <div class="row"><div class="col-sm-12">&nbsp;</div></div>
     <div class="row">
         <div class="col-sm-2">
             <label for="txtRate">Price</label>
                   <div class="input-group">
                       <span class="input-group-addon">KD</span>
                        <asp:TextBox ID="txtPrice" runat="server" class="input-md form-control" aria-label="Amount"></asp:TextBox>
                    </div>
             <asp:RequiredFieldValidator ID="reqPrice" runat="server" ErrorMessage="Required" ControlToValidate="txtPrice" Display="Static">*</asp:RequiredFieldValidator>
             </div>
         <div class="col-sm-10">&nbsp;
          </div>
    </div>
    <div class="row"><div class="col-sm-12">&nbsp;</div></div>
     <div class="row">
         <div class="col-sm-2">
             <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-md" OnClick="btnSave_Click" />
               &nbsp;
             <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-default btn-md" OnClick="btnCancel_Click" CausesValidation="false"/>
          </div>
         
         <div class="col-sm-8">
          </div>
    </div>
       <asp:HiddenField ID="hidAmenitiesID" runat="server" />
      <div>
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </div>

</asp:Content>

