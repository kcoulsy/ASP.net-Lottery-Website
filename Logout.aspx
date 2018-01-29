<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Lottery.Master" CodeBehind="Logout.aspx.vb" Inherits="LotteryWebsite.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <p>
        Logging out now...</p>
    <p>
       <asp:HyperLink ID="LogoutHome" runat="server" NavigateUrl="~/Home.aspx">If you are not redirected click here to go to the home page.</asp:HyperLink>
    </p>
</asp:Content>
