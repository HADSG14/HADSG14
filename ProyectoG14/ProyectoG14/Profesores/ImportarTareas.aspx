<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarTareas.aspx.vb" Inherits="ProyectoG14.ImportarTareas" %>

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
            width: 733px;
            height: 491px;
            margin-left: 342px;
            margin-top: 71px;
            text-align: left;
        }
        
        .auto-style5 {
            font-size: xx-large;
            text-align: center;
        }
        
        .auto-style7 {
            font-size: xx-large;
        }
        .auto-style8 {
            text-align: left;
        }
        .auto-style9 {
            font-size: medium;
        }
    </style>
</head>
<body style="text-align: left; margin-top: 0px; background: url('fondo2.png') no-repeat">
    <form id="form2" runat="server">
        <div class="auto-style3">
            <div class="auto-style4" style="padding: 0px 0px 0px 0px; margin-left: auto; margin-right: auto; background-color: #FFFFFF; border-radius: 10px;">
                <span class="auto-style5">
                <asp:LinkButton ID="LinkButton1" runat="server" style="font-size: small">←Volver</asp:LinkButton>
                <br />
                <div>
                    Importar Tareas</div>
                <div class="auto-style8">
                </span>
                <br class="auto-style7" />
                    <span class="auto-style9">&nbsp;&nbsp;&nbsp; Seleccionar asignatura a importar:</span><br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="codigoasig" DataValueField="codigoasig">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmigosConnectionString %>" SelectCommand="SELECT DISTINCT GruposClase.codigoasig FROM ProfesoresGrupo INNER JOIN GruposClase ON ProfesoresGrupo.codigogrupo = GruposClase.codigo WHERE (ProfesoresGrupo.email = @email)">
                        <SelectParameters>
                            <asp:SessionParameter Name="email" SessionField="email" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="IMPORTAR (XMLD)" Width="135px" />
                    <div style="position: absolute; top: 200px; left: 622px; width: 184px; font-size: small;">
                        <asp:Xml ID="Xml1" runat="server"></asp:Xml>
                    </div>
                </div>
            </div>
        </div>
    </form>


</body>
</html>
