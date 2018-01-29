<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Lottery.Master" CodeBehind="UserList.aspx.vb" Inherits="LotteryWebsite.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="container">   
    <div class="navbar navbar-default">
    <ul class="nav navbar-nav">
      <li ><asp:HyperLink ID="AdminLink" runat="server" NavigateUrl="~/Admin.aspx">Control Panel</asp:HyperLink></li>
      <li><asp:HyperLink ID="DrawLink" runat="server" NavigateUrl="~/Draw.aspx">Draw</asp:HyperLink></li>
      <li class="active"><asp:HyperLink ID="ViewUsers" runat="server" NavigateUrl="~/UserList.aspx">User List</asp:HyperLink></li>
      <li><asp:HyperLink ID="ViewUsersEntries" runat="server" NavigateUrl="~/UserEntries.aspx">Entries</asp:HyperLink></li>
    </ul>
</div>

    <div class="row">
            <div class="col-lg-12 text-center text-underline" style="margin-bottom:5px;">
            <h3>Admin User List</h3>
            </div>
        </div>
    <div class="row">
    <div class="panel w3-card">
        <div class="panel-heading w3-blue">UseUser List</div>
        <div class="panel-body panel-noborder">
                
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField >
                            <ControlStyle Width="0px" />
                            <HeaderStyle Width="0px" />
                            </asp:BoundField>
                            <asp:BoundField >
                            <ControlStyle Width="0px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" >
                            <ControlStyle Width="2px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="User" HeaderText="User" SortExpression="User" >
                            <ControlStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" >
                            <ControlStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" >
                            <ControlStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="DateRegistered" HeaderText="DateRegistered" SortExpression="DateRegistered" />
                            <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" />
                            <asp:BoundField DataField="Admin" HeaderText="Admin" SortExpression="Admin" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
                        </Columns>
                        <EditRowStyle BackColor="#97C9E2" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#2196F3" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2196F3" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM [Users] WHERE [ID] = ?" InsertCommand="INSERT INTO [Users] ([ID], [User], [Pass], [FirstName], [LastName], [Email], [DateRegistered], [Balance], [Admin]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [User] = ?, [Pass] = ?, [FirstName] = ?, [LastName] = ?, [Email] = ?, [DateRegistered] = ?, [Balance] = ?, [Admin] = ? WHERE [ID] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                        <asp:Parameter Name="User" Type="String" />
                        <asp:Parameter Name="Pass" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="DateRegistered" Type="DateTime" />
                        <asp:Parameter Name="Balance" Type="Double" />
                        <asp:Parameter Name="Admin" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="User" Type="String" />
                        <asp:Parameter Name="Pass" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="DateRegistered" Type="DateTime" />
                        <asp:Parameter Name="Balance" Type="Double" />
                        <asp:Parameter Name="Admin" Type="Int32" />
                        <asp:Parameter Name="original_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Passwords deliberately not shown
            </p>
        </div><!-- panel body-->
    </div><!-- end panel -->
    </div><!-- end row-->
</div><!-- end container -->

</asp:Content>
