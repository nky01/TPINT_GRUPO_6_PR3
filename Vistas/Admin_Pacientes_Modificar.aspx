<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Pacientes_Modificar.aspx.cs" Inherits="Vistas.ModificarPaciente" %>

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
            width: 100px;
        }
        .auto-style3 {
            width: 748px;
        }
        .auto-style4 {
            width: 98px;
        }
        .auto-style7 {
            width: 135px;
        }
        .auto-style10 {
            margin-left: 39px;
        }
        .auto-style11 {
            width: 409px;
        }
        .auto-style12 {
            width: 190px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="tipoUsuario"></asp:Label>
                    </td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="lblNombreUsuario"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td colspan="4">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="15pt" Text="Modificar Paciente"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style12">
                        <asp:Label ID="Label4" runat="server" Text="Buscar por dni"></asp:Label>
                    </td>
                    <td class="auto-style11">
                        <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtBusqueda" ForeColor="Red" ValidationGroup="0">Ingrese un dni</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="txtBusqueda" ForeColor="Red" ValidationExpression="^\d{7,8}$" ValidationGroup="0">Ingrese un dni valido</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btnBuscar" runat="server" CssClass="auto-style10" Text="Buscar" ValidationGroup="0" />
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="3" rowspan="7">
                        <asp:GridView ID="gvPaciente" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True">
                            <Columns>
                                <asp:TemplateField HeaderText="DNI">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text="DNI"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditNombre" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label12" runat="server" Text="Nombre"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellido">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditApellido" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label13" runat="server" Text="Apellido"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sexo">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text="Sexo"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha Nacimiento">
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text="Fecha de nacimiento"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nacionalidad">
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text="Nacionalidad"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Direccion">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditDireccion" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label14" runat="server" Text="Direccion"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Localidad">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditLocalidad" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label15" runat="server" Text="Localidad"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Provincia">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditProvincia" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label16" runat="server" Text="Provincia"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Correo Electronico">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditCorreo" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label17" runat="server" Text="Correo"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Telefono">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditTelefono" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label18" runat="server" Text="Telefono"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" Width="100px" />
                    </td>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
