<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Lottery.Master" CodeBehind="Home.aspx.vb" Inherits="LotteryWebsite.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="jumbotron">
                    <div class="container">
                        <h1>Hello, world!</h1>
                        <p>Welcome to Warwick Weekly Windfall! We are a Student Union run lottery website that allows Students to make some cash as well as give back to charity!</p>
                        <p><a class="btn btn-lg w3-btn w3-blue" href="/register.aspx" role="button">Get Started!</a></p>
                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-info w3-card">
                    <div class="panel-heading w3-blue">
                        <h4>Current JackPot</h4>
                    </div>
                    <div class="panel-body">
                        <h4>
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BorderStyle="None" DataSourceID="SqlDataSource2" GridLines="None" Height="50px" Width="125px">
                                <Fields>
                                    <asp:BoundField DataField="Pool" HeaderText="£" SortExpression="Pool" />
                                </Fields>
                            </asp:DetailsView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT TOP 1 Pool FROM PrizePool ORDER BY DrawID DESC"></asp:SqlDataSource>
                        </h4>
                    </div>
                </div>
                <div class="panel w3-card">
                    <div class="panel-heading w3-red">
                        <h4>Last Draw</h4>
                    </div>
                    <div class="panel-body panel-noborder">
                        <div class="row">
                            <div class="row">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DrawID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField />
                                        <asp:BoundField />
                                        <asp:BoundField DataField="DrawID" HeaderText="DrawID" InsertVisible="False" ReadOnly="True" SortExpression="DrawID" />
                                        <asp:BoundField DataField="Num1" HeaderText="Num1" SortExpression="Num1" />
                                        <asp:BoundField DataField="Num2" HeaderText="Num2" SortExpression="Num2" />
                                        <asp:BoundField DataField="Num3" HeaderText="Num3" SortExpression="Num3" />
                                        <asp:BoundField DataField="Bonus" HeaderText="Bonus" SortExpression="Bonus" />
                                        <asp:BoundField DataField="DrawDate" HeaderText="DrawDate" SortExpression="DrawDate" />
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#F44336" Font-Bold="False" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT TOP 1 * FROM Draws ORDER BY DrawID DESC"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel w3-card">
                    <div class="panel-heading w3-teal">
                        <h4>Latest 5 Winners!</h4>
                    </div>
                    <div class="panel-body panel-noborder">
                        <div class="row">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PlayID" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="100%">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField />
                                    <asp:BoundField />
                                    <asp:BoundField DataField="PlayID" HeaderText="PlayID" InsertVisible="False" ReadOnly="True" SortExpression="PlayID" />
                                    <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                                    <asp:BoundField DataField="Winnings" HeaderText="Winnings" SortExpression="Winnings" />
                                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                                    <asp:BoundField DataField="DrawID" HeaderText="DrawID" SortExpression="DrawID" />
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#009688" Font-Bold="False" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT TOP 5 PlayID, UserID, Winnings, [Date], DrawID FROM Entries WHERE (Winnings &gt; 0) ORDER BY PlayID DESC"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <div class="panel panel-warning w3-card">
                    <div class="panel-heading w3-blue-grey">
                        <h4>Charity Donations!</h4>
                    </div>
                    <div class="panel-body">
                        A percentage of each ticket purchase is donated to charity! So far we have donated:<br />
                        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource4" GridLines="None" Height="49px" Width="125px">
                            <Fields>
                                <asp:BoundField DataField="Sum_Of_CharityDonations" HeaderText="£" SortExpression="Sum_Of_CharityDonations" />
                            </Fields>
                        </asp:DetailsView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT [Sum Of CharityDonations] AS Sum_Of_CharityDonations FROM [PrizePool Query]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
