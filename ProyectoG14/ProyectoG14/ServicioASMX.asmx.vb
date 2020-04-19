Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel
Imports System.Data.SqlClient

' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class ServicioASMX
    Inherits System.Web.Services.WebService

    <WebMethod()>
    Public Function Media(ByVal asignatura As String) As Double
        Dim con As New SqlConnection
        con.ConnectionString = “Server=tcp:hads.database.windows.net,1433;Initial Catalog=Amigos;Persist Security Info=False;User ID=vadillo@ehu.es@hads;Password=curso19-20;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
        con.Open()
        Dim consulta As String = "Select avg(HReales) From EstudiantesTareas as e inner join TareasGenericas as t on e.CodTarea=t.Codigo where t.CodAsig='" & asignatura & "'"
        Dim da As New SqlDataAdapter(consulta, con)
        Dim ds As New DataSet
        da.Fill(ds, "Users")
        con.Close()

        If ds.Tables(0).Rows(0).Item(0) Is DBNull.Value Then
            Return -1
        End If
        Return ds.Tables(0).Rows(0).Item(0)
    End Function

End Class