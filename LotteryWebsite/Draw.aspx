<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Lottery.Master" CodeBehind="Draw.aspx.vb" Inherits="LotteryWebsite.WebForm12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-family: "Segoe UI";
            font-size: 12px;
            color: #000000;
            background-color: #F0F0F0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="container">
        <div class="navbar navbar-default">
            <ul class="nav navbar-nav">
                <li>
                    <asp:HyperLink ID="AdminLink" runat="server" NavigateUrl="~/Admin.aspx">Control Panel</asp:HyperLink></li>
                <li class="active">
                    <asp:HyperLink ID="DrawLink" runat="server" NavigateUrl="~/Draw.aspx">Draw</asp:HyperLink></li>
                <li>
                    <asp:HyperLink ID="ViewUsers" runat="server" NavigateUrl="~/UserList.aspx">User List</asp:HyperLink></li>
                <li>
                    <asp:HyperLink ID="ViewUsersEntries" runat="server" NavigateUrl="~/UserEntries.aspx">Entries</asp:HyperLink></li>
            </ul>
        </div>

        <div class="row">
            <div class="col-lg-12 text-center text-underline" style="margin-bottom: 5px;">
                <h3>Admin Draw</h3>
            </div>
        </div>
        <div class="row">
            <div class="panel w3-card">
                <div class="panel-heading w3-blue">
                    <h4>Current Draw</h4>
                </div>
                <div class="panel-body panel-noborder">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField />
                            <asp:BoundField />
                            <asp:BoundField DataField="Pool" HeaderText="Pool" SortExpression="Pool" />
                            <asp:BoundField DataField="AdminFees" HeaderText="AdminFees" SortExpression="AdminFees" />
                            <asp:BoundField DataField="CharityDonations" HeaderText="CharityDonations" SortExpression="CharityDonations" />
                            <asp:BoundField DataField="DrawID" HeaderText="DrawID" SortExpression="DrawID" />
                            <asp:BoundField DataField="GameStart" HeaderText="GameStart" SortExpression="GameStart" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#2196F3" Font-Bold="False" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT TOP 1 Pool, AdminFees, CharityDonations, DrawID, GameStart FROM PrizePool ORDER BY DrawID DESC"></asp:SqlDataSource>
                </div>
                <!-- panel body end -->
            </div>
            <!--- Panel end -->
        </div>
        <!-- row end -->

        <div class="row">
            <div class="panel w3-card">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-4 col-xs-offset-4">
                            <asp:Button ID="DrawNumbers" runat="server" Text="Draw Numbers" class="btn btn-danger btn-block" />
                        </div>
                    </div>

                    <div class="row" id="NumbersShown" runat="server" visible="False">

                        <div class="col-sm-4 col-sm-offset-4">
                            <div class="col-xs-1" style="border: 1px solid black">
                                <asp:Label ID="Num1" runat="server"></asp:Label>
                            </div>
                            <div class="col-xs-1 col-sm-offset-2" style="border: 1px solid black">
                                <asp:Label ID="Num2" runat="server"></asp:Label>
                            </div>
                            <div class="col-xs-1 col-sm-offset-2" style="border: 1px solid black">
                                <asp:Label ID="Num3" runat="server"></asp:Label>
                            </div>
                            <div class="col-xs-1 col-sm-offset-2" style="border: 1px solid black">
                                <asp:Label ID="Bonus" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                </div>
                <!-- numbers row end -->
            </div>
            <!-- panel end -->
        </div>
        <div class="row">
            <div class="panel w3-card">
                <div class="panel-heading w3-green">
                    <h4>
                        <asp:Label ID="GridDetails" runat="server" Text="Current Entries for Draw"></asp:Label></h4>
                </div>
                <div class="panel-body panel-noborder">
                    <asp:GridView ID="GridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="119px" Width="100%">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#4CAF50" Font-Bold="False" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>

                </div>
                <!-- panel body end-->
            </div>
            <!-- panel end -->
        </div>
        <!-- row end -->
    </div>
    <!-- container end -->
</asp:Content>
