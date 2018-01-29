Imports System.Data.OleDb
Public Class Site2
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If ((Not (Request.Cookies("UserName")) Is Nothing) _
                        AndAlso (Not (Request.Cookies("Password")) Is Nothing)) Then
                UserLogin.Text = Request.Cookies("UserName").Value
                PassLogin.Attributes("value") = Request.Cookies("Password").Value
            End If
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
            If CheckBoxRemember.Checked Then
                Response.Cookies("UserName").Expires = DateTime.Now.AddDays(30)
                Response.Cookies("Password").Expires = DateTime.Now.AddDays(30)
            Else
                Response.Cookies("UserName").Expires = DateTime.Now.AddDays(-1)
                Response.Cookies("Password").Expires = DateTime.Now.AddDays(-1)
            End If
            Response.Cookies("UserName").Value = UserLogin.Text.Trim
            Response.Cookies("Password").Value = PassLogin.Text.Trim
        Else
            'If not it will output an error message
            SuccessLabel.Text = "That Username/Password combination was not found!"
        End If
        dbReader.Close()
        dbConn.Close()
    End Sub

End Class