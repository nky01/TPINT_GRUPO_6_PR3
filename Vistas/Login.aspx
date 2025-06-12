<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vistas.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            height: 100px;
        }
        .auto-style4 {
            height: 30px;
        }
        .auto-style5 {
            width: 83px;
        }
        .auto-style6 {
            height: 30px;
            width: 83px;
        }
        .auto-style7 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3" colspan="3">
                        <asp:Label ID="lblBienvenido" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="16pt" Text="Bienvenido a NombrePag"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td rowspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lblUser" runat="server" Text="Usuario:"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtboxUser" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtboxUser" ErrorMessage="Ingrese su usuario!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblPassword" runat="server" Text="Contraseña:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtboxPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtboxPassword" ErrorMessage="Ingrese su contraseña!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5" rowspan="2">&nbsp;</td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RegistrarCuenta.aspx">¿No tienes cuenta? Regristrate</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="lblErrorLogin" runat="server" ForeColor="Red" Text="Usuario o contraseña incorrectos!" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
