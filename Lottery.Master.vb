Imports System.Data.OleDb
Public Class Site1
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Making the header change based on whether the user is logged in or not, ie. if there is a session.
        If Session("ID") Is Nothing Then
            LoggedInLinks.Visible = False
            LoggedOutLinks.Visible = True

        Else
            LoggedInLinks.Visible = True
            LoggedOutLinks.Visible = False




            'Show admin link
            Dim AdmSql As String
            AdmSql = "SELECT Admin,FirstName FROM Users WHERE Users.ID = " & Session("ID") & ""

            Dim dbConn As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("/App_Data/1428728.mdb"))
            Dim dbCmd As New OleDbCommand(AdmSql, dbConn)
                dbConn.Open()
                Dim dbReader As OleDbDataReader = dbCmd.ExecuteReader()
            If dbReader.Read() Then
                UserNavName.Text = dbReader("FirstName")
                If dbReader("Admin") = 1 Then
                    AdminLinks.Visible = True
                Else
                    AdminLinks.Visible = False
                End If
            End If


            dbConn.Close()
            End If
    End Sub

End Class