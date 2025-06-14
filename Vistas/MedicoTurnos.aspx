<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicoTurnos.aspx.cs" Inherits="Vistas.MedicoTurnos" %>

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
            width: 173px;
        }
        .auto-style3 {
            width: 224px;
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
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="lblNombreUsuario"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Text="Buscar turno por:"></asp:Label>
&nbsp;</td>
                    <td>
                        <asp:DropDownList ID="ddlFiltros" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem Value="0">Seleccione un filtro</asp:ListItem>
                            <asp:ListItem Value="1">Dni Paciente</asp:ListItem>
                            <asp:ListItem Value="2">Codigo Turno</asp:ListItem>
                            <asp:ListItem Value="3">Estado del Turno</asp:ListItem>
                            <asp:ListItem Value="4">Observacion Cargada</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="2">
                        <asp:Panel ID="panelDni" runat="server" Visible="false">
                            <asp:Label ID="Label4" runat="server" Text="Ingrese dni del paciente"></asp:Label>
                            &nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtDni" runat="server"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnBuscarPanel1" runat="server" Text="Buscar" />
                        </asp:Panel>
                        <asp:Panel ID="panelCodigoTurno" runat="server" Visible="false">
                            <asp:Label ID="Label5" runat="server" Text="Ingrese el Codigo de Turno"></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtCodigoTurno" runat="server"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnBuscarPanel2" runat="server" Text="Buscar" />

                        </asp:Panel>
                        <asp:Panel ID ="panelEstado" runat="server" Visible="false">
                            <asp:Label ID="Label6" runat="server" Text="Elija una opcion"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="ddlEstados" runat="server">
                                <asp:ListItem Value="0">Seleccione un estado</asp:ListItem>
                                <asp:ListItem Value="1">Ausente</asp:ListItem>
                                <asp:ListItem Value="2">Presente</asp:ListItem>
                                <asp:ListItem Value="3">Pendiente</asp:ListItem>
                            </asp:DropDownList>

                        </asp:Panel>
                        
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="3" rowspan="7">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Turno"></asp:TemplateField>
                                <asp:TemplateField HeaderText="DNI Paciente"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Hora"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Dia"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Observacion"></asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" Width="100px" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
