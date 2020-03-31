Public Class Security
    Public Function crypt(ByVal password As String) As String
        Dim hash As New System.Security.Cryptography.MD5CryptoServiceProvider
        Dim ByteString() As Byte = System.Text.Encoding.ASCII.GetBytes(password)
        ByteString = hash.ComputeHash(ByteString)

        Dim finalString As String = Nothing

        For Each b As Byte In ByteString
            finalString &= b.ToString("x2")
        Next
        Return finalString
    End Function
End Class
