Imports System.Xml

Public Class ExportarTareas
    Inherits System.Web.UI.Page
    Private Shared bd As AccesoDatos.Class1
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim email As String = Session("email")
        DropDownList1.AutoPostBack = True
    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        bd.conectar()
        Dim tabla As DataTable = bd.getTareasGenericas(DropDownList1.SelectedValue)
        For Each dc As DataColumn In tabla.Columns
            dc.ColumnName = dc.ColumnName.ToLower
            If dc.ColumnName = "codigo" Then
                dc.ColumnMapping = MappingType.Attribute
            ElseIf dc.ColumnName = "codasig" Then
                dc.ColumnMapping = MappingType.Hidden
            Else
                dc.ColumnMapping = MappingType.Element

            End If

        Next dc



        Dim config As New XmlWriterSettings
        config.Indent = True
        config.Encoding = Encoding.UTF8
        tabla.DataSet.DataSetName = "tareas"
        Dim writer As XmlWriter = XmlWriter.Create(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml"), config)
        writer.WriteProcessingInstruction("xml", "version=""1.0"" standalone=""yes""")
        tabla.WriteXml(writer, XmlWriteMode.IgnoreSchema)
        writer.WriteEndDocument()

        writer.Close()


        bd.cerrarconexion()
        MsgBox("Exportado correctamente")
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("Profesor.aspx")
    End Sub
End Class