<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InsertarTarea.aspx.vb" Inherits="ProyectoG14.InsertarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">


        .auto-style5 {
            font-size: xx-large;
            text-align: center;
        }
        
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 464px;
            height: 583px;
            margin-left: 342px;
            margin-top: 71px;
            text-align: left;
        }
        .auto-style7 {
            font-size: medium;
            text-align: left;
        }
        .auto-style8 {
            font-size: x-large;
            text-align: center;
        }
    </style>
</head>
<body style="text-align: left; margin-top: 0px; background: url('fondo2.png') no-repeat">
    <form id="form2" runat="server">
        <div class="auto-style3">
            <div class="auto-style4" style="padding: 0px 0px 0px 0px; margin-left: auto; margin-right: auto; background-color: #FFFFFF; border-radius: 10px;">
                <span class="auto-style5">
                <br />
                <div>
                    Insertar Tareas</div>
                <div class="auto-style3">
                <br />
                </span>
                <span class="auto-style8">
                    Codigo:<br />
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    Descripción:<br />
                    <asp:TextBox ID="TextBox2" runat="server" Height="138px" Width="374px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    Asignatura:<br />
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="codigoasig" DataValueField="codigoasig">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmigosConnectionString %>" SelectCommand="SELECT DISTINCT GruposClase.codigoasig FROM ProfesoresGrupo INNER JOIN GruposClase ON ProfesoresGrupo.codigogrupo = GruposClase.codigo WHERE (ProfesoresGrupo.email = @email)">
                        <SelectParameters>
                            <asp:SessionParameter Name="email" SessionField="email" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    Horas Estimadas:<br />
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    Tipo Tarea:<br />
                </span>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>Laboratorio</asp:ListItem>
                        <asp:ListItem>Examen</asp:ListItem>
                        <asp:ListItem>Ejercicio</asp:ListItem>
                    </asp:DropDownList>
                <span class="auto-style5">
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" Height="40px" Text="Insertar" Width="93px" />
                    <br />
                    <br />
                <br />
                <br />
                </span>
                <span class="auto-style7">&nbsp;&nbsp;&nbsp;</span></div>
            </div>
        </div>
    </form>

 
</body>
</html>
