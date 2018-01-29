Imports System.Data.OleDb
Public Class WebForm10
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("ID") Is Nothing Then
            Response.Redirect("Home.aspx")
        Else
            Dim AdmSql As String
            AdmSql = "SELECT Admin FROM Users WHERE Users.ID = " & Session("ID")

            Dim dbConn As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("/App_Data/1428728.mdb"))
            Dim dbCmd As New OleDbCommand(AdmSql, dbConn)
            dbConn.Open()
            Dim dbReader As OleDbDataReader = dbCmd.ExecuteReader()
            If dbReader.Read() Then 'If not an admin then redirect away
                If dbReader("Admin") = 0 Then
                    Response.Redirect("Home.aspx")
                End If
            End If
        End If
    End Sub
End Class