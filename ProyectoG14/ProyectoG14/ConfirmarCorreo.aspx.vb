Public Class ConfirmarCorreo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim bd As New AccesoDatos.Class1
        Dim email As String = Request.Params("email")
        bd.conectar()
        bd.verificar(email)
        email_label.Text = email
        bd.cerrarconexion()
    End Sub

End Class