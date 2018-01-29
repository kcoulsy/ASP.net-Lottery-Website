Imports System.Net
Imports System.Net.Mail
Imports System.Drawing
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Data.OleDb

Public Class WebForm14
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub RecoverButton_Click(sender As Object, e As EventArgs) Handles RecoverButton.Click
        'This is a mock page and so will just update the label.
        SuccessLabel.Text = "Password Reset, please check your email and try to login again"
    End Sub
End Class