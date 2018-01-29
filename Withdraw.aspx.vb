Imports System.Data.OleDb
Public Class WebForm7
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("ID") Is Nothing Then 'You need to be logged in, if not it will redirect away.
            Response.Redirect("Login.aspx")
        Else
            'Find the balance to show the user on page load
            Dim BalSql As String = "SELECT * FROM Users WHERE User = '" & Session("User") & "'"

            Dim dbConn As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("/App_Data/1428728.mdb"))
            Dim dbCmd As New OleDbCommand(BalSql, dbConn)
            dbConn.Open()
            Dim dbReader As OleDbDataReader = dbCmd.ExecuteReader()
            While dbReader.Read()
                BalanceLabel.Text = dbReader("Balance")
            End While

            dbConn.Close()
        End If
    End Sub

    Protected Sub WithdrawButton_Click(sender As Object, e As EventArgs) Handles WithdrawButton.Click


        Dim DubWithdraw As Double = WithdrawTextBox.Text
        Dim DubBalance As Double = BalanceLabel.Text
        Dim NewBalance As Double = DubBalance - DubWithdraw

        If NewBalance >= 0 Then 'Will the balance be greater than 0 if you take the amount in the text box away from the balance.

            Dim UpdateSql As String = "UPDATE Users SET Users.Balance=" & NewBalance.ToString & " WHERE Users.ID=" & Session("ID")

            'Connecting to the database and running the SQL
            Dim dbConn As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("/App_Data/1428728.mdb"))
            Dim dbCmd As New OleDbCommand(UpdateSql, dbConn)
            dbConn.Open()
            dbCmd.ExecuteNonQuery() 'Run the update sql

            'Insert a transaction
            Dim InsertTran As String = "INSERT INTO Transactions ([UserID],[Type],[Amount],[TransactionDate],[Balance]) VALUES (" & Session("ID") & ",'Withdraw'," & DubWithdraw & ",Now()," & NewBalance & ")"
            Dim TranCmd As New OleDbCommand(InsertTran, dbConn)
            TranCmd.ExecuteNonQuery()

            dbConn.Close()
            Response.Redirect("Usercp.aspx") 'When it done redirct the user back to the Control Panel
        Else
            ErrorLabel.Text = "You can't withdraw more than you have!"
        End If


    End Sub
End Class