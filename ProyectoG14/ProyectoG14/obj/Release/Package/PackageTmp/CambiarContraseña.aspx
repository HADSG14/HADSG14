<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambiarContraseña.aspx.vb" Inherits="ProyectoG14.Cambiar_contraseña" %>

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
        <div>
            <div style="padding: 0px 0px 0px 0px; margin-left: auto; margin-right: auto; background-color: #FFFFFF; border-radius: 10px; text-align: center; width: 393px; height: 267px;">
                <br />
                Introduce Nueva Contraseña:<br />
                <br />
                <asp:TextBox ID="TextBox1" runat="server" Width="166px" TextMode="Password"></asp:TextBox>
            <span class="auto-style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="La contraseña debe tener mínimo 8 caracteres, un número y una mayúscula" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"></asp:RegularExpressionValidator>
                <br />
                </span>Repetir Contraseña:<br />
                <br />
                <asp:TextBox ID="TextBox2" runat="server" Width="166px" TextMode="Password"></asp:TextBox>
            <span class="auto-style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </span>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Confirmar" />
                <br />
                <asp:Label ID="Error" runat="server" ForeColor="Red" Text="Las contraseñas no coinciden" Visible="False"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
