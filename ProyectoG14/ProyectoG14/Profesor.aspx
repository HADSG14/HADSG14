<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Profesor.aspx.vb" Inherits="ProyectoG14.Profesor" %>

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
            height: 583px;
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
                </span><br class="auto-style7" />
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
                <br />
                <br />
                <span class="auto-style1">
                <asp:LinkButton ID="LinkButton4" runat="server">Cerrar sesión</asp:LinkButton>
                </span>
            </div>
        </div>
    </form>


</body>
</html>
