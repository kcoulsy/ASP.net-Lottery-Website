<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Lottery.Master" CodeBehind="RecoverPassword.aspx.vb" Inherits="LotteryWebsite.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-default">
            <div class="panel-heading"><h4>Recover Password</h4></div>
            <div class="panel-body">
                <div class="row">
                    <div class="alert alert-danger">
                      This page is a mock up, as it would require an email server and domain to be set up.
                    </div>
                </div>
                <div class="row">
                    <br />Enter your email address:<br />
                        £<asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
                    <asp:Button ID="RecoverButton" runat="server" Text="Reset Password" class="btn btn-success"/>
                    <br />
                        <asp:Label ID="SuccessLabel" runat="server"></asp:Label>
                    <br />
                    <asp:HyperLink ID="LoginBack" runat="server" NavigateUrl="~/Login.aspx">Back to Login</asp:HyperLink>
                        
                </div>
            </div>
        </div>
    </div>    
</asp:Content>
