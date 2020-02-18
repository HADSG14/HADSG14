Imports System.Data.SqlClient

Public Class Class1
    Private Shared conexion As New SqlConnection
    Private Shared comando As New SqlCommand

    Public Shared Function conectar() As String
        Try
            conexion.ConnectionString = “Server=tcp:hads-g14a.database.windows.net,1433;Initial Catalog=HADS-G14A;Persist Security Info=False;User ID=gontxi@live.com@hads-g14a;Password=Gonzalo1998;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
            conexion.Open()
        Catch ex As Exception
            Return False

        End Try
        Return True

    End Function

    Public Shared Function insertar(ByVal nombre As String) As String
        conectar()

        Dim st = "insert into Usuarios values ('" & nombre & " ','A',' a'," & 0 & "," & 0 & ",' n ',' n  '," & 0 & ")"
        Dim numregs As Integer
        comando = New SqlCommand(st, conexion)
        Try
            numregs = comando.ExecuteNonQuery()
        Catch ex As Exception
            cerrarconexion()

            Return ex.Message
        End Try
        cerrarconexion()


        Return (numregs & " registro(s) insertado(s) en la BD ")
    End Function


    Public Shared Function obtenerdatos() As SqlDataReader
        Dim st = "select * from tabla"
        comando = New SqlCommand(st, conexion)
        Return (comando.ExecuteReader())
    End Function

    Public Shared Sub cerrarconexion()
        conexion.Close()
    End Sub

End Class
