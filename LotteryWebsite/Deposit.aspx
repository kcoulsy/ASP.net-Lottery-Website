<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Lottery.Master" CodeBehind="Deposit.aspx.vb" Inherits="LotteryWebsite.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="container">
                <div class="row">
            <div class="col-lg-12 text-center text-underline" style="margin-bottom:5px;">
            <h3>Deposit</h3>
            </div>
        </div>
        <div class="row">
        <div class="alert alert-danger">
            Due to the nature of the project no actual withdraw/deposit function is added, instead it uses a simple textbox to change balance.
        </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel w3-card">
                    <div class="panel-heading w3-blue"><h4>Deposit</h4></div>
                    <div class="panel-body">
                        <div class="row">
                        Balance: 
                        £<asp:Label ID="BalanceLabel" runat="server" Text="##"></asp:Label>
                        </div>
                        <div class="row">
                            <br />Amount to Deposit:<br />
                                £<asp:TextBox ID="DepositTextBox" runat="server"></asp:TextBox>
                            <asp:Button ID="DepositButton" runat="server" Text="Deposit" class="btn btn-success"/>
                                <br />
                                <asp:HyperLink ID="DepositBack" runat="server" NavigateUrl="~/Usercp.aspx">Back to Control Panel</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div> 
        </div><!-- end row -->
    </div>
    
 
</asp:Content>
