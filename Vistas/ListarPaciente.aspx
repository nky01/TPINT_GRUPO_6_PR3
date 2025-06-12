<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarPaciente.aspx.cs" Inherits="Vistas.ListarPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 79px;
        }
        .auto-style3 {
            width: 151px;
        }
        .auto-style4 {
            width: 118px;
        }
        .auto-style6 {
            width: 98px;
        }
        .auto-style7 {
            width: 205px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="tipoUsuario"></asp:Label>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="lblNombreUsuario"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="15pt" Text="Pacientes"></asp:Label>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label4" runat="server" Text="Buscar por DNI"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtBusqueda" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="0">Ingrese un dni</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="rexvDni" runat="server" ControlToValidate="txtBusqueda" ForeColor="Red" ValidationExpression="^\d{7,8}$" ValidationGroup="0">Ingrese un dni valido</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style6">
                        <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" ValidationGroup="0" Width="100px" />
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="4" rowspan="3">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="DNI">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text="DNI"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text="Nombre"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellido">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text="Apellido"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sexo">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text="Sexo"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nacionalidad">
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text="Nacionalidad"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha de nacimiento">
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text="Fecha de nacimiento"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Direccion">
                                    <ItemTemplate>
                                        <asp:Label ID="Label11" runat="server" Text="Direccion"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Localidad">
                                    <ItemTemplate>
                                        <asp:Label ID="Label12" runat="server" Text="Localidad"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Provincia">
                                    <ItemTemplate>
                                        <asp:Label ID="Label13" runat="server" Text="Provincia"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Correo Electronico">
                                    <ItemTemplate>
                                        <asp:Label ID="Label14" runat="server" Text="Correo Electronico"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Telefono">
                                    <ItemTemplate>
                                        <asp:Label ID="Label15" runat="server" Text="Telefono"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" Width="100px" />
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
