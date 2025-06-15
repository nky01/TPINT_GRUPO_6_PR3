<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_MedicosBaja.aspx.cs" Inherits="Vistas.BajaMedicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 300px;
        }
        .auto-style3 {
            width: 193px;
        }
        .auto-style4 {
            width: 137px;
        }
        .auto-style5 {
            width: 193px;
            height: 26px;
        }
        .auto-style6 {
            width: 300px;
            height: 26px;
        }
        .auto-style7 {
            width: 137px;
            height: 26px;
        }
        .auto-style8 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Label ID="labelMedico" runat="server" Font-Bold="True" Font-Size="15pt" Text="Dar de baja a un médico"></asp:Label>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="labelLegajo" runat="server" Text="Legajo a dar de baja:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="textboxLegajo" runat="server"></asp:TextBox>
                        </td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="textboxLegajo" ForeColor="#CC0000" ValidationGroup="0">Ingrese un legajo</asp:RequiredFieldValidator>
                        </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Button ID="buttonBajaMedico" runat="server" OnClientClick="return confirm('¿Estás seguro de que lo quieres dar de baja?');" OnClick="btnBaja_Click" Text="Dar de baja" ValidationGroup="0" Width="100px" />
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Button ID="buttonVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" Width="100px" />
                    </td>
                    <td class="auto-style6"></td>
                    <td class="auto-style7"></td>
                    <td class="auto-style8"></td>
                    <td class="auto-style8"></td>
                    <td class="auto-style8"></td>
                    <td class="auto-style8"></td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
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
