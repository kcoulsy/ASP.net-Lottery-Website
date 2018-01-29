<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Lottery.Master" CodeBehind="Register.aspx.vb" Inherits="LotteryWebsite.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div id="login-overlay" class="modal-dialog">
      <div class="modal-content">
          <div class="modal-header">
              <h4><strong>Register</strong></h4>
          </div>
          <div class="modal-body">
              <div class="row">
                  <div class="col-xs-6">
                    <div class="form-group">
                        <label for="username" class="control-label">Username</label>
                        <asp:TextBox class="form-control" ID="UserReg" runat="server" Placeholder="Username" name="username" value="" required="" title="Please enter your username"></asp:TextBox>
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="password" class="control-label">Password</label>
                        <asp:TextBox ID="PassReg" runat="server" class="form-control" name="password" placeholder="Password" value="" required="" title="Please enter your password" TextMode="Password"></asp:TextBox>
                                  
                    </div>
                    <div class="form-group">
                        <label for="password" class="control-label">Confirm Password</label>
                        <asp:TextBox ID="PassConfReg" runat="server" class="form-control" name="password" placeholder="Password" value="" required="" title="Please enter your password" TextMode="Password"></asp:TextBox>
                                  
                    </div>
                      <div class="form-group">
                          Already Registered? 
                          <br />
                          <asp:HyperLink ID="LoginFromReg" runat="server" NavigateUrl="~/Login.aspx">Click Here to Log in</asp:HyperLink>
                      </div>

                      
                </div>
                <div class="col-xs-6">
                    <div class="form-group">
                        <label for="username" class="control-label">First Name</label>
                        <asp:TextBox class="form-control" ID="FirstNameReg" runat="server" Placeholder="First Name" name="username" value="" required="" title="Please enter your username"></asp:TextBox>
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="password" class="control-label">Last Name</label>
                        <asp:TextBox ID="LastNameReg" runat="server" class="form-control" name="password" placeholder="Last Name" value="" required="" title="Please enter your password" ></asp:TextBox>
                                  
                    </div>
                    <div class="form-group">
                        <label for="password" class="control-label">Email</label>
                        <asp:TextBox ID="EmailReg" runat="server" class="form-control" name="password" placeholder="Email" value="" required="" title="Please enter your password" ></asp:TextBox>
                                  
                    </div>
                    <asp:Button ID="RegisterButton" runat="server" Text="Register" class="btn btn-success btn-block"/>
                </div>


            </div>
              <div class="row">
                  <asp:Label ID="SuccessLabel" runat="server"></asp:Label>
                <asp:RegularExpressionValidator ID="EmailFormatValidator" runat="server" ControlToValidate="EmailReg" ErrorMessage="You must enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                
                  
              </div>  <!--row end-->  
          </div><!-- modal body -->
      </div>
  </div>

</asp:Content>
