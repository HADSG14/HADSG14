Public Class coordinador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        DropDownList1.AutoPostBack = True
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Dim servicio As New media.WebService1

        Dim media As Double = servicio.Media(DropDownList1.SelectedValue)
        If media = -1 Then
            HorasLabel.Text = "No hay horas dedicadas"
        Else
            HorasLabel.Text = "El número medio de horas dedicadas es: " & media & "h"
        End If

    End Sub
End Class