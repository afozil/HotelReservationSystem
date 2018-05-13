<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddEditRoomTypes.aspx.cs" Inherits="Hotel_AddEditRoomTypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   <div class="row">
     <div class="col-md-12">
       <fieldset>
           <legend><h1>Add/Edit Room Types</h1></legend>
        </fieldset>
       </div>
    </div>
    
     <div class="row">
         <div class="col-md-4">
             <label for="txtTypeEn">Type Name - English</label>
             <asp:TextBox ID="txtTypeEn" runat="server" Class="form-control"></asp:TextBox>
          </div>
         <div class="col-md-8">
          </div>
    </div>
     <div class="row">
         <div class="col-md-4">
             <label for="txtTypeAr">Type Name - Arabic</label>
             <asp:TextBox ID="txtTypeAr" runat="server" Class="form-control"></asp:TextBox>
          </div>
         <div class="col-md-8">
          </div>
    </div>
     <div class="row">
         <div class="col-md-4">
             <label for="txtDesc">Description</label>
             <asp:TextBox ID="txtDesc" runat="server" Class="form-control"></asp:TextBox>
          </div>
         <div class="col-md-8">
          </div>
    </div>
     <div class="row"><div class="col-md-12">&nbsp;</div></div>
     <div class="row">
         <div class="col-md-2">
             <asp:Button ID="btnSave" runat="server" Text="Save" class="btn  btn-primary btn-sm" OnClick="btnSave_Click" />
          </div>
         <div class="col-md-2">
             <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn  btn-primary btn-sm" OnClick="btnCancel_Click" />
          </div>
         <div class="col-md-8">
          </div>
    </div>
    <asp:HiddenField ID="txtTypeID" runat="server" />
    
    <div>
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </div>

</asp:Content>

