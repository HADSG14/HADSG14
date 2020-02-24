Imports System.Data.SqlClient

Public Class Class1
    Private Shared conexion As New SqlConnection
    Private Shared comando As New SqlCommand

    Public Shared Function conectar() As Boolean
        Try
            conexion.ConnectionString = “Server=tcp:hadsg14a.database.windows.net,1433;Initial Catalog=HADSG14;Persist Security Info=False;User ID=agarcia697@ikasle.ehu.eus@hadsg14a;Password=Asiergonzalo14;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
            conexion.Open()
        Catch ex As Exception
            Return False

        End Try
        Return True

    End Function

    Public Shared Function insertar(ByVal email As String, ByVal nombre As String, ByVal apellidos As String, ByVal pass As String, ByVal numconfir As Integer, ByVal tipo As String) As String

        Dim st = "Insert into Usuarios values('" & email & " ','" & nombre & "',' " & apellidos & "'," & numconfir & ", '0' ,' " & tipo & " ',' " & pass & "', 0)"


        Dim numregs As Integer
        comando = New SqlCommand(st, conexion)
        Try
            numregs = comando.ExecuteNonQuery()
        Catch ex As Exception
            cerrarconexion()

            Return ex.Message
        End Try

        Return (numregs & " registro(s) insertado(s) en la BD ")
    End Function


    Public Shared Function verificar(ByVal email As String) As String
        Dim st = "Update Usuarios Set [confirmado]=1 Where email='" & email & "'"
        Dim numregs As Integer
        comando = New SqlCommand(st, conexion)
        Try
            numregs = comando.ExecuteNonQuery()
        Catch ex As Exception
            cerrarconexion()

            Return ex.Message
        End Try
        Return (numregs & " registro(s) actualizado(s) en la BD ")
    End Function

    Public Shared Function checkAccount(ByVal email As String) As SqlDataReader

        Dim st = "select * from Usuarios where email='" & email & "'"
        comando = New SqlCommand(st, conexion)
        Dim RS As SqlDataReader
        RS = comando.ExecuteReader
        Return (RS)



    End Function

    Public Shared Function cambiarContraseña(ByVal email As String, ByVal pass As String) As String
        Dim st = "Update Usuarios Set [pass]='" & pass & "' Where email='" & email & "'"
        Dim numregs As Integer
        comando = New SqlCommand(st, conexion)
        Try
            numregs = comando.ExecuteNonQuery()
        Catch ex As Exception
            cerrarconexion()

            Return ex.Message
        End Try
        Return (numregs & " registro(s) actualizado(s) en la BD ")
    End Function

    Public Shared Function updateClave(ByVal email As String, ByVal clave As Integer) As Integer
        Dim st = "Update Usuarios Set [codpass]='" & clave & "' Where email='" & email & "'"

        comando = New SqlCommand(st, conexion)
        Try
            comando.ExecuteNonQuery()
        Catch ex As Exception
            cerrarconexion()

            Return -1
        End Try
        Return clave
    End Function

    Public Shared Function getClave(ByVal email As String) As Integer
        Dim st = "Select codpass from Usuarios where email='" & email & "'"
        comando = New SqlCommand(st, conexion)
        Dim clave As Integer
        Try
            clave = comando.ExecuteScalar()
        Catch ex As Exception
            cerrarconexion()

            Return -1
        End Try
        Return clave


    End Function



    Public Shared Sub cerrarconexion()
        conexion.Close()
    End Sub

End Class
