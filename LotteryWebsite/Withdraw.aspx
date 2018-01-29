<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Lottery.Master" CodeBehind="Withdraw.aspx.vb" Inherits="LotteryWebsite.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="container">
                <div class="row">
            <div class="col-lg-12 text-center text-underline" style="margin-bottom:5px;">
            <h3>Withdraw</h3>
            </div>
        </div>
        <div class="alert alert-danger">
            Due to the nature of the project no actual withdraw/deposit function is added, instead it uses a simple textbox to change balance.
        </div>
    <div class="col-md-6 col-md-offset-3">
        <div class="panel w3-card">
            <div class="panel-heading w3-blue"><h4>Withdraw</h4></div>
            <div class="panel-body">
                <div class="row">
                Balance: 
                £<asp:Label ID="BalanceLabel" runat="server" Text="##"></asp:Label>
                </div>
                <div class="row">
                    <br />Amount to Withdraw:<br />
                        £<asp:TextBox ID="WithdrawTextBox" runat="server"></asp:TextBox>
                    <asp:Button ID="WithdrawButton" runat="server" Text="Withdraw" class="btn btn-success"/>
                        <br />
                    <asp:HyperLink ID="WithdrawBack" runat="server" NavigateUrl="~/Usercp.aspx">Back to Control Panel</asp:HyperLink>
                        <br />
                        <asp:Label ID="ErrorLabel" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>    

    </div>
</asp:Content>
