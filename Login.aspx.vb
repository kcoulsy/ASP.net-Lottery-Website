Imports System.Data.OleDb
Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("ID") IsNot Nothing Then
            Response.Redirect("Home.aspx")
            'If you are logged in redirect the user to the home page.
        End If

    End Sub

    Protected Sub LoginButton_Click(sender As Object, e As EventArgs) Handles LoginButton.Click

        'Creating a SQL that will pull information from any Database Row with Both Username and Password matching what was entered to login
        Dim sql As String
        sql = "SELECT ID, User, FirstName FROM Users WHERE Users.User='" & UserLogin.Text & "' AND Users.Pass='" & PassLogin.Text & "'"

        'Connecting to the database and running the SQL
        Dim dbConn As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("/App_Data/1428728.mdb"))
        Dim dbCmd As New OleDbCommand(sql, dbConn)
        dbConn.Open()
        Dim dbReader As OleDbDataReader = dbCmd.ExecuteReader()

        'Should it find a matching user, it will create a session with ID, User and FirstName Stored
        If dbReader.Read() Then
            SuccessLabel.Text = "You have logged in successfuly"
            Session("ID") = dbReader("ID")
            Session("User") = dbReader("User")
            Session("FirstName") = dbReader("FirstName")
            Response.Redirect("Home.aspx")
        Else
            'If not it will output an error message
            SuccessLabel.Text = "That Username/Password combination was not found!"
        End If
        dbReader.Close()
        dbConn.Close()
    End Sub
End Class