<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Pacientes_Baja.aspx.cs" Inherits="Vistas.BajaPaciente" %>

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
            height: 23px;
        }
        .auto-style3 {
            width: 129px;
        }
        .auto-style4 {
            height: 23px;
            width: 129px;
        }
        .auto-style5 {
            width: 363px;
        }
        .auto-style6 {
            height: 23px;
            width: 363px;
        }
        .auto-style7 {
            width: 63px;
        }
        .auto-style8 {
            height: 23px;
            width: 63px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Text="tipoUsuario"></asp:Label>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="lblNombreUsuario"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style6"></td>
                    <td class="auto-style8"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="15pt" Text="Dar de baja a un Paciente"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style6">DNI&nbsp;
                        <asp:TextBox ID="txtDni" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtDni" ForeColor="#CC0000" ValidationGroup="0">ingrese un dni</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="txtDni" ErrorMessage="Ingrese un dni valido" ForeColor="#CC0000" ValidationExpression="^\d{7,8}$" ValidationGroup="0"></asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:Button ID="btnBaja" runat="server" OnClick="btnBaja_Click" Text="Dar de baja" ValidationGroup="0" Width="100px" />
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" Width="100px" />
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
