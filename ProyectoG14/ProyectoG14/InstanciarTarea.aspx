<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InstanciarTarea.aspx.vb" Inherits="ProyectoG14.InstanciarTarea" %>

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
            width: 855px;
            height: 583px;
            margin-left: 342px;
            margin-top: 71px;
            text-align: left;
        }
        .auto-style5 {
            font-size: xx-large;
            text-align: center;
        }
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style6 {
            font-size: x-large;
            text-align: left;
        }
        .auto-style7 {
            font-size: medium;
            text-align: left;
        }
    </style>
</head>
<body style="text-align: left; margin-top: 0px; background: url('fondo2.png') no-repeat">
    <form id="form2" runat="server">
        <div class="auto-style3">
            <div class="auto-style4" style="padding: 0px 0px 0px 0px; margin-left: auto; margin-right: auto; background-color: #FFFFFF; border-radius: 10px;">
                <span class="auto-style5">
                <div style="position: absolute; top: 78px; left: 839px; width: 80px; height: 18px;">
            <asp:LinkButton ID="LinkButton1" runat="server" style="font-size: small">Cerrar sesión</asp:LinkButton>
                </div>
                <br />
                <div>
                <span class="auto-style5">
                    Instanciar Tareas</span></div>
                <br />
                </span>
                <span class="auto-style7">&nbsp;&nbsp;&nbsp;
                Usuario:<br />
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="Usuario" runat="server"></asp:TextBox>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;
                Tarea: <br />
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="Tarea" runat="server" Width="129px"></asp:TextBox>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;
                Horas estimadas:
                <div style="position: absolute; width: 435px; margin-left: 400px; top: 194px; left: 38px; height: 279px;">
                    <asp:GridView ID="Grid" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="200px" Width="244px">
                        <AlternatingRowStyle BackColor="White" />
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
                </div>
                <br />
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="HEstimadas" runat="server"></asp:TextBox>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;
                Horas dedicadas:<br />
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="HDedicadas" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="HDedicadas" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;
                </span>
                <asp:Button ID="Button1" runat="server" Text="Instanciar" />
                <span class="auto-style5">
                <br />
                </span><span class="auto-style1">
                <br />
                <span class="auto-style6">&nbsp;</span></span><br class="auto-style1" />
            </div>
        </div>
    </form>

</body>
</html>
