Public Class Home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Application.Contents("alumnos") Is Nothing Then
            NAlumnos.Text = "0"

        Else
            NAlumnos.Text = Application.Contents("alumnos")

        End If

        If Application.Contents("emails_profesores") Is Nothing Then
            NProfesores.Text = "0"
        Else
            NProfesores.Text = Application.Contents("profesores")

        End If




        ListBox1.DataSource = Application.Contents("emails_alumnos")
        ListBox1.DataBind()
        ListBox2.DataSource = Application.Contents("emails_profesores")
        ListBox2.DataBind()

    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("TareasAlumno.aspx")
    End Sub

    Protected Sub LinkButton4_Click(sender As Object, e As EventArgs) Handles LinkButton4.Click

        'Borrado de Cookies
        System.Web.Security.FormsAuthentication.SignOut()
        Application.Lock()

        'Reduciendo el contador de profesores -1
        Dim NS As Integer = Application.Contents("alumnos")
        NS = Application.Contents("alumnos") - 1
        Application.Contents("alumnos") = NS

        'Borrando email de la lista
        Dim lista As List(Of String) = Application.Contents("emails_alumnos")
        lista.Remove(Session("email"))
        Application.Contents("emails_alumnos") = lista

        Application.UnLock()

        'Borrado de variables Session
        Session.Abandon()
        Response.Redirect("~/Inicio.aspx")
    End Sub
End Class