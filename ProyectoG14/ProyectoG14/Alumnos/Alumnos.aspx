<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Alumnos.aspx.vb" Inherits="ProyectoG14.Home" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 341px;
            height: 550px;
            margin-left: 342px;
            margin-top: 71px;
        }
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style5 {
            font-size: xx-large;
        }
        .auto-style6 {
            font-size: x-large;
            text-align: left;
        }
        .auto-style8 {
            font-size: large;
        }
    </style>
</head>
<body style="text-align: left; margin-top: 0px; background: url('fondo2.png') no-repeat">
    <form id="form1" runat="server">
        <div class="auto-style3">
            <div class="auto-style4" style="padding: 0px 0px 0px 0px; margin-left: auto; margin-right: auto; background-color: #FFFFFF; border-radius: 10px;">
                <span class="auto-style5">
                <br />
                Bienvenido Alumno<br />
                <br />
                </span><span class="auto-style1">
                <br />
                <span class="auto-style6">&nbsp;<asp:LinkButton ID="LinkButton1" runat="server">Tareas Genéricas</asp:LinkButton>
                <br />
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton2" runat="server">Tareas Propias</asp:LinkButton>
                <br />
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton3" runat="server">Grupos</asp:LinkButton>
                <br />
                <br />
                </span>
                <asp:LinkButton ID="LinkButton4" runat="server">Cerrar sesión</asp:LinkButton>
                <ajaxToolkit:ConfirmButtonExtender ID="LinkButton4_ConfirmButtonExtender" runat="server" BehaviorID="LinkButton4_ConfirmButtonExtender" ConfirmText="¿Estas seguro de que deseas salir??" TargetControlID="LinkButton4">
                </ajaxToolkit:ConfirmButtonExtender>
                <br />
                <br />
                </span>
                <asp:ScriptManager ID="ScriptManager2" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Timer ID="Timer1" runat="server" Interval="5000">
                        </asp:Timer>
                        <span class="auto-style8">Alumnos:</span><asp:Label ID="NAlumnos" runat="server" CssClass="auto-style8" Text="Label"></asp:Label>
                        <span class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Profesores:</span><asp:Label ID="NProfesores" runat="server" CssClass="auto-style8" Text="Label"></asp:Label>
                        <br />
                        <asp:ListBox ID="ListBox1" runat="server" Width="140px"></asp:ListBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ListBox ID="ListBox2" runat="server" Width="140px"></asp:ListBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br class="auto-style1" />
            </div>
        </div>
    </form>
</body>
</html>
