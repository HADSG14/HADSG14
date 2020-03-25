Imports System.Xml

Public Class ImportarTareas
    Inherits System.Web.UI.Page
    Private Shared bd As AccesoDatos.Class1
    Private Shared ds As DataSet
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim email As String = Session("email")
        DropDownList1.AutoPostBack = True



        If Page.IsPostBack Then

            Xml1.DocumentSource = Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")
            Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl")



        End If

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged

        Xml1.DocumentSource = Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")
        Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl")

    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        bd.conectar()

        Dim xd As New XmlDocument
        xd.Load(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml"))
        Dim ListaTareas As XmlNodeList
        ListaTareas = xd.GetElementsByTagName("tarea")

        If bd.importarXML(ListaTareas, DropDownList1.SelectedValue.ToString) Then
            MsgBox("El archivo XML se ha importado correctamente en la base de datos")
        Else
            MsgBox("Error: El archivo XML no se ha podido insertar")
        End If

        bd.cerrarconexion()
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("Profesor.aspx")

    End Sub
End Class