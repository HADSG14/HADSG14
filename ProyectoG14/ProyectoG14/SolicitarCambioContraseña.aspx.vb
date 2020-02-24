Public Class SolicitarCambioContraseña
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Label_clave.Visible = True
        ButtonConfirmar.Visible = True
        InsertarClave.Visible = True
        Dim email As String = TextBox1.Text
        Button1.Text = "Volver a enviar"
        Dim bd As New AccesoDatos.Class1
        bd.conectar()
        Randomize()
        Dim clave As Integer = CLng(900000 * Rnd()) + 1000000
        bd.updateClave(email, clave)
        bd.cerrarconexion()

    End Sub

    Protected Sub ButtonConfirmar_Click(sender As Object, e As EventArgs) Handles ButtonConfirmar.Click
        Dim email As String = TextBox1.Text
        Dim bd As New AccesoDatos.Class1
        Dim claveintroducida As String = InsertarClave.Text
        bd.conectar()
        Dim clave As String = bd.getClave(email).ToString
        bd.cerrarconexion()

        If clave <> claveintroducida Then
            ErrorClave.Visible = True
        Else
            Response.Redirect("~/CambiarContraseña.aspx?email=" & email)
        End If


    End Sub

    Protected Sub InsertarClave_TextChanged(sender As Object, e As EventArgs) Handles InsertarClave.TextChanged

    End Sub
End Class