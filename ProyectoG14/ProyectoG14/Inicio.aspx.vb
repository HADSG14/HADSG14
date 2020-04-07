Imports System.Data.SqlClient

Public Class Inicio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim correo As String = email.Text
        Dim sec As New Security.Security
        Dim contraseña As String = pass.Text
        Dim bd As New AccesoDatos.Class1
        contraseña = sec.crypt(contraseña)
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
            Dim lista As List(Of String)

            'USUARIO: ALUMNO
            If type = "Alumno" Then
                System.Web.Security.FormsAuthentication.SetAuthCookie(type, False)
                Session("type") = type
                Application.Lock()

                'Calculando número de alumnos loggeados
                Dim NS As Integer = Application.Contents("alumnos")
                NS = Application.Contents("alumnos") + 1
                Application.Contents("alumnos") = NS


                'Creando lista de emails de alumnos
                If Application.Contents("emails_alumnos") Is Nothing Then
                    lista = New List(Of String)
                Else
                    lista = Application.Contents("emails_alumnos")
                End If

                lista.Add(correo)
                Application.Contents("emails_alumnos") = lista

                Application.UnLock()
                Response.Redirect("Alumnos/Alumnos.aspx")

                'USUARIO: PROFESOR
            Else
                System.Web.Security.FormsAuthentication.SetAuthCookie(type, False)
                Session("type") = type
                Application.Lock()

                'Calculando el número de profesores loggeados
                Dim NS As Integer = Application.Contents("profesores")
                NS = Application.Contents("profesores") + 1
                Application.Contents("profesores") = NS

                'Creando lista de emails de profesores
                If Application.Contents("emails_profesores") Is Nothing Then
                    lista = New List(Of String)
                Else
                    lista = Application.Contents("emails_profesores")
                End If

                lista.Add(correo)
                Application.Contents("emails_profesores") = lista


                Application.UnLock()
                Response.Redirect("Profesores/Profesor.aspx")
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