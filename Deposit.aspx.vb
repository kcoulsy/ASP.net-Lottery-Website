Imports System.Data.OleDb
Public Class WebForm8
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("ID") Is Nothing Then
            Response.Redirect("Login.aspx")
        Else
            'If the user is logged in, find their balance and change the label on the page.

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

    Protected Sub DepositButton_Click(sender As Object, e As EventArgs) Handles DepositButton.Click
        Dim DubDeposit As Double = DepositTextBox.Text
        Dim DubBalance As Double = BalanceLabel.Text 'balance label.text is set on page load.
        Dim NewBalance As Double = DubBalance + DubDeposit
        Dim UpdateSql As String = "UPDATE Users SET Users.Balance=" & NewBalance.ToString & " WHERE Users.ID=" & Session("ID")

        'Connecting to the database and running the SQL
        Dim dbConn As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("/App_Data/1428728.mdb"))
        Dim dbCmd As New OleDbCommand(UpdateSql, dbConn)
        dbConn.Open()
        dbCmd.ExecuteNonQuery()

        'Create a transaction for the deposit
        Dim InsertTran As String = "INSERT INTO Transactions ([UserID],[Type],[Amount],[TransactionDate],[Balance]) VALUES (" & Session("ID") & ",'Deposit'," & DubDeposit & ",Now()," & NewBalance & ")"
        Dim TranCmd As New OleDbCommand(InsertTran, dbConn)
        TranCmd.ExecuteNonQuery()

        'Close the DatabaseConnection then Redirect
        dbConn.Close()
        Response.Redirect("Usercp.aspx")
    End Sub
End Class