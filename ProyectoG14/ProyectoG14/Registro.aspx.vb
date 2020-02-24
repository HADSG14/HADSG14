﻿Public Class Registro
    Inherits System.Web.UI.Page

    Dim email As String
    Dim numconfir As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Console.WriteLine("inicio del click")
        Dim esender As New EmailSender.Class1
        Dim dataAcccess As New AccesoDatos.Class1
        email = TextBox3.Text
        Dim nombre As String = TextBox6.Text
        Dim apellidos As String = TextBox7.Text
        Dim cont As String = TextBox4.Text
        Dim contr As String = TextBox5.Text

        Randomize()
        numconfir = CLng(900000 * Rnd()) + 1000000

        Dim tipo As String = DropDownList1.SelectedValue

        Dim enlace As String = "http://hadsg14.azurewebsites.net/ConfirmarCorreo.aspx?email=" & email & "&numconfir=" & numconfir
        Dim msg As String = "<html><header></header><body> Haz click en el siguiente enlace para verificar tu cuenta: <a href='" & enlace & "'> verificar </a></body></html>"

        Console.WriteLine("creadas variables")

        If cont <> contr Then
            Label1.Visible = True
            Return
        End If

        Console.WriteLine("compara contra")

        Label1.Visible = False
        Dim conectado As Boolean = dataAcccess.conectar()

        If conectado = False Then
            ErrorSql.Text = "fallo en la conexión"
        Else
            ErrorSql.Text = "conectado"
        End If
        Console.WriteLine(dataAcccess.insertar(email, nombre, apellidos, cont, numconfir, tipo))
        dataAcccess.cerrarconexion()
        esender.enviarEmail(email, msg)
        link_verificar.Visible = True

    End Sub

    Protected Sub TextBox3_TextChanged(sender As Object, e As EventArgs) Handles TextBox3.TextChanged

    End Sub


    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles link_verificar.Click
        Dim location As String = "~/ConfirmarCorreo.aspx?email=" & TextBox3.Text
        Response.Redirect(location)
        'Server.Execute(location)
    End Sub
End Class