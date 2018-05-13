<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_AddEditRate, App_Web_0t3h1jy2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script>
          $(function() {
              $("#MainContent_txtFromDate").datepicker();
          });

          $(function () {
              $("#MainContent_txtToDate").datepicker();
          });
  </script>
     <div class="row">
     <div class="col-md-12">
       <fieldset>
           <legend><h1>Add/Edit Rate</h1></legend>
        </fieldset>
       </div>
    
     <div class="row">
         <div class="col-md-4">
             <label for="drpRateTypesList">Rate Type</label>
             <asp:DropDownList ID="drpRateTypesList" runat="server" Class="form-control input-sm"></asp:DropDownList>
          </div>
         <div class="col-md-8">
          </div>
    </div>
    <div class="row">
         <div class="col-md-4">
             <label for="txtRateNameEn">Rate Name - English</label>
             <asp:TextBox ID="txtRateNameEn" runat="server" Class="form-control"></asp:TextBox>
          </div>
         <div class="col-md-8">
          </div>
    </div>
     <div class="row">
         <div class="col-md-4">
             <label for="txtRateNameAr">Rate Name - Arabic</label>
             <asp:TextBox ID="txtRateNameAr" runat="server" Class="form-control"></asp:TextBox>
          </div>
         <div class="col-md-8">
          </div>
    </div>
    <div class="row">
         <div class="col-md-2">
                    <label for="txtFromDate">From Date</label>
                   <div class="input-group">
                        <asp:TextBox ID="txtFromDate" runat="server" class="input-sm form-control"></asp:TextBox>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                    </div>
          </div>
         <div class="col-md-10">
          </div>
    </div>
    <div class="row">
         <div class="col-md-2">
                  <label for="txtToDate">To Date</label>
                  <div class="input-group">
                      <asp:TextBox ID="txtToDate" runat="server" class="input-sm form-control"></asp:TextBox>
                       <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                    </div>
          </div>
         <div class="col-md-10">
          </div>
    </div>
     <div class="row">
         <div class="col-md-2">
             <label for="txtRate">Rate</label>
                   <div class="input-group">
                       <span class="input-group-addon">KD</span>
                        <asp:TextBox ID="txtRate" runat="server" class="input-sm form-control" aria-label="Amount (to the nearest dollar)"></asp:TextBox>
                    </div>
             </div>
         <div class="col-md-10">
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
    <asp:HiddenField ID="hidRateId" runat="server" />
    
    <div>
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </div>

</asp:Content>

