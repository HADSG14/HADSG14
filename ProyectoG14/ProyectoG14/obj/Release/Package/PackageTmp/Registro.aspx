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
<body>
    <form id="form1" runat="server">
        <div aria-hidden="False">
            <span class="auto-style2">Regístrate</span><span class="auto-style1"><br />
            <br />
            </span><span class="auto-style3">E-mail :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style3" Height="16px" Width="168px"></asp:TextBox>
            <span class="auto-style3">&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nombre:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox6" runat="server" CssClass="auto-style3" Height="16px" Width="168px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox6" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </span>
            <br class="auto-style3" />
            <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Error de sintaxis" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </span>
            <br class="auto-style3" />
            <span class="auto-style3">Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&nbsp;<span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style3" Height="16px" Width="168px" TextMode="Password"></asp:TextBox>
&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Apellidos: &nbsp;&nbsp;<asp:TextBox ID="TextBox7" runat="server" CssClass="auto-style3" Height="16px" Width="168px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox7" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="Error de sintaxis" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"></asp:RegularExpressionValidator>
            <br />
            Repetir Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&nbsp;<asp:TextBox ID="TextBox5" runat="server" CssClass="auto-style3" Height="16px" Width="168px" TextMode="Password"></asp:TextBox>
            <span class="auto-style3">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rol:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" Height="17px" Width="131px">
                <asp:ListItem Selected="True">Alumno</asp:ListItem>
                <asp:ListItem>Profesor</asp:ListItem>
            </asp:DropDownList>
            </span>
            <br />
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Las contraseñas no coinciden" Visible="False"></asp:Label>
            <br />
&nbsp;
            <asp:Button ID="Button1" runat="server" Height="36px" Text="Confirmar" Width="86px" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
