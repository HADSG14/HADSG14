<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Profesor.aspx.vb" Inherits="ProyectoG14.Profesor" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

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
            width: 403px;
            height: 691px;
            margin-left: 342px;
            margin-top: 71px;
            text-align: center;
        }
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style7 {
            font-size: xx-large;
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
                    Bienvenido profesor</div>
                </span><span class="auto-style1">
                <br />
                </span>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="auto-style7">Asignaturas</asp:LinkButton>
                <br class="auto-style7" />
                <br class="auto-style7" />
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="auto-style7">Tareas</asp:LinkButton>
                <br class="auto-style7" />
                <br class="auto-style7" />
                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="auto-style7">Grupos</asp:LinkButton>
                <br />
                <br />
                <br />
                <asp:LinkButton ID="LinkButton5" runat="server" CssClass="auto-style7">Importar Tareas</asp:LinkButton>
                <br />
                <br />
                <br />
                <asp:LinkButton ID="LinkButton6" runat="server" CssClass="auto-style7">Exportar Tareas</asp:LinkButton>
                <br />
                <br />
                <br />
                <br />
                <span class="auto-style1">
                <asp:LinkButton ID="LinkButton4" runat="server">Cerrar sesión</asp:LinkButton>
                <ajaxToolkit:ConfirmButtonExtender ID="LinkButton4_ConfirmButtonExtender" runat="server" BehaviorID="LinkButton4_ConfirmButtonExtender" ConfirmText="¿Estás seguro de que quieres salir?" TargetControlID="LinkButton4" />
                <br />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <span class="auto-style1">
                        <div>
                            <span class="auto-style1">
                            <asp:Timer ID="Timer1" runat="server" Interval="5000">
                            </asp:Timer>
                            </span>
                            <br />
                            Alumnos:
                            <asp:Label ID="NAlumnos" runat="server" Text="Label"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp; Profesores:
                            <asp:Label ID="NProfesores" runat="server" Text="Label"></asp:Label>
                            <br />
                            <span class="auto-style1">
                            <asp:ListBox ID="ListBox1" runat="server" Width="140px"></asp:ListBox>
                            <asp:ListBox ID="ListBox2" runat="server" Width="140px"></asp:ListBox>
                            <br />
                            <br />
                            </span>
                            
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        </span>
                    </ContentTemplate>
                </asp:UpdatePanel>
            
                </span>
            </div>
        </div>
    </form>


</body>
</html>
