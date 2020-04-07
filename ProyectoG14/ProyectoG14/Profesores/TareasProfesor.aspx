<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasProfesor.aspx.vb" Inherits="ProyectoG14.TareasProfesor" %>

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
            width: 855px;
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
        }
    </style>
</head>
<body style="text-align: left; margin-top: 0px; background: url('fondo2.png') no-repeat">
    <form id="form2" runat="server">
        <div class="auto-style3">
            <div class="auto-style4" style="padding: 0px 0px 0px 0px; margin-left: auto; margin-right: auto; background-color: #FFFFFF; border-radius: 10px;">
                <span class="auto-style5">
                <br />
                <div style="font-size: medium">
                    <span class="auto-style8">Tareas</span><asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            Actualizando...
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <span class="auto-style5">
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="codigoasig" DataValueField="codigoasig" Height="81px" Width="132px">
                            </asp:DropDownList>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AmigosConnectionString %>" SelectCommand="SELECT DISTINCT GruposClase.codigoasig FROM ProfesoresGrupo INNER JOIN GruposClase ON ProfesoresGrupo.codigogrupo = GruposClase.codigo WHERE (ProfesoresGrupo.email = @email)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="email" SessionField="email" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                <br />
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AmigosConnectionString %>" DeleteCommand="DELETE FROM [TareasGenericas] WHERE [Codigo] = @original_Codigo AND (([HEstimadas] = @original_HEstimadas) OR ([HEstimadas] IS NULL AND @original_HEstimadas IS NULL)) AND (([Explotacion] = @original_Explotacion) OR ([Explotacion] IS NULL AND @original_Explotacion IS NULL)) AND (([Descripcion] = @original_Descripcion) OR ([Descripcion] IS NULL AND @original_Descripcion IS NULL))" InsertCommand="INSERT INTO [TareasGenericas] ([HEstimadas], [Explotacion], [Descripcion], [Codigo]) VALUES (@HEstimadas, @Explotacion, @Descripcion, @Codigo)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [HEstimadas], [Explotacion], [Descripcion], [Codigo] FROM [TareasGenericas] WHERE ([CodAsig] = @CodAsig)" UpdateCommand="UPDATE [TareasGenericas] SET [HEstimadas] = @HEstimadas, [Explotacion] = @Explotacion, [Descripcion] = @Descripcion WHERE [Codigo] = @original_Codigo AND (([HEstimadas] = @original_HEstimadas) OR ([HEstimadas] IS NULL AND @original_HEstimadas IS NULL)) AND (([Explotacion] = @original_Explotacion) OR ([Explotacion] IS NULL AND @original_Explotacion IS NULL)) AND (([Descripcion] = @original_Descripcion) OR ([Descripcion] IS NULL AND @original_Descripcion IS NULL))">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_Codigo" Type="String" />
                                    <asp:Parameter Name="original_HEstimadas" Type="Int32" />
                                    <asp:Parameter Name="original_Explotacion" Type="Boolean" />
                                    <asp:Parameter Name="original_Descripcion" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="HEstimadas" Type="Int32" />
                                    <asp:Parameter Name="Explotacion" Type="Boolean" />
                                    <asp:Parameter Name="Descripcion" Type="String" />
                                    <asp:Parameter Name="Codigo" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList1" Name="CodAsig" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="HEstimadas" Type="Int32" />
                                    <asp:Parameter Name="Explotacion" Type="Boolean" />
                                    <asp:Parameter Name="Descripcion" Type="String" />
                                    <asp:Parameter Name="original_Codigo" Type="String" />
                                    <asp:Parameter Name="original_HEstimadas" Type="Int32" />
                                    <asp:Parameter Name="original_Explotacion" Type="Boolean" />
                                    <asp:Parameter Name="original_Descripcion" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Codigo" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" style="font-size: x-large">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField ShowEditButton="True" />
                                    <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                                    <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                    <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
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
                <br />
                            <span class="auto-style7">&nbsp;&nbsp;&nbsp;</span><asp:Button ID="Button1" runat="server" Text="Insertar tarea" />
            <br />
                            </span>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                </span>
            </div>
        </div>
    </form>

    
</body>
</html>
