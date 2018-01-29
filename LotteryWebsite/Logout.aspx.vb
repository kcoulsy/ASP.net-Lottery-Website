Public Class WebForm3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Simply kill the session and redirect to the homepage.
        Session.Abandon()
        Response.Redirect("Home.aspx")

    End Sub

End Class