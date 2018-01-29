<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Lottery.Master" CodeBehind="Play.aspx.vb" Inherits="LotteryWebsite.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

 p.MsoNormal
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:8.0pt;
	margin-left:0in;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	}
p.MsoListParagraphCxSpFirst
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	}
p.MsoListParagraphCxSpMiddle
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	}
p.MsoListParagraphCxSpLast
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:8.0pt;
	margin-left:.5in;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	}
        .auto-style3 {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center text-underline" style="margin-bottom:5px;">
            <h3>Play</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="panel w3-card">
                    <div class="panel-heading w3-blue">
                        <h4>How to Play:</h4>
                    </div>
                    <div class="panel-body">
                        <p class="MsoNormal" style="font-size: large">
                            Playing this lottery is very simple!<o:p></o:p></p>
                        <p class="MsoListParagraphCxSpFirst" style="text-indent:-.25in;mso-list:l0 level1 lfo1">
                            <span class="auto-style3"><![if !supportLists]><span>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>Make sure you have enough balance to purchase a ticket</span><o:p></o:p></p>
                        <p class="MsoListParagraphCxSpMiddle" style="text-indent:-.25in;mso-list:l0 level1 lfo1">
                            <span class="auto-style3"><![if !supportLists]><span>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>Enter 3 different numbers into the boxes or click the random button</span><o:p></o:p></p>
                        <p class="MsoListParagraphCxSpMiddle" style="text-indent:-.25in;mso-list:l0 level1 lfo1">
                            <span class="auto-style3"><![if !supportLists]><span>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>You can’t purchase more than one ticket with the exact same number</span><o:p></o:p></p>
                        <p class="MsoListParagraphCxSpMiddle" style="text-indent:-.25in;mso-list:l0 level1 lfo1">
                            <span class="auto-style3"><![if !supportLists]><span>4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>The ticket cost is 
                            <asp:Label ID="TicketCostLabel" runat="server" Text="£1"></asp:Label>
                            </span> <o:p></o:p>
                        </p>
                        <p class="MsoListParagraphCxSpMiddle" style="text-indent:-.25in;mso-list:l0 level1 lfo1">
                            <span class="auto-style3"><![if !supportLists]><span>5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>Wait for the admin to draw the numbers at the end of the week!</span><o:p></o:p></p>
                        <p class="MsoListParagraphCxSpLast" style="text-indent:-.25in;mso-list:l0 level1 lfo1">
                            <span class="auto-style3"><![if !supportLists]><span>6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><![endif]>Prizes are awarded automatically</span><o:p></o:p></p>
                        <p class="MsoNormal" style="font-size: large">
                            <o:p>
                    <asp:HyperLink ID="PlayBack" runat="server" NavigateUrl="~/PrizeBreakdown.aspx">To see a full prize breakdown, click here.</asp:HyperLink>
                            </o:p>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="play-panel panel w3-card">
                    <div class="panel-heading w3-teal">
                        <h4>Purchase Ticket</h4>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            Your Balance:
                    <asp:Label ID="AccBal" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="row">
                            JackPot:
                    <asp:Label ID="JackPot" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="form-group row">
                            <div class="col-xs-4">
                                1.
                        <asp:TextBox ID="Number1" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-xs-4">
                                2. 
                        <asp:TextBox ID="Number2" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-xs-4">
                                3.
                        <asp:TextBox ID="Number3" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <asp:Button ID="PurchaseTicket" runat="server" Text="Purchase" class="btn btn-success btn-block" />
                            </div>
                            <div class="col-xs-6">
                                <asp:Button ID="Random" runat="server" Text="Random" class="btn btn-primary btn-block" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <asp:Label ID="PurchaseLabel" runat="server" ValidateRequestMode="Disabled"></asp:Label>
                        </div>
                    </div>
                    <!-- end panel body -->
                </div>
                <!-- end panel -->
            </div>
            <!--end col -->
        </div>
        <!-- end row -->
        <div class="row">
            <div class="col-lg-12">
            <div class="panel w3-card">
                <div class="panel-heading w3-red">
                    <h4>Your tickets this draw:</h4>
                </div>
                <div class="panel-body panel-noborder">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PlayID" DataSourceID="ValidTickets" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True" AllowSorting="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField /> 
                            <asp:BoundField DataField="PlayID" HeaderText="PlayID" InsertVisible="False" ReadOnly="True" SortExpression="PlayID" />
                            <asp:BoundField DataField="Number1" HeaderText="Number1" SortExpression="Number1" />
                            <asp:BoundField DataField="Number2" HeaderText="Number2" SortExpression="Number2" />
                            <asp:BoundField DataField="Number3" HeaderText="Number3" SortExpression="Number3" />
                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                            <asp:BoundField DataField="PurchaseID" HeaderText="PurchaseID" SortExpression="PurchaseID" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#F44336" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#F44336" Font-Bold="False" ForeColor="White" />
                        <PagerStyle BackColor="#F44336" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="ValidTickets" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [Entries] WHERE (([UserID] = ?) AND ([DrawID] = ?))">
                        <SelectParameters>
                            <asp:SessionParameter Name="UserID" SessionField="ID" Type="Int32" />
                            <asp:Parameter DefaultValue="0" Name="DrawID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <!-- panel body end -->
            </div>
            <!-- end panel -->
        </div><!-- end col -->
            </div>
        <!-- end row -->
    </div>
    <!-- end container -->
</asp:Content>
