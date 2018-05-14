<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="Hotel_CollectionReport, App_Web_dcln124p" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
            <script>
            $(function () {
                $("#MainContent_txtFromDate").datepicker();
            });

            $(function () {
                $("#MainContent_txtToDate").datepicker();
            });

        </script>

        <div class="row">
        <div class="col-md-12">
             <br />
            <fieldset>
               
                <legend>
                    <h1>Collection Report</h1>
                </legend>
                   <div class="row">

                        <div class="col-md-9">
                        <fieldset>
                           
                         
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="txtFromDate">From Date</label>
                                    <span class="input-group">
                                        <asp:TextBox ID="txtFromDate" runat="server" class="form-control input-md" placeholder="mm/dd/yyyy"></asp:TextBox>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                                    </span>
                                    <asp:RequiredFieldValidator ID="reqFromDate" runat="server" ErrorMessage="Required" ControlToValidate="txtFromDate" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regFromDate" runat="server" ErrorMessage="In correct Date Format" ControlToValidate="txtFromDate" Display="Static" ForeColor="Red"
                                        ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>

                                </div>
                                <div class="col-md-3">
                                    <label for="txtToDate">To Date</label>
                                    <span class="input-group">
                                        <asp:TextBox ID="txtToDate" runat="server" class="form-control input-md" placeholder="mm/dd/yyyy"></asp:TextBox>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
                                    </span>
                                    <asp:RequiredFieldValidator ID="reqToDate" runat="server" ErrorMessage="Required" ControlToValidate="txtToDate" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regToDate" runat="server" ErrorMessage="In correct Date Format" ControlToValidate="txtToDate" Display="Static" ForeColor="Red"
                                        ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-md-3" runat="server" id="divusername">
                                    <label for="drpRoomTypes">User Name</label>
                                    <asp:DropDownList ID="drpUserName" runat="server" class="form-control input input-md"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="reqRoomTypes" runat="server" ErrorMessage="Required" ControlToValidate="drpUserName" ForeColor="Red" Display="Static">*</asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-3">
                                    <label for="btnChkReservation"></label>
                                    <br />
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-sm btn-primary" OnClick="btnSubmit_Click"  />
                                   
                                </div>
                            </div>


                               <div class="row">
                                <div class="col-md-12">
                                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                </div>
                            </div>

                        </fieldset>
                    </div>
                   </div>


                  </fieldset>
        </div>
    </div>
</asp:Content>


