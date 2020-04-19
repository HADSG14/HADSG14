<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Registro.aspx.vb" Inherits="ProyectoG14.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            font-size: xx-large;
        }
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style3 {
            font-size: medium;
        }
    </style>
</head>
<body style="margin-top: 0px; background: url('fondo2.png') no-repeat;">
    <form id="form1" runat="server">
        <div aria-hidden="False">
            <span class="auto-style3">
            <br />
            <div style="padding: 10px 0px 0px 0px; margin-left: auto; margin-right: auto; background-color: #FFFFFF; border-radius: 10px; text-align: center; width: 393px;">
            <span class="auto-style3">
            <span class="auto-style2">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <br />
                Regístrate<br />
                </span><span class="auto-style1">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <span class="auto-style3"><span class="auto-style1">
                        <asp:Label ID="ResultadoLabel" runat="server" ForeColor="Black" style="font-size: small"></asp:Label>
            <br />
                        </span>E-mail :<br /> &nbsp;<asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style3" Height="16px" Width="168px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <br />
                        &nbsp;&nbsp;&nbsp;
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Error de sintaxis" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </span>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </span>
                <br />
                Nombre:<br />
            <asp:TextBox ID="TextBox6" runat="server" CssClass="auto-style3" Height="16px" Width="168px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox6" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <br />
                <br />
                Apellidos:<br />
                &nbsp;<asp:TextBox ID="TextBox7" runat="server" CssClass="auto-style3" Height="16px" Width="168px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox7" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <br />
            <br class="auto-style3" />
                Password:<br />
                &nbsp;&nbsp;<asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style3" Height="16px" Width="168px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            <br />
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="Error de sintaxis" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"></asp:RegularExpressionValidator>
            <br />
            Repetir Password:&nbsp;<br />
                &nbsp;<asp:TextBox ID="TextBox5" runat="server" CssClass="auto-style3" Height="16px" Width="168px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <br />
                <br />
&nbsp;Rol:&nbsp;<br />
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Height="17px" Width="131px">
                <asp:ListItem Selected="True">Alumno</asp:ListItem>
                <asp:ListItem>Profesor</asp:ListItem>
            </asp:DropDownList>
            </span>
            <br />
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Las contraseñas no coinciden" Visible="False"></asp:Label>
                <br />
            <br />
&nbsp;
            <asp:Button ID="Button1" runat="server" Height="36px" Text="Confirmar" Width="86px" />
                <br />
            <asp:Label ID="ErrorSql" runat="server" Text="Label"></asp:Label>
                <br />
&nbsp;<asp:LinkButton ID="link_verificar" runat="server" CausesValidation="False" Visible="False">Haz click aquí para verificar el email</asp:LinkButton>
                <br />
            </div>
            <br />
            &nbsp;&nbsp;</span><br />
            <br />
        </div>
    </form>
</body>
</html>
