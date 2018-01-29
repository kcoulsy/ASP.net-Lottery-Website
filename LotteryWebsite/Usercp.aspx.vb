Imports System.Data.OleDb
Public Class WebForm4
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("ID") Is Nothing Then
            Response.Redirect("Login.aspx")
            'Redirect to the login page if not logged in
        Else
            Dim BalSql As String
            BalSql = "SELECT * FROM Users WHERE User = '" & Session("User") & "'"

            Dim dbConn As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("/App_Data/1428728.mdb"))
            Dim dbCmd As New OleDbCommand(BalSql, dbConn)
            dbConn.Open()
            Dim dbReader As OleDbDataReader = dbCmd.ExecuteReader()
            While dbReader.Read()
                'We update the balance label above the withdraw/deposit buttons
                BalanceLabel.Text = dbReader("Balance")
                'Populate the textbox under update details
                UpdateEmail.Text = dbReader("Email")
            End While

            dbConn.Close()
        End If

    End Sub

    Protected Sub UpdateDetails_Click(sender As Object, e As EventArgs) Handles UpdateDetails.Click
        Dim NewEmail As String = UpdateEmail.Text
        Dim NewPass As String = UpdatePass.Text
        'SQL to update the user details.
        Dim UpdateSql As String = "UPDATE Users SET Users.Email = '" & UpdateEmail.Text & "', Users.Pass= '" & UpdatePass.Text & "' WHERE Users.ID=" & Session("ID")

        Dim dbConn As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("/App_Data/1428728.mdb"))
        Dim dbUpdateCmd As New OleDbCommand(UpdateSql, dbConn)
        dbConn.Open()


        If UpdatePass.Text = UpdatePassConf.Text Then
            'If the 2 passwords match. Then execute the SQL
            dbUpdateCmd.ExecuteNonQuery()
            UpdateLabel.Text = "Details Updated!"
        Else
            'Otherwise provide an error.
            UpdateLabel.Text = "Passwords do not match!"
        End If
        dbConn.Close()
    End Sub

    Protected Sub DataList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DataList1.SelectedIndexChanged

    End Sub

    Protected Sub WithdrawButton_Click(sender As Object, e As EventArgs) Handles WithdrawButton.Click

        Response.Redirect("Withdraw.aspx")
    End Sub

    Protected Sub DepositButton_Click(sender As Object, e As EventArgs) Handles DepositButton.Click
        Response.Redirect("Deposit.aspx")
    End Sub
End Class