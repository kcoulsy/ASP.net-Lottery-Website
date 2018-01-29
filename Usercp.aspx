<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Lottery.Master" CodeBehind="Usercp.aspx.vb" Inherits="LotteryWebsite.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
<div class="container">
        <div class="row">
            <div class="col-lg-12 text-center text-underline" style="margin-bottom:5px;">
            <h3>User Control Panel</h3>
            </div>
        </div>
    <div class="row">
        <div class="col-md-6">
            <div class="row">
                
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" BorderStyle="None" BorderWidth="0px" CellPadding="4" Width="100%" >
                    <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [Users] WHERE ([User] = ?)">
                        <SelectParameters>
                            <asp:SessionParameter Name="User" SessionField="User" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div><!-- row -->
            
            <div class="row">
                <div class="panel w3-card">
                <div class="panel-heading w3-indigo"><h4>Account Balance</h4></div>
                <div class="panel-body">
                    <div class="row">
                        Balance: £<asp:Label ID="BalanceLabel" runat="server" Text="##"></asp:Label>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:Button ID="WithdrawButton" runat="server" Text="Withdraw" class="btn w3-button w3-red w3-block" />
                        </div>
                        <div class="col-md-6">
                            <asp:Button ID="DepositButton" runat="server" Text="Deposit" class="btn w3-button w3-red w3-block" />
                        </div>
                    </div>
                </div><!-- end panel body -->
            </div><!-- end panel -->

            </div><!-- end row -->
        </div><!-- end balance div  -->
        <div class="col-md-6">
            <div class="panel w3-card">
                <div class="panel-heading w3-blue-grey"><h4>Change Details</h4></div>
                <div class="panel-body">
                    

                    <div class="row">
                        <div class="col-md-6">
                        Email:
                        <asp:TextBox ID="UpdateEmail" runat="server" Placeholder="Email" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        Password:
                        <asp:TextBox ID="UpdatePass" runat="server" Placeholder="New Password" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        Confirm:
                        <asp:TextBox ID="UpdatePassConf" runat="server" Placeholder="Confirm Password" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        <asp:Button ID="UpdateDetails" runat="server" Text="Update Details" class="btn btn-success w3-button w3-blue"/>
                        </div>
                    </div>
                   
                    <asp:Label ID="UpdateLabel" runat="server"></asp:Label>
                </div><!-- end panel body -->
            </div><!-- end panel  -->
        </div><!-- end details div col -->
    </div><!-- end row -->
    <div class="row">
        <div class="col-lg-12">
        <div class="panel w3-card">
            <div class="panel-heading w3-teal">
                <h4>Transactions</h4>
            </div>
            <div class="panel-body panel-noborder">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TransactionID" DataSourceID="TransactionsSQL" ForeColor="#333333" GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField /><asp:BoundField />
                        <asp:BoundField DataField="TransactionID" HeaderText="TransactionID" InsertVisible="False" ReadOnly="True" SortExpression="TransactionID" />
                        <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                        <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                        <asp:BoundField DataField="TransactionDate" HeaderText="TransactionDate" SortExpression="TransactionDate" />
                        <asp:BoundField DataField="PlayID" HeaderText="PlayID" SortExpression="PlayID" />
                        <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#009688" Font-Bold="false" ForeColor="White" />
                    <HeaderStyle BackColor="#009688" Font-Bold="false" ForeColor="White" />
                    <PagerStyle BackColor="#009688" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="TransactionsSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [Transactions] WHERE ([UserID] = ?) ORDER BY [TransactionID] DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="ID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div><!-- end panel body  -->
        </div><!-- end panel -->
            </div><!-- end col --> 
    </div><!-- end row -->
</div><!-- end container -->
</asp:Content>
