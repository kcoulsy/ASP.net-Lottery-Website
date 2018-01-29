<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Lottery.Master" CodeBehind="UserEntries.aspx.vb" Inherits="LotteryWebsite.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server"> 
    <div class="container">    
    <div class="navbar navbar-default">
    <ul class="nav navbar-nav">
      <li ><asp:HyperLink ID="AdminLink" runat="server" NavigateUrl="~/Admin.aspx">Control Panel</asp:HyperLink></li>
      <li><asp:HyperLink ID="DrawLink" runat="server" NavigateUrl="~/Draw.aspx">Draw</asp:HyperLink></li>
      <li><asp:HyperLink ID="ViewUsers" runat="server" NavigateUrl="~/UserList.aspx">User List</asp:HyperLink></li>
      <li class="active"><asp:HyperLink ID="ViewUsersEntries" runat="server" NavigateUrl="~/UserEntries.aspx">Entries</asp:HyperLink></li>
    </ul>
</div>
 
    <div class="row">
            <div class="col-lg-12 text-center text-underline" style="margin-bottom:5px;">
            <h3>Admin Entries List</h3>
            </div>
        </div>
    <div class="row">
        <div class="panel w3-card">
            <div class="panel-heading w3-blue">
                Filter
            </div>
            <div class="panel-body">
                
                User ID <asp:TextBox ID="UserIDText" runat="server"></asp:TextBox>
                &nbsp;(Leave Blank to show all)<br />
                DrawID <asp:TextBox ID="DrawIDText" runat="server"></asp:TextBox>
                &nbsp;(Leave blank to show all, Set 0 to show latest)<br />
                Only Show Winners?:
                <asp:CheckBox ID="WinCheck" runat="server" />
                <br />
                <asp:Button ID="UpdateFilter" runat="server" Text="Filter" />
                <br />
            </div>
        </div>
    </div><!-- end row -->
    
    
    
    <div class="row">
        <div class="panel w3-card">
            <div class="panel-heading w3-green">Entry List</div>
            <div class="panel-body panel-noborder">
                <asp:GridView ID="GridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                         <asp:BoundField />
                         <asp:BoundField />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#4CAF50" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </div>
        </div>
    </div><!-- end row -->
</div>



</asp:Content>
