Imports System.Data.SqlClient

Public Class Inicio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("type") = "Alumno" Then
            Response.Redirect("Alumnos.aspx")
        ElseIf Session("type") = "Profesor" Then
            Response.Redirect("Profesor.aspx")
            End If


    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim correo As String = email.Text
        Dim contraseña As String = pass.Text
        Dim bd As New AccesoDatos.Class1
        bd.conectar()
        Dim resultado As SqlDataReader = bd.checkAccount(correo)
        Dim confirmado As Boolean
        Dim passBD As String
        Dim type As String

        While resultado.Read
            passBD = resultado.Item("pass")
            confirmado = resultado.Item("confirmado")
            type = resultado.Item("tipo")
        End While

        resultado.Close()
        bd.cerrarconexion()


        If passBD <> contraseña Then
            Label_error.Text = "El usuario o contraseña introducidos no son correctos"
        ElseIf confirmado <> True Then
            Label_error.Text = "Parece que su cuenta no esta verificada"
        Else
            Session("email") = correo
            MsgBox(type)
            If type = "Alumno" Then
                Session("type") = type
                Response.Redirect("Alumnos.aspx")
            Else
                Session("type") = type
                Response.Redirect("Profesor.aspx")
        End If
        End If






    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("Registro.aspx")
    End Sub

    Protected Sub email_TextChanged(sender As Object, e As EventArgs) Handles email.TextChanged

    End Sub

    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
        Response.Redirect("SolicitarCambioContraseña.aspx")
    End Sub
End Class