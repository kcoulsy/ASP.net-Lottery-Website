<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Lottery.Master" CodeBehind="PrizeBreakdown.aspx.vb" Inherits="LotteryWebsite.WebForm13" %>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="container">
                <div class="row">
            <div class="col-lg-12 text-center text-underline" style="margin-bottom:5px;">
            <h3>Prize Breakdown</h3>
            </div>
        </div>
    <div class="col-md-6 col-md-offset-3">
        <div class="panel w3-card">
            <div class="panel-heading w3-blue"><h4>How prizes are awarded</h4></div>
            <div class="panel-body">
                <div class="row">

                    <p class="MsoNormal">
                        To win a prize you must match numbers. <o:p></o:p>
                    </p>
                    <p class="MsoNormal">
                        If you match a number with a drawn number you gain 2 points<o:p>.</o:p></p>
                    <p class="MsoNormal">
                        If you match a number with a bonus number you gain 1 point<o:p>.</o:p></p>
                    <p class="MsoNormal">
                        These points are totaled per ticket (yes you can win on multiple tickets!)<o:p></o:p></p>
                    <p class="MsoNormal">
                        You are then given a prize depending on the points you won.</p>
                    <p class="MsoNormal">
                        <asp:Table ID="Table1" runat="server" Width="101px">
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server">Points</asp:TableCell>
                                <asp:TableCell runat="server">Prize</asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server">6</asp:TableCell>
                                <asp:TableCell runat="server">8</asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server">5</asp:TableCell>
                                <asp:TableCell runat="server">4</asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server">4</asp:TableCell>
                                <asp:TableCell runat="server">2</asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server">3</asp:TableCell>
                                <asp:TableCell runat="server">1</asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </p>
                    <p class="MsoNormal">
                        The prize that you will win is the ratio of your prize to everyone else’s prize, multiplied by the jackpot.<o:p></o:p></p>
                    <p class="MsoNormal">
                        <strong>(Your Prize/Total Prize) * Prize Pool</strong><o:p></o:p></p>
                    <p class="MsoNormal">
                        If nobody wins anything, the next prizepool will be the current prizepool +
                        <asp:Label ID="Rollover" runat="server">£6 </asp:Label>
                        pounds.<o:p></o:p></p>
                    <p class="MsoNormal">
                        Otherwise it starts at 
                        <asp:Label ID="NewJackpot" runat="server">£10 </asp:Label>
                        !<o:p></o:p></p>
                    <p class="MsoNormal">
                    </p>
                    <div class="well">
                        An example:
<br />
                        You match 2 numbers and 1 bonus number
You gain 5 points (2+2+1). 
                        <br />
                        With this you get a prize of 4.
                        <br />
                        If there are a total of 10 Prizes awarded (Perhaps you win 4, then 3 other people win 2 because they only matched 1 numbers)
                        <br />
                        Then you win 40% of the jackpot (4/10 * Jackpot).

                    </div>
                </div>
                <div class="row">
                        <br />
                    <asp:HyperLink ID="PlayBack" runat="server" NavigateUrl="~/Play.aspx">Click here to go back to the Play page.</asp:HyperLink>
                        <br />
                </div>
            </div>
        </div>
    </div>    

    </div>
</asp:Content>
