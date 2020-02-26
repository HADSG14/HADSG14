﻿Imports System.Data.SqlClient

Public Class Inicio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim correo As String = email.Text & " "
        Dim contraseña As String = " " + pass.Text
        Dim bd As New AccesoDatos.Class1
        bd.conectar()
        Dim resultado As SqlDataReader = bd.checkAccount(correo)
        Dim confirmado As Boolean
        Dim passBD As String

        While resultado.Read
            passBD = resultado.Item("pass")
            confirmado = resultado.Item("confirmado")
        End While

        resultado.Close()


        If passBD <> contraseña Then
            Label_error.Text = "El usuario o contraseña introducidos no son correctos"
        ElseIf confirmado <> True Then
            Label_error.Text = "Parece que su cuenta no esta verificada"
        Else
            Response.Redirect("Home.aspx")
        End If


        bd.cerrarconexion()




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