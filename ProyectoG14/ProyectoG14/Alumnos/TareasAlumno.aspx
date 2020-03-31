<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasAlumno.aspx.vb" Inherits="ProyectoG14.TareasAlumno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style5 {
            font-size: xx-large;
            text-align: left;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 650px;
            height: 583px;
            margin-left: 342px;
            margin-top: 71px;
        }
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style7 {
            font-size: small;
            text-align: left;
        }
    </style>
</head>
<body style="text-align: left; margin-top: 0px; background: url('fondo2.png') no-repeat">
    <form id="form1" runat="server">
        <div class="auto-style3">
            <div class="auto-style4" style="padding: 0px 0px 0px 0px; margin-left: auto; margin-right: auto; background-color: #FFFFFF; border-radius: 10px;">
                <span class="auto-style5">
                <br />
                Tareas Alumno<div style="position: absolute; top: 81px; left: 746px; width: 80px; height: 18px;">
                <span class="auto-style5">
            <asp:LinkButton ID="LinkButton1" runat="server" style="font-size: small">Cerrar sesión</asp:LinkButton>
                </span>
                </div>
                <br />
                <br />
                </span><span class="auto-style7">Seleccionar Asignatura(solo se muestran aquellas en las que está matriculado):<br />
                <br />
                </span>
                <asp:DropDownList ID="DropDownList1" runat="server" Height="23px" Width="136px">
                </asp:DropDownList>
                <span class="auto-style5">
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div style="position: absolute; top: 280px; left: 379px;">
                <span class="auto-style5">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="39px" style="font-size: small; text-align: center" Width="52px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                </span>
                </div>
                </span><br class="auto-style1" />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
    </form>
</body>
</html>
