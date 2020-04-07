Public Class TareasAlumno
    Inherits System.Web.UI.Page

    Private Shared datatable As New DataTable
    Private Shared dtTareas As New DataTable
    Private Shared db As New AccesoDatos.Class1



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        DropDownList1.AutoPostBack = True

        If Page.IsPostBack Then
            'Refrescar tablas
            datatable = Session("Asignaturas")
            dtTareas = Session("Tareas")



        Else

            db.conectar()

            'DropdownList
            datatable = db.getTablaAsignaturas(Session("email"))
            Session("Asignaturas") = datatable

            DropDownList1.DataSource = datatable
            DropDownList1.DataTextField = "codigoasig"
            DropDownList1.DataValueField = "codigoasig"
            DropDownList1.DataBind()

            'GridView

            Session("Tareas") = db.getTablaTareasAlumno(DropDownList1.SelectedValue)
            dtTareas = Session("Tareas")
            GridView1.DataSource = dtTareas
            GridView1.DataBind()
            db.cerrarconexion()





        End If


    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Dim codigo As String = GridView1.SelectedRow.Cells(1).Text.ToString
        Dim horas As String = GridView1.SelectedRow.Cells(4).Text.ToString
        Response.Redirect("InstanciarTarea.aspx?codigo=" & codigo & "&horas=" & horas)
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        db.conectar()
        Session("Tareas") = db.getTablaTareasAlumno(DropDownList1.SelectedValue)
        dtTareas = Session("Tareas")
        GridView1.DataSource = dtTareas
        GridView1.DataBind()

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
        Response.Redirect("~/Inicio.aspx")
    End Sub
End Class