Imports System.Net.Mail
Imports System.Net.NetworkAccess
Public Class Class1

    Public Function enviarEmail(ByVal email As String, ByRef msge As String) As Boolean
        Try
            Dim msg = New MailMessage()
            msg.To.Add(New MailAddress(email, "HADS"))
            msg.From = New MailAddress("ggaldos002@ikasle.ehu.eus", "HADS")
            msg.Subject = "G14"
            msg.Body = msge
            msg.IsBodyHtml = True
            Dim client = New SmtpClient()
            client.UseDefaultCredentials = False
            client.Credentials = New System.Net.NetworkCredential("ggaldos002@ikasle.ehu.eus", "Gonzalito1998")
            client.Port = 587
            client.Host = "smtp.ehu.eus"
            client.DeliveryMethod = SmtpDeliveryMethod.Network
            client.EnableSsl = True
            client.Send(msg)
        Catch e As Exception
            Return False
        End Try
        Return True
    End Function

End Class
