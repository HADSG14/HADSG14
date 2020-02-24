<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SolicitarCambioContraseña.aspx.vb" Inherits="ProyectoG14.SolicitarCambioContraseña" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">


        .auto-style3 {
            font-size: medium;
        }
    </style>
</head>
<body style="margin-top: 30px; background: url('fondo2.png') no-repeat; height: 430px;">
    <form id="form1" runat="server">
            <div style="padding: 0px 0px 0px 0px; margin-left: auto; margin-right: auto; background-color: #FFFFFF; border-radius: 10px; text-align: center; width: 393px; height: 289px;" id="caja">
                <br />
                Introduce tu email:<br />
                <br />
                <asp:TextBox ID="TextBox1" runat="server" Width="166px"></asp:TextBox>
            <span class="auto-style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Solicitar clave" />
                <br />
                <br />
                </span>
                <asp:Label ID="Label_clave" runat="server" Text="Por favor, revisa tu correo electronico e instroduce la clave que te hemos enviado:" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="InsertarClave" runat="server" Width="89px" style="margin-left: 130px" Visible="False"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="ErrorClave" runat="server" ForeColor="Red" Text="Clave incorrecta" Visible="False"></asp:Label>
                <br />
                <br />
            <span class="auto-style3">
                <asp:Button ID="ButtonConfirmar" runat="server" Text="Solicitar clave" Visible="False" />
                </span>
                <br />
                <br />
            </div>
        <div>
        </div>
    </form>
</body>
</html>
