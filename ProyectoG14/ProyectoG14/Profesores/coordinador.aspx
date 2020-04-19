<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="coordinador.aspx.vb" Inherits="ProyectoG14.coordinador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style3 {
            font-size: medium;
        }
        .auto-style4 {
            font-size: x-large;
        }
    </style>
</head>
<body style="margin-top: 0px; background: url('fondo2.png') no-repeat;">
    <form id="form2" runat="server">
        <div aria-hidden="False">
            <span class="auto-style3">
            <br />
            <div style="padding: 10px 0px 0px 0px; margin-left: auto; margin-right: auto; background-color: #FFFFFF; border-radius: 10px; text-align: center; width: 393px; height: 234px;">
                <br />
                </span>
            <span class="auto-style4">
                Coordinador<asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <span class="auto-style4">
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="codigo" DataValueField="codigo">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmigosConnectionString %>" SelectCommand="SELECT [codigo] FROM [Asignaturas]"></asp:SqlDataSource>
                        <br />
                        <div>
                            <span class="auto-style4">
                            <asp:Label ID="HorasLabel" runat="server"></asp:Label>
                            </span>
                        </div>
                        </span>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
            </div>
            </span>
            <span class="auto-style3">
            <br />
            &nbsp;&nbsp;</span><br />
            <br />
        </div>
    </form>
</body>
</html>
