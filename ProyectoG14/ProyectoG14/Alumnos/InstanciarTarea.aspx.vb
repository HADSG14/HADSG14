Imports System.Data.SqlClient

Public Class InstanciarTarea
    Inherits System.Web.UI.Page

    Private Shared dtTareas As New DataTable
    Private Shared db As New AccesoDatos.Class1
    Private Shared adapter As New SqlDataAdapter()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Usuario.Text = Session("email")
        Tarea.Text = Request.Params("codigo")
        HEstimadas.Text = Request.Params("horas")
        Usuario.Enabled = False
        Tarea.Enabled = False
        HEstimadas.Enabled = False


        If Page.IsPostBack Then
            'Refrescar tablas
            dtTareas = Session("Instancias")

        Else

            db.conectar()

            'GridView
            Session("Instancias") = db.getInstancias(Session("email"))
            dtTareas = Session("Instancias")
            Grid.DataSource = dtTareas
            Grid.DataBind()
            db.cerrarconexion()





        End If

    End Sub

    Protected Sub Usuario_TextChanged(sender As Object, e As EventArgs) Handles Usuario.TextChanged

    End Sub

    Protected Sub Grid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Grid.SelectedIndexChanged

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        db.conectar()

        If db.insertarInstancias(Usuario.Text, Tarea.Text, CInt(HEstimadas.Text), CInt(HDedicadas.Text)) Then

            Dim row As DataRow = dtTareas.NewRow
            row("CodTarea") = Tarea.Text
            row("Email") = Usuario.Text
            row("HEstimadas") = HEstimadas.Text
            row("HReales") = HDedicadas.Text
            dtTareas.Rows.Add(row)
            Grid.DataSource = dtTareas
            Grid.DataBind()
        Else
            MsgBox("La tarea ya ha sido instanciada")
        End If
        db.cerrarconexion()







    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        System.Web.Security.FormsAuthentication.SignOut()

        Application.Lock()
        Dim NS As Integer = Application.Contents("alumnos")
        NS = Application.Contents("alumnos") - 1
        Application.Contents("alumnos") = NS
        Application.UnLock()
        Session.Abandon()
        Response.Redirect("Inicio.aspx")
    End Sub
End Class