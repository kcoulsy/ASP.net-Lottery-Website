<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Lottery.Master" CodeBehind="Admin.aspx.vb" Inherits="LotteryWebsite.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="container">
        <!-- admin navbar -->
        <div class="row">


            <div class="navbar navbar-default">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <asp:HyperLink ID="AdminLink" runat="server" NavigateUrl="~/Admin.aspx">Control Panel</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="DrawLink" runat="server" NavigateUrl="~/Draw.aspx">Draw</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="ViewUsers" runat="server" NavigateUrl="~/UserList.aspx">User List</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="ViewUsersEntries" runat="server" NavigateUrl="~/UserEntries.aspx">Entries</asp:HyperLink></li>
                </ul>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 text-center text-underline" style="margin-bottom: 5px;">
                <h3>Admin Control Panel</h3>
            </div>
        </div>
        <div class="row">
            <div class="panel w3-card">
                <div class="panel-heading w3-green">
                    <h4>Website configuration</h4>
                </div>
                <div class="panel-body panel-noborder">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="15" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" HorizontalAlign="Center">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField ConvertEmptyStringToNull="False" HtmlEncodeFormatString="False" InsertVisible="False">
                                <ControlStyle Width="0px" />
                            </asp:BoundField>
                            <asp:BoundField InsertVisible="False">
                                <ControlStyle Width="0px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MaxPlays" HeaderText="MaxPlays" SortExpression="MaxPlays" />
                            <asp:BoundField DataField="CurrentGame" HeaderText="CurrentGame" SortExpression="CurrentGame" />
                            <asp:BoundField DataField="AdminFee" HeaderText="AdminFee" SortExpression="AdminFee" />
                            <asp:BoundField DataField="CharityFee" HeaderText="CharityFee" SortExpression="CharityFee" />
                            <asp:BoundField DataField="TicketPrice" HeaderText="TicketPrice" SortExpression="TicketPrice" />
                            <asp:BoundField DataField="InitialJackpot" HeaderText="InitialJackpot" SortExpression="InitialJackpot" />
                            <asp:BoundField DataField="RolloverAmount" HeaderText="RolloverAmount" SortExpression="RolloverAmount" />
                            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#98E29B" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#4CAF50" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#4CAF50" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM [Config] WHERE [ID] = ?" InsertCommand="INSERT INTO [Config] ([ID], [MaxPlays], [CurrentGame], [AdminFee], [CharityFee], [TicketPrice], [InitialJackpot], [RolloverAmount]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [Config] WHERE ([ID] = ?)" UpdateCommand="UPDATE [Config] SET [MaxPlays] = ?, [CurrentGame] = ?, [AdminFee] = ?, [CharityFee] = ?, [TicketPrice] = ?, [InitialJackpot] = ?, [RolloverAmount] = ? WHERE [ID] = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                            <asp:Parameter Name="MaxPlays" Type="Int32" />
                            <asp:Parameter Name="CurrentGame" Type="Int32" />
                            <asp:Parameter Name="AdminFee" Type="Double" />
                            <asp:Parameter Name="CharityFee" Type="Double" />
                            <asp:Parameter Name="TicketPrice" Type="Double" />
                            <asp:Parameter Name="InitialJackpot" Type="Int32" />
                            <asp:Parameter Name="RolloverAmount" Type="Double" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="ID" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="MaxPlays" Type="Int32" />
                            <asp:Parameter Name="CurrentGame" Type="Int32" />
                            <asp:Parameter Name="AdminFee" Type="Double" />
                            <asp:Parameter Name="CharityFee" Type="Double" />
                            <asp:Parameter Name="TicketPrice" Type="Double" />
                            <asp:Parameter Name="InitialJackpot" Type="Int32" />
                            <asp:Parameter Name="RolloverAmount" Type="Double" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    &nbsp;&nbsp;&nbsp;
                Set MaxPlays to 0 to allow users to purchase unlimited tickets.
                </div>
                <!-- end panel body -->
            </div>
            <!-- end panel -->
        </div>
        <!-- end row -->
        <div class="row">
            <div class="panel w3-card">
                <div class="panel-heading w3-blue">
                    <h4>Current Draw Pool and Earnings</h4>
                </div>
                <div class="panel-body panel-noborder">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="100%">
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
                        <HeaderStyle BackColor="#2196F3" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT TOP 1 Pool, AdminFees, CharityDonations, DrawID, GameStart FROM PrizePool ORDER BY DrawID DESC"></asp:SqlDataSource>
                </div>
                <!-- end panel body -->
            </div>
            <!-- end panel -->
        </div>
        <!-- end row -->
        <div class="row">
            <div class="panel w3-card">
                <div class="panel-heading w3-brown">
                    <h4>Total Earnings and Charity Donations</h4>
                </div>
                <div class="panel-body panel-noborder">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource5" ForeColor="#333333" GridLines="None" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField />
                            <asp:BoundField DataField="Sum Of AdminFees" HeaderText="Sum Of AdminFees" SortExpression="Sum Of AdminFees" />
                            <asp:BoundField DataField="Sum Of CharityDonations" HeaderText="Sum Of CharityDonations" SortExpression="Sum Of CharityDonations" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#795548" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [PrizePool Query]"></asp:SqlDataSource>

                </div>
            </div>
        </div>
        <!-- end row -->
        <div class="row">
            <div class="panel w3-card">
                <div class="panel-heading w3-pink">
                    <h4>Last Draw Numbers</h4>
                </div>
                <div class="panel-body panel-noborder">
                    <asp:GridView ID="LastDrawGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="DrawID" DataSourceID="SqlDataSource3">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
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
                        <HeaderStyle BackColor="#E91E63" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#E91E63" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT TOP 1 * FROM Draws ORDER BY DrawID DESC"></asp:SqlDataSource>
                    <asp:Label ID="Label1" runat="server"></asp:Label>

                </div>
                <div class="panel-heading w3-pink">
                    <h4>Last Draw Winners</h4>
                </div>
                <div class="panel-body panel-noborder">

                    <asp:GridView ID="LastDrawWinners" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="PlayID" DataSourceID="SqlDataSource4">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField />
                            <asp:BoundField />
                            <asp:BoundField DataField="PlayID" HeaderText="PlayID" InsertVisible="False" ReadOnly="True" SortExpression="PlayID" />
                            <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                            <asp:BoundField DataField="Number1" HeaderText="Number1" SortExpression="Number1" />
                            <asp:BoundField DataField="Number2" HeaderText="Number2" SortExpression="Number2" />
                            <asp:BoundField DataField="Number3" HeaderText="Number3" SortExpression="Number3" />
                            <asp:BoundField DataField="Winnings" HeaderText="Winnings" SortExpression="Winnings" />
                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                            <asp:BoundField DataField="PurchaseID" HeaderText="PurchaseID" SortExpression="PurchaseID" />
                            <asp:BoundField DataField="WinID" HeaderText="WinID" SortExpression="WinID" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#E91E63" Font-Bold="False" ForeColor="White" />
                        <PagerStyle BackColor="#E91E63" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT [PlayID], [UserID], [Number1], [Number2], [Number3], [Winnings], [Date], [PurchaseID], [WinID] FROM [Latest Winners]"></asp:SqlDataSource>

                </div>
            </div>
        </div>
        <!-- end row -->
    </div>
    <!-- container end -->
</asp:Content>
