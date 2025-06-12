<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrarCuenta.aspx.cs" Inherits="Vistas.RegistrarCuenta" %>

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
            height: 70px;
        }
        .auto-style3 {
            height: 23px;
        }
        .auto-style5 {
            width: 126px;
        }
        .auto-style6 {
            height: 23px;
            width: 126px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" colspan="3">
                        <asp:Label ID="lblRegister" runat="server" Font-Bold="True" Font-Size="16pt" Text="Crear usuario"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td rowspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario"></asp:Label>
                        :</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtboxUsuario" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtboxUsuario" ErrorMessage="Ingrese un nombre de usuario!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="Label2" runat="server" Text="Contraseña:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtboxContraseña" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContraseña" runat="server" ControlToValidate="txtboxContraseña" ErrorMessage="Ingrese una contraseña!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="Label3" runat="server" Text="Repetir Contraseña:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtboxRepContraseña" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRepContraseña" runat="server" ControlToValidate="txtboxRepContraseña" ErrorMessage="Repita la contraseña!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5" rowspan="2">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnRegistrarse" runat="server" Text="Registrarse" />
&nbsp;<asp:Label ID="lblResultado" runat="server" Text="Resultado" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">¿Ya tienes una cuenta? Ingresar</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
