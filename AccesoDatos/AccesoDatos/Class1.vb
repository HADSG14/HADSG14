Imports System.Data.SqlClient
Imports System.Xml

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


    Public Shared Function importarXML(ByVal ListaTareas As XmlNodeList, ByVal CodAsig As String) As Boolean
        dst.Reset()
        Try
            Dim dap As New SqlDataAdapter("Select * From TareasGenericas", conexion)
            Dim bld As New SqlCommandBuilder(dap)
            dap.Fill(dst, "TareasGenericas")

            Dim tabla As DataTable = dst.Tables("TareasGenericas")

            For i = 0 To ListaTareas.Count - 1
                Dim dr As DataRow = tabla.NewRow
                dr("Codigo") = ListaTareas(i).Attributes(0).InnerText
                dr("Descripcion") = ListaTareas(i).ChildNodes(0).InnerText
                dr("CodAsig") = CodAsig
                dr("HEstimadas") = ListaTareas(i).ChildNodes(1).InnerText
                dr("Explotacion") = ListaTareas(i).ChildNodes(2).InnerText
                dr("TipoTarea") = ListaTareas(i).ChildNodes(3).InnerText
                tabla.Rows.Add(dr)
            Next

            dap.Update(dst, "TareasGenericas")
            dst.AcceptChanges()
        Catch ex As Exception
            Return False
        End Try

        Return True
    End Function



    Public Shared Function crearXML(ByVal asignatura As String) As XmlDocument

        dst.Reset()
        Dim dap As New SqlDataAdapter("SELECT * FROM TareasGenericas WHERE CodAsig = '" & asignatura & "'", conexion)
        Dim bld As New SqlCommandBuilder(dap)
        dap.Fill(dst, "Instancias")


        Dim xd As New XmlDocument
        Dim dt As DataTable = dst.Tables("Instancias")
        Dim dr As DataRow
        Dim tareas As XmlElement = xd.CreateElement("tareas")
        Dim i As Integer
        For i = 0 To dt.Rows.Count - 1

            Dim tarea As XmlElement = xd.CreateElement("tarea")
            Dim codigo As XmlAttribute = xd.CreateAttribute("codigo")

            'creacion nodos
            Dim descripcion As XmlElement = xd.CreateElement("descripcion")
            Dim hestimadas As XmlElement = xd.CreateElement("hestimadas")
            Dim explotacion As XmlElement = xd.CreateElement("explotacion")
            Dim tipotarea As XmlElement = xd.CreateElement("tipotarea")

            dr = dt.Rows(i)

            'creacion texto de nodos
            Dim xcodigo As XmlText = xd.CreateTextNode(dr("Codigo"))            Dim xdescripcion As XmlText = xd.CreateTextNode(dr("Descripcion"))
            Dim xhestimadas As XmlText = xd.CreateTextNode(dr("HEstimadas"))
            Dim xexplotacion As XmlText = xd.CreateTextNode(dr("Explotacion"))            Dim xtipotarea As XmlText = xd.CreateTextNode(dr("TipoTarea"))


            'asignacion texto a nodos
            codigo.AppendChild(xcodigo)
            descripcion.AppendChild(xdescripcion)
            hestimadas.AppendChild(xhestimadas)
            explotacion.AppendChild(xexplotacion)
            tipotarea.AppendChild(xtipotarea)

            'meterle los nodos a tarea
            tarea.Attributes.Append(codigo)
            tarea.AppendChild(descripcion)
            tarea.AppendChild(hestimadas)
            tarea.AppendChild(explotacion)
            tarea.AppendChild(tipotarea)

            'guardar tarea
            tareas.AppendChild(tarea)
        Next
        xd.AppendChild(tareas)
        Return xd

    End Function

    Public Shared Function getTareasGenericas(ByVal asignatura As String) As DataTable

        dst.Reset()
        Dim dap As New SqlDataAdapter("SELECT * FROM TareasGenericas WHERE CodAsig = '" & asignatura & "'", conexion)
        Dim bld As New SqlCommandBuilder(dap)
        dap.Fill(dst, "tarea")
        Return dst.Tables("tarea")
    End Function



    Public Shared Sub cerrarconexion()
        conexion.Close()

    End Sub

End Class