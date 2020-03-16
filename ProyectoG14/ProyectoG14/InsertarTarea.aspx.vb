Public Class InsertarTarea
    Inherits System.Web.UI.Page
    Private Shared bd As New AccesoDatos.Class1
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim email As String = Session("email")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        bd.conectar()
        If bd.insertarTareas(TextBox1.Text, TextBox2.Text, DropDownList1.SelectedValue, CInt(TextBox3.Text), DropDownList2.SelectedValue) Then
            MsgBox("Tarea insertada correctamente")
            Response.Redirect("TareasProfesor.aspx")
        Else
            MsgBox("Error en la inserción")
        End If
        bd.cerrarconexion()
    End Sub

    Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged

    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Session.Abandon()
        Response.Redirect("Inicio.aspx")
    End Sub
End Class