Imports System.Data.OleDb
Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If Session("ID") Is Nothing Then
            'if not logged in Use the notloggedin master page so you can login from the nav bar.
            Me.MasterPageFile = "~/NotLoggedIn.master"
        Else
            Me.MasterPageFile = "~/Lottery.master"
        End If

        Dim dbConn As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("/App_Data/1428728.mdb"))
        dbConn.Open()

        Dim LastDraw As String = "SELECT TOP 1 * FROM Draws ORDER BY DrawID DESC"
        Dim LastDrawCmd As New OleDbCommand(LastDraw, dbConn)
        Dim LDReader As OleDbDataReader = LastDrawCmd.ExecuteReader




        'Need Last Draw Numbers



    End Sub

End Class