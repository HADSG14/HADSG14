Public Class Cambiar_contraseña
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        [Error].Visible = False
        Dim cont As String = TextBox1.Text
        Dim cont2 As String = TextBox2.Text
        Dim bd As New AccesoDatos.Class1
        Dim email As String = Request.Params("email")

        If cont <> cont2 Then
            [Error].Visible = True
        Else
            bd.conectar()
            bd.cambiarContraseña(email, cont)
            bd.cerrarconexion()
            Response.Redirect("Inicio.aspx")
        End If
    End Sub
End Class