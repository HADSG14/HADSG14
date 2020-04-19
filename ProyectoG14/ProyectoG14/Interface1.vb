Imports System.ServiceModel
Imports System.ServiceModel.Activation
Imports System.ServiceModel.Web

<ServiceContract([Namespace]:=" http://localhost:53743/ServiceMedia.svc")>
Public Interface Interface1
    <OperationContract()>
    Function Media(ByVal asignatura As String) As Double
End Interface
