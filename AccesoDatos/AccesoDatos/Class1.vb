Imports System.Data.SqlClient

Public Class Class1
    Private Shared conexion As New SqlConnection
    Private Shared comando As New SqlCommand
    Private Shared dst As New DataSet

    Public Shared Function conectar() As Boolean
        Try
            conexion.ConnectionString = “Server=tcp:hads.database.windows.net,1433;Initial Catalog=Amigos;Persist Security Info=False;User ID=vadillo@ehu.es@hads;Password=curso19-20;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
            conexion.Open()
        Catch ex As Exception
            Return False

        End Try
        Return True

    End Function

    Public Shared Function insertar(ByVal email As String, ByVal nombre As String, ByVal apellidos As String, ByVal pass As String, ByVal numconfir As Integer, ByVal tipo As String) As String

        Dim st = "Insert into Usuarios values('" & email & "','" & nombre & "','" & apellidos & "'," & numconfir & ",'0','" & tipo & "','" & pass & "',0)"


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

        Return (comando.ExecuteReader())



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

    Public Shared Function getTablaTareasAlumno(ByVal asignatura As String) As DataTable
        dst.Reset()
        Dim dap As New SqlDataAdapter("select * from TareasGenericas WHERE CodAsig='" + asignatura + "'", conexion)
        Dim bld As New SqlCommandBuilder(dap)
        dap.Fill(dst, "Tareas")


        Return dst.Tables("Tareas")

    End Function

    Public Shared Function getTablaAsignaturas(ByVal email As String) As DataTable

        dst.Reset()
        Dim dap As New SqlDataAdapter("SELECT DISTINCT codigoasig FROM EstudiantesGrupo INNER JOIN GruposClase ON Grupo=codigo WHERE email='" & email & "'", conexion)
        Dim bld As New SqlCommandBuilder(dap)
        dap.Fill(dst, "Asignaturas")


        Return dst.Tables("Asignaturas")
    End Function

    Public Shared Function getInstancias(ByVal email As String) As DataTable

        dst.Reset()
        Dim dap As New SqlDataAdapter("SELECT * FROM EstudiantesTareas WHERE Email='" & email & "'", conexion)
        Dim bld As New SqlCommandBuilder(dap)
        dap.Fill(dst, "Instancias")


        Return dst.Tables("Instancias")
    End Function

    Public Shared Function insertarInstancias(ByVal Email As String, ByVal CodTareas As String, ByVal HEstimadas As Integer, ByVal HReales As Integer) As Boolean

        Dim st = "Insert into EstudiantesTareas values('" & Email & "','" & CodTareas & "','" & HEstimadas & "','" & HReales & "')"
        comando = New SqlCommand(st, conexion)
        Try
            comando.ExecuteNonQuery()
        Catch ex As Exception
            cerrarconexion()

            Return False
        End Try

        Return True
    End Function


    Public Shared Function insertarTareas(ByVal Codigo As String, ByVal descripcion As String, ByVal codasig As String, ByVal HEstimadas As Integer, ByVal Tipo As String) As Boolean
        Dim st = "Insert into TareasGenericas values('" & Codigo & "','" & descripcion & "','" & codasig & "','" & HEstimadas & "','False','" & Tipo & "')"
        comando = New SqlCommand(st, conexion)
        Try
            comando.ExecuteNonQuery()
        Catch ex As Exception
            cerrarconexion()

            Return False
        End Try

        Return True
    End Function

    Public Shared Sub cerrarconexion()
        conexion.Close()

    End Sub

End Class