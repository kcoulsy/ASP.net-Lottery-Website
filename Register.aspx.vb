Imports System.Data.OleDb
Public Class WebForm5
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("ID") IsNot Nothing Then
            Response.Redirect("Play.aspx")
        End If
    End Sub

    Protected Sub RegisterButton_Click(sender As Object, e As EventArgs) Handles RegisterButton.Click
        'First thing to do when you click register is check whether the username is in use
        'here Is an SQL checking if any username matches the input in the UserReg Textbox
        'This is followed by a connection to the database
        Dim CheckSql As String
        CheckSql = "SELECT User FROM Users WHERE Users.User='" & UserReg.Text & "'"
        Dim dbConn As New OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("/App_Data/1428728.mdb"))
        Dim dbCheck As New OleDbCommand(CheckSql, dbConn)

        dbConn.Open()

        Dim dbReader As OleDbDataReader = dbCheck.ExecuteReader()

        'If the user already exists, that's as far as it gets, displaying an error message to the user
        If dbReader.Read() Then
            SuccessLabel.Text = "There is already somebody registered with that Username"
        Else
            'Should the username exist, the next step is to check that both passwords entered match each other
            SuccessLabel.Text = ""
            If PassReg.Text = PassConfReg.Text Then
                'Following the password check, it should be fine to insert the data into the database, as we are using Validators on the text boxes to check that they have the right information entered.

                'Inserting the user data into the database, including the date and time.
                Dim RegSql As String
                RegSql = "INSERT INTO Users ([User],[Pass],[FirstName],[LastName],[Email],[Balance],[DateRegistered]) VALUES ('" & UserReg.Text & "','" & PassReg.Text & "','" & FirstNameReg.Text & "','" & LastNameReg.Text & "','" & EmailReg.Text & "','0', Now())"
                Dim dbReg As New OleDbCommand(RegSql, dbConn)
                dbReg.ExecuteNonQuery()

                'Once it has been inputted, we next need to create a session so that the user doesn't need to log in manually. 
                'However since the ID didn't exist before creating the user, and it auto increments, we need to check for it again. This is the same SQL as in Login.aspx
                Dim CheckRegSql As String
                CheckRegSql = "SELECT ID, User, FirstName FROM Users WHERE Users.User='" & UserReg.Text & "'"

                Dim dbCheckReg As New OleDbCommand(CheckRegSql, dbConn)

                Dim dbReaderReg As OleDbDataReader = dbCheckReg.ExecuteReader()

                'Creating a session
                If dbReaderReg.Read() Then
                    SuccessLabel.Text = "You registered successfuly"
                    Session("ID") = dbReaderReg("ID")
                    Session("User") = dbReaderReg("User")
                    Session("FirstName") = dbReaderReg("FirstName")
                    Response.Redirect("Home.aspx")
                End If

                dbReaderReg.Close()

            Else
                'Error message should the passwords be different from each other.
                SuccessLabel.Text = "Passwords Must Match"
            End If
        End If
        dbReader.Close()
        dbConn.Close()
    End Sub

End Class