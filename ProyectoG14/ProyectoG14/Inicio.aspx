<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio.aspx.vb" Inherits="ProyectoG14.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            font-size: xx-large;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 422px;
            text-align: center;
            height: 417px;
            margin-left: 342px;
            margin-top: 71px;
        }
    </style>
</head>
<body style="margin-top: 0px; background: url('fondo2.png') no-repeat;">
    <form id="form1" runat="server">
        <div class="auto-style3">
            <div class="auto-style4" style="padding: 0px 0px 0px 0px; margin-left: auto; margin-right: auto; background-color: #FFFFFF; border-radius: 10px;">
                <span class="auto-style2">
                <br />
                Inicia Sesión</span><span class="auto-style1"><br />
                <br />
                <br />
                &nbsp;&nbsp;
                E-mail :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="email" runat="server" Height="25px" Width="169px" BackColor="Transparent"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" ErrorMessage="*" ForeColor="Red" style="text-align: right"></asp:RequiredFieldValidator>
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Error de sintaxis" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                <br />
                <span class="auto-style1">Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&nbsp;<asp:TextBox ID="pass" runat="server" Height="25px" Width="169px" BackColor="Transparent" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
&nbsp;
                <asp:Button ID="Button1" runat="server" Height="30px" Text="Login" Width="93px" />
                <br />
                <br />
                <asp:Label ID="Label_error" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <br />
                ¿Todavía no tienes cuenta? 
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False">Regístrate</asp:LinkButton>
&nbsp;<br />
&nbsp;¿Has olvidado tu contraseña?  
                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False">Cambiar Contraseña</asp:LinkButton>
                <br />
            </div>
        </div>
    </form>
</body>
</html>
