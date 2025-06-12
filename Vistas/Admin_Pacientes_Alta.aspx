<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Pacientes_Alta.aspx.cs" Inherits="Vistas.AltaPaciente" %>

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
            width: 135px;
        }
        .auto-style4 {
            width: 737px;
        }
        .auto-style7 {
            width: 85px;
        }
        .auto-style8 {
            width: 575px;
        }
        .auto-style9 {
            width: 194px;
        }
        .auto-style10 {
            width: 135px;
            height: 23px;
        }
        .auto-style11 {
            width: 194px;
            height: 23px;
        }
        .auto-style13 {
            width: 85px;
            height: 23px;
        }
        .auto-style14 {
            width: 575px;
            height: 23px;
        }
        .auto-style15 {
            width: 737px;
            height: 23px;
        }
        .auto-style16 {
            height: 23px;
        }
        .auto-style17 {
            width: 135px;
            height: 26px;
        }
        .auto-style18 {
            width: 194px;
            height: 26px;
        }
        .auto-style20 {
            width: 85px;
            height: 26px;
        }
        .auto-style21 {
            width: 575px;
            height: 26px;
        }
        .auto-style22 {
            width: 737px;
            height: 26px;
        }
        .auto-style23 {
            height: 26px;
        }
        .auto-style24 {
            width: 117px;
        }
        .auto-style25 {
            width: 117px;
            height: 23px;
        }
        .auto-style26 {
            width: 117px;
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="tipoUsuario"></asp:Label>
                    </td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="lblNombreUsuario"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"></td>
                    <td class="auto-style11"></td>
                    <td class="auto-style25"></td>
                    <td class="auto-style13"></td>
                    <td class="auto-style14"></td>
                    <td class="auto-style15"></td>
                    <td class="auto-style16"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="5">
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="15pt" Text="Datos del paciente"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="Label6" runat="server" Text="DNI"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="txtDni" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtDni" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style8">
                        <asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="txtDni" ForeColor="#CC0000" ValidationExpression="^\d{7,8}$" ValidationGroup="0">Ingrese un dni valido</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="Label7" runat="server" Text="Nombre"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="txtNombre" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="Label8" runat="server" Text="Apellido"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="txtApellido" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style24">
                        &nbsp;</td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="Label9" runat="server" Text="Sexo"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:RadioButtonList ID="rblSexo" runat="server" Width="100px">
                            <asp:ListItem Value="2">Masculino</asp:ListItem>
                            <asp:ListItem Value="1">Femenino</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="rblSexo" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style24">
                        &nbsp;</td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="Label10" runat="server" Text="Nacionalidad"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="txtNacionalidad" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="Label11" runat="server" Text="Fecha de nacimiento"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="txtFechaNacimiento" TextMode="Date" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td colspan="2">
                        <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ControlToValidate="txtFechaNacimiento" ForeColor="#CC0000" ValidationGroup="0">Poner una fecha valida</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="Label12" runat="server" Text="Direccion"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="txtDireccion" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="Label13" runat="server" Text="Localidad"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="txtLocalidad" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="txtLocalidad" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="Label14" runat="server" Text="Provincia"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="txtProvincia" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="txtProvincia" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17"></td>
                    <td class="auto-style18">
                        <asp:Label ID="Label15" runat="server" Text="Correo electronico"></asp:Label>
                    </td>
                    <td class="auto-style26">
                        <asp:TextBox ID="txtCorreo" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style20">
                        <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style21">
                        <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtCorreo" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ValidationGroup="0">Ingrese un correo valido</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style22"></td>
                    <td class="auto-style23"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="Label16" runat="server" Text="Telefono"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="txtTelefono" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style8">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTelefono" ForeColor="Red" ValidationGroup="0" ValidationExpression="^(\d{10})$">Ingrese un numero sin el  0 / 15</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"></td>
                    <td class="auto-style11">
                    </td>
                    <td class="auto-style25">
                    </td>
                    <td class="auto-style13">
                    </td>
                    <td class="auto-style14"></td>
                    <td class="auto-style15"></td>
                    <td class="auto-style16"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style24">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" ValidationGroup="0" Width="100px" />
                        <asp:Label ID="lblExito" runat="server" ForeColor="#33CC33" Text="Agregado correctamente" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" Width="100px" />
                    </td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style24">
                        &nbsp;</td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
