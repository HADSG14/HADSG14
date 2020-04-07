Public Class TareasProfesor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim email As String = Session("email")
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        System.Threading.Thread.Sleep(2000)
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        System.Web.Security.FormsAuthentication.SignOut()
        Session.Abandon()
        Application.Lock()
        Dim NS As Integer = Application.Contents("profesores")
        NS = Application.Contents("profesores") - 1
        Application.Contents("profesores") = NS
        Application.UnLock()
        Response.Redirect("~/Inicio.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("InsertarTarea.aspx")
    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs)

    End Sub

    Protected Sub SqlDataSource1_Selecting1(sender As Object, e As SqlDataSourceSelectingEventArgs)

    End Sub
End Class