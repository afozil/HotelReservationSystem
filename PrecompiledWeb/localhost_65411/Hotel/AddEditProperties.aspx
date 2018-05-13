<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_AddEditProperties, App_Web_0t3h1jy2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
     <div class="col-md-12">
       <fieldset>
           <legend><h1>Add/Edit Property</h1></legend>
        </fieldset>
       </div>
    </div>
     <div class="row">
         <div class="col-md-4">
             <label for="txtProNameEn">Property Name - English</label>
             <asp:TextBox ID="txtProNameEn" runat="server" Class="form-control"></asp:TextBox>
          </div>
         <div class="col-md-8">
          </div>
    </div>
     <div class="row">
         <div class="col-md-4">
             <label for="txtProNameAr">Property Name - Arabic</label>
             <asp:TextBox ID="txtProNameAr" runat="server" Class="form-control"></asp:TextBox>
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
    <asp:HiddenField ID="txtPropertyID" runat="server" />
    <div>
      <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </div> 
</asp:Content>

