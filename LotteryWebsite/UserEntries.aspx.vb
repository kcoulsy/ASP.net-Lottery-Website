Imports System.Data.OleDb
Public Class WebForm11
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("ID") Is Nothing Then 'If the user is not logged in then they should be redirected.
            Response.Redirect("Home.aspx")
        Else
            Dim AdmSql As String
            AdmSql = "SELECT Admin FROM Users WHERE Users.ID = " & Session("ID")

            Dim dbConn As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("/App_Data/1428728.mdb"))
            Dim dbCmd As New OleDbCommand(AdmSql, dbConn)
            dbConn.Open()
            Dim dbReader As OleDbDataReader = dbCmd.ExecuteReader()
            If dbReader.Read() Then 'If the user is not an admin then they should be redirected.
                If dbReader("Admin") = 0 Then
                    Response.Redirect("Home.aspx")
                End If
            End If

            'On the page load, show every entry into the table.
            Dim GridViewData As String = "SELECT * FROM Entries ORDER BY PlayID Desc"
            Dim da As New OleDbDataAdapter(GridViewData, dbConn)
            Dim dt As New DataTable
                da.Fill(dt)
                GridView.DataSource = dt.DefaultView
                GridView.DataBind()
                dbConn.Close()
            End If

        'The main problem with this page was pagination in the table, 
        '   however I wanted the flexibility of filters. So I decided to populate it this way.

    End Sub


    Protected Sub UpdateFilter_Click(sender As Object, e As EventArgs) Handles UpdateFilter.Click
        'The default setings
        Dim FilterSQL As String = "SELECT * FROM Entries ORDER BY PlayID Desc"

        If UserIDText.Text = "" Then
            If DrawIDText.Text = "" Then


                If WinCheck.Checked = True Then ' Only the Winenrs checkbox is filtered
                    FilterSQL = "SELECT * FROM Entries WHERE Prize>0 ORDER BY PlayID Desc"
                Else 'No filters
                    FilterSQL = "SELECT * FROM Entries ORDER BY PlayID Desc"
                End If

            ElseIf DrawIDText.Text IsNot Nothing Then

                If WinCheck.Checked = True Then 'The DrawID and Winners only
                    FilterSQL = "SELECT * FROM Entries WHERE DrawID=" & DrawIDText.Text & " AND Prize>0 ORDER BY PlayID Desc"
                Else 'DrawID only
                    FilterSQL = "SELECT * FROM Entries WHERE DrawID=" & DrawIDText.Text & "  ORDER BY PlayID Desc"
                End If

            End If
        ElseIf UserIDText.Text IsNot Nothing Then
            If DrawIDText.Text = "" Then

                If WinCheck.Checked = True Then ' UserID and Winners Checkbox
                    FilterSQL = "SELECT * FROM Entries WHERE UserID=" & UserIDText.Text & " AND Prize>0 ORDER BY PlayID Desc"
                Else 'UserID only
                    FilterSQL = "SELECT * FROM Entries WHERE UserID=" & UserIDText.Text & " ORDER BY PlayID Desc"
                End If

            ElseIf DrawIDText.Text IsNot Nothing Then

                If WinCheck.Checked = True Then 'Everything filtered
                    FilterSQL = "SELECT * FROM Entries WHERE UserID=" & UserIDText.Text & " AND DrawID=" & DrawIDText.Text & " AND Prize>0 ORDER BY PlayID Desc"
                Else 'DrawID and UserID only
                    FilterSQL = "SELECT * FROM Entries WHERE UserID=" & UserIDText.Text & " AND DrawID=" & DrawIDText.Text & " ORDER BY PlayID Desc"
                End If

            End If
        End If

        'When you click the button it will first select the appropriate SQL above then run it below.
        Dim dbConn As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("/App_Data/1428728.mdb"))
        dbConn.Open()
        Dim da As New OleDbDataAdapter(FilterSQL, dbConn)
        Dim dt As New DataTable
        da.Fill(dt)
        GridView.DataSource = dt.DefaultView
        GridView.DataBind()
        dbConn.Close()
    End Sub
End Class