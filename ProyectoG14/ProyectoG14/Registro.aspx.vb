Public Class Registro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim esender As New EmailSender.Class1
        Dim msg As String = "<html><header></header><body> hola </body></html>"
        Dim email As String = TextBox3.Text
        Dim cont As String = TextBox4.Text
        Dim contr As String = TextBox5.Text
        If cont <> contr Then
            Label1.Visible = True
            Return

        End If
        Label1.Visible = False
        esender.enviarEmail(email, msg)
    End Sub

    Protected Sub TextBox3_TextChanged(sender As Object, e As EventArgs) Handles TextBox3.TextChanged

    End Sub
End Class