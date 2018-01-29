<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Lottery.Master" CodeBehind="Login.aspx.vb" Inherits="LotteryWebsite.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div id="login-overlay" class="modal-dialog">
      <div class="modal-content">
          <div class="modal-header">
              <h4 class="modal-title" id="myModalLabel">Login</h4> 
          </div>
          <div class="modal-body">
              <div class="row">
                  <div class="col-xs-6">
                      <div class="well">
                          
                              <div class="form-group">
                                  <label for="username" class="control-label">Username</label>
                                  <asp:TextBox class="form-control" ID="UserLogin" runat="server" Placeholder="Username" name="username" value="" required="" title="Please enter your username">test</asp:TextBox>
                                  <span class="help-block"></span>
                              </div>
                              <div class="form-group">
                                  <label for="password" class="control-label">Password</label>
                                  
                                  <asp:TextBox ID="PassLogin" runat="server" class="form-control" name="password" placeholder="password" value="" required="" title="Please enter your password" TextMode="Password">test</asp:TextBox>
                                  <div class="help-block text-right"><a href="/RecoverPassword.aspx">Forget password</a></div>
                              </div>
                              <div id="loginErrorMsg" class="alert alert-error hide">Wrong username or password</div>
                              <div class="checkbox">
                                  <label>
                                     <asp:CheckBox ID="CheckBox1" runat="server" />  Remember login
                                  </label>
                              </div>
                              <asp:Button ID="LoginButton" runat="server" Text="Log In" class="btn btn-success btn-block"/>
                          <asp:Label ID="SuccessLabel" runat="server"></asp:Label>
                                <asp:RequiredFieldValidator ID="UserValidator" runat="server" ControlToValidate="UserLogin" ErrorMessage=""></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="PassValidator" runat="server" ControlToValidate="PassLogin" ErrorMessage=""></asp:RequiredFieldValidator>
                      </div>
                  </div>
                  <div class="col-xs-6">
                      <p class="lead">Register now!</p>
                      <ul class="list-unstyled" style="line-height: 2">
                          <li>Have a chance at winning big</li>
                          <li>Help donate to charity</li>
                          <li>We&#39;re run by the SU</li>
                          <li>Fast and easy to use website</li>
                      </ul>
                      <p><a href="./Register.aspx" class="btn btn-info btn-block">Register now!</a></p>
                  </div>
              </div>
          </div>
      </div>

  </div>
</asp:Content>
