Imports System.Data.OleDb
Public Class WebForm6
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("ID") Is Nothing Then
            Response.Redirect("Login.aspx")
            'If not logged in you shouldn't see this page, so take them to the homepage
        Else
            'We will need to show the user the balance on this page, so they can see whether they can afford a ticket.
            Dim BalSql As String = "SELECT Balance FROM Users WHERE User = '" & Session("User") & "'"

            Dim dbConn As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("/App_Data/1428728.mdb"))
            Dim dbCmd As New OleDbCommand(BalSql, dbConn)
            dbConn.Open()
            Dim dbReader As OleDbDataReader = dbCmd.ExecuteReader()
            While dbReader.Read()
                AccBal.Text = dbReader("Balance")
            End While

            'We also need to find out the Jackpot, for this we first run an sql to find out which is the current game. Then find the pool in PrizePool
            Dim FindConfig As String = "SELECT CurrentGame FROM Config WHERE ID=1"
            Dim FindConfCmd As New OleDbCommand(FindConfig, dbConn)
            Dim ConfReader As OleDbDataReader = FindConfCmd.ExecuteReader

            If ConfReader.Read() Then
                Dim JackpotSql As String = "SELECT Pool FROM PrizePool WHERE DrawID=" & ConfReader("CurrentGame")
                Dim JackpotCmd As New OleDbCommand(JackpotSql, dbConn)
                Dim JackpotReader As OleDbDataReader = JackpotCmd.ExecuteReader

                If JackpotReader.Read() Then
                    JackPot.Text = JackpotReader("Pool")
                End If
            End If


            dbConn.Close()
            End If
    End Sub

    Protected Sub PurchaseTicket_Click(sender As Object, e As EventArgs) Handles PurchaseTicket.Click
        'First check logged in. If not logged in all the button will do is output an error. Although a non logged in user should
        '   not see this page, in the case of a bug i've decided to add this.
        If Session("ID") > 0 Then

            'The first thing the button will do is check that the numbers entered are a valid play.
            '   This includes, making sure they are numeric, different from one another, between 1 and 9.

            'Checking Numbers, created a boolean variable that will check the numbers are valid,
            Dim ValidNumbers As Boolean

            'Checking Number 1 is a number and between 1 and 9.
            If IsNumeric(Number1.Text) Then
                If Number1.Text < 10 AndAlso Number1.Text > 0 Then

                    'number 1 is right, now check number 2
                    If IsNumeric(Number2.Text) Then
                        If Number2.Text < 10 AndAlso Number2.Text > 0 Then

                            'number 1 and 2 are right, now check 3
                            If IsNumeric(Number3.Text) Then
                                If Number3.Text < 10 AndAlso Number3.Text > 0 Then

                                    'all 3 numbers are numeric and between 1 and 9
                                    'Now we will check that the 3 numbers are different from each other

                                    If Number1.Text = Number2.Text Then
                                        ValidNumbers = False

                                    ElseIf Number1.Text = Number3.Text Then
                                        ValidNumbers = False

                                    ElseIf Number2.Text = Number3.Text Then
                                        ValidNumbers = False

                                    Else 'if No 2 numbers are the same
                                        ValidNumbers = True

                                    End If

                                Else
                                    ValidNumbers = False 'As Number 3 is not between 1-9
                                End If
                            Else
                                ValidNumbers = False 'As Number 3 is not a number
                            End If

                        Else
                            ValidNumbers = False 'As Number 2 is not between 1-9
                        End If
                    Else
                        ValidNumbers = False 'As Number 2 is not a number
                    End If


                Else
                    ValidNumbers = False 'As Number 1 is not between 1-9
                End If
            Else
                ValidNumbers = False 'As Number 1 is not a number
            End If

            If ValidNumbers Then

                'If the numbers are valid (They are Numeric between 1-9 and all 3 numbers are different)
                'We will check that the user does not already have the ticket

                'This code is not the most elegant however after a lot of experimenting, 
                '      the only way I could get it do what I wanted was to just loop through the grid view, 
                '      it happens fast enough that the user will Not even notice, however I wanted to loop directly through the data source.

                'Making simple variables to make the code shorter. These are the inputted numbers.
                Dim N1 As String = Number1.Text
                Dim N2 As String = Number2.Text
                Dim N3 As String = Number3.Text

                'We created a variable called matches, which will increment if there is ticket with the same 3 numbers
                'If it is > 1 then it wont allow the user to purchase that ticket, as they already have it.
                Dim Matches As Integer = 0

                For i As Integer = 0 To GridView1.Rows.Count - 1
                    'We loop through each row of the Gridview (which shows already owned tickets)
                    'We use a variable match test, for each matching number it adds 1. If it gets to 3, logically there are 3 matching numbers
                    'So we increase the matches variable from above, as they have that ticket already.
                    Dim MatchTest As Integer = 0

                    'Take the Numbers from the already owned ticket and put them into new variables
                    Dim TicN1 As String = GridView1.Rows(i).Cells(1).Text 'Entry Number 1
                    Dim TicN2 As String = GridView1.Rows(i).Cells(2).Text 'Entry Number 2
                    Dim TicN3 As String = GridView1.Rows(i).Cells(3).Text 'Entry Number 3

                    If TicN1 = N1 Then
                        MatchTest = MatchTest + 1
                    ElseIf TicN1 = N2 Then
                        MatchTest = MatchTest + 1
                    ElseIf TicN1 = N3 Then
                        MatchTest = MatchTest + 1
                    End If

                    If TicN2 = N1 Then
                        MatchTest = MatchTest + 1
                    ElseIf TicN2 = N2 Then
                        MatchTest = MatchTest + 1
                    ElseIf TicN2 = N3 Then
                        MatchTest = MatchTest + 1
                    End If

                    If TicN2 = N1 Then
                        MatchTest = MatchTest + 1
                    ElseIf TicN2 = N2 Then
                        MatchTest = MatchTest + 1
                    ElseIf TicN2 = N3 Then
                        MatchTest = MatchTest + 1
                    End If

                    'The 3 above if statements would have been shorter if I had a seperate table storing the numbers in them
                    'However to make things easier in other places, I decided to keep the 3 numbers in the entries table


                    If MatchTest = 3 Then
                        Matches = Matches + 1
                    End If
                Next ' End of the loop

                'Assuming that that there are no matches, we can proceed to purchase the ticket
                If Matches = 0 Then


                    Dim dbConn As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("/App_Data/1428728.mdb"))
                    dbConn.Open()

                    'get the config information
                    Dim FindConfig As String
                    FindConfig = "SELECT * FROM Config WHERE ID=1"
                    Dim FindConfCmd As New OleDbCommand(FindConfig, dbConn)
                    Dim ConfReader As OleDbDataReader = FindConfCmd.ExecuteReader

                    If ConfReader.Read() Then

                        Dim MaxTickets As Boolean
                        If ConfReader("MaxPlays") = 0 Then 'If it's set to 0 then it allows unlimited tickets
                            MaxTickets = False
                        Else
                            If ConfReader("MaxPlays") <= GridView1.Rows.Count Then 'If there are a maximum number of tickets allow, then is maxTickets less than or equal to the number of tickets owned?
                                MaxTickets = True
                                PurchaseLabel.Text = "You already have the maximum of " & ConfReader("MaxPlays") & " tickets!"
                            Else
                                MaxTickets = False
                            End If

                        End If

                        If MaxTickets = False Then

                            Dim TicketCost As Double = ConfReader("TicketPrice")
                            Dim DrawID As Integer = ConfReader("CurrentGame")
                            Dim AdminFee As Double = ConfReader("AdminFee")
                            Dim CharityFee As Double = ConfReader("CharityFee")

                            'check balance to see if the user can play
                            Dim FindBal As String = "SELECT Balance FROM Users WHERE ID=" & Session("ID")
                            Dim FindBalCmd As New OleDbCommand(FindBal, dbConn)
                            Dim FindBalReader As OleDbDataReader = FindBalCmd.ExecuteReader

                            If FindBalReader.Read Then
                                If FindBalReader("Balance") > TicketCost Then
                                    'if the user can afford then we lower the balance by the ticket cost
                                    Dim NewBal As Double = FindBalReader("Balance") - TicketCost
                                    Dim UpdateBal As String = "UPDATE Users SET Users.Balance=" & NewBal & " WHERE Users.ID=" & Session("ID")
                                    Dim BalCmd As New OleDbCommand(UpdateBal, dbConn)
                                    BalCmd.ExecuteNonQuery()

                                    'After removing the ticket cost from balance, we create an entry for the user
                                    Dim MakeEntry As String = "INSERT INTO Entries ([UserID],[Number1],[Number2],[Number3],[Date],[DrawID]) VALUES (" & Session("ID") & "," & Number1.Text & "," & Number2.Text & "," & Number3.Text & ",Now(), 0)"
                                    Dim dbMakeEntry As New OleDbCommand(MakeEntry, dbConn)
                                    dbMakeEntry.ExecuteNonQuery()

                                    'Now we need to cross connect the transaction and entries in the db

                                    'get The PlayID from entries where the values are the same, then insert into Transactions with PlayID
                                    Dim PlayIDSel As String = "SELECT PlayID FROM Entries WHERE UserID=" & Session("ID") & " AND Number1=" & Number1.Text & " AND Number2=" & Number2.Text & " AND Number3=" & Number3.Text & " AND Date=Now() AND DrawID=0"
                                    Dim PlayIDSelCmd As New OleDbCommand(PlayIDSel, dbConn)
                                    Dim PlayIDRead As OleDbDataReader = PlayIDSelCmd.ExecuteReader
                                    If PlayIDRead.Read() Then
                                        Dim InsertTran As String = "INSERT INTO Transactions ([UserID],[Type],[Amount],[TransactionDate],[PlayID],[Balance]) VALUES (" & Session("ID") & ",'Ticket-Purchase'," & TicketCost & ",Now()," & PlayIDRead("PlayID") & "," & NewBal & ")"
                                        Dim TranCmd As New OleDbCommand(InsertTran, dbConn)
                                        TranCmd.ExecuteNonQuery()

                                        'Now get the transaction id and update the play
                                        Dim TranSel As String = "SELECT TransactionID FROM Transactions WHERE PlayID=" & PlayIDRead("PlayID")
                                        Dim TranSelCmd As New OleDbCommand(TranSel, dbConn)
                                        Dim TranRead As OleDbDataReader = TranSelCmd.ExecuteReader
                                        If TranRead.Read() Then
                                            Dim UpdateWinningsSql As String = "UPDATE Entries SET PurchaseID=" & TranRead("TransactionID") & " WHERE PlayID=" & PlayIDRead("PlayID")
                                            Dim dbUpdateWinningsCmd As New OleDbCommand(UpdateWinningsSql, dbConn)
                                            dbUpdateWinningsCmd.ExecuteNonQuery()
                                        End If
                                        TranRead.Close()
                                    End If 'End of playIdreader
                                    PlayIDRead.Close()
                                    'The above few sql's may have been easier to see in an access query, however I found it far easier to implement them this way.

                                    'Next we update the prize pool
                                    Dim FindPool As String
                                    FindPool = "SELECT * FROM PrizePool WHERE DrawID=" & ConfReader("CurrentGame")
                                    Dim FindPoolCmd As New OleDbCommand(FindPool, dbConn)
                                    Dim PoolReader As OleDbDataReader = FindPoolCmd.ExecuteReader

                                    If PoolReader.Read() Then
                                        'The new Jackpot Prize Pool will be the old one + the ticket price - the ticket fees.
                                        Dim NewPool As Double = ((1 - AdminFee - CharityFee) * TicketCost) + PoolReader("Pool")
                                        Dim NewAdminFees As Double = TicketCost * AdminFee + PoolReader("AdminFees")
                                        Dim NewCharityDonations As Double = TicketCost * CharityFee + PoolReader("CharityDonations")

                                        Dim UpdatePoolSql As String = "UPDATE PrizePool SET Pool=" & NewPool & ", AdminFees=" & NewAdminFees & ", CharityDonations=" & NewCharityDonations & " WHERE DrawID=" & DrawID
                                        Dim UpdatePoolCmd As New OleDbCommand(UpdatePoolSql, dbConn)
                                        UpdatePoolCmd.ExecuteNonQuery()
                                        Response.Redirect("Play.aspx")
                                    End If
                                    PoolReader.Close()

                                    'Recap of this script.
                                    '   - We check that the numbers are valid, in range, numeric and different
                                    '   - We compare these numbers against the tickets already purchased by the user
                                    '   - We check that the user has not hit the limit of number of tickets
                                    '   - Then we check that the user can afford a ticket (This and the one above could be done in either order)
                                    '   - Reduce Balance, insert a new entry, insert a new transaction, then cross connect the id's
                                    '   - Update the prize pool table for the entry.





                                Else
                                    Response.Redirect("Play.aspx")
                                    PurchaseLabel.Text = "You need to add to your balance to purchase a ticket!"
                                End If 'End of Balance > 0 if 
                            End If 'End the final bal reader
                            FindBalReader.Close()
                        End If 'End max tickets if
                    End If 'End the confreader
                    ConfReader.Close()
                    dbConn.Close()
                Else
                    PurchaseLabel.Text = "You Already have that ticket!"

                    'If there are matches Reset everything
                    Number1.Text = 0
                    Number2.Text = 0
                    Number3.Text = 0

                End If 'End Matches = 0 if 

            Else
                PurchaseLabel.Text = "Please use different numbers between 1 and 9"

            End If ' end of valid numbers if statement

        Else
            PurchaseLabel.Text = "You must log in to play"
        End If 'End the login if statement
        Response.Redirect("Play.aspx")
    End Sub

    Protected Sub Random_Click(sender As Object, e As EventArgs) Handles Random.Click
        'Generate 3 random numbers and set the value of the text boxes to them.
        Dim r As New List(Of Integer)
        Dim rg As New Random
        Dim rn As Integer
        Do
            rn = rg.Next(1, 10)
            If Not r.Contains(rn) Then
                r.Add(rn)
            End If
        Loop Until r.Count = 4
        Number1.Text = r(0).ToString
        Number2.Text = r(1).ToString
        Number3.Text = r(2).ToString
    End Sub

    Protected Sub ValidTickets_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles ValidTickets.Selecting

    End Sub
End Class