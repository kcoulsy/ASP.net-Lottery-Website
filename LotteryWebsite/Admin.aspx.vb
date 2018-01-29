Imports System.Data.OleDb
Public Class WebForm9
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("ID") Is Nothing Then
            Response.Redirect("~/Home.aspx") 'If not logged in redirect away
        Else
            Dim AdmSql As String = "SELECT Admin FROM Users WHERE Users.ID = " & Session("ID")

            Dim dbConn As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("/App_Data/1428728.mdb"))
            Dim dbCmd As New OleDbCommand(AdmSql, dbConn)
            dbConn.Open()
            Dim dbReader As OleDbDataReader = dbCmd.ExecuteReader()
            If dbReader.Read() Then
                If dbReader("Admin") = 0 Then 'If the user is not an admin then redirect them away.
                    Response.Redirect("Home.aspx")
                End If
            End If
            dbConn.Close()
        End If
    End Sub

End Class