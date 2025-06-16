<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Pacientes.aspx.cs" Inherits="Vistas.Pacientes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Pacientes</title>
    <style>
        * {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #F6F6F6;
            width: 100vw;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .container-1,
        .container-3 {
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
            width: 100%;
        }

        .container-1 {
            background-color: #8aaeea;
            color: white;
            font-weight: bold;
        }

        .pacientes-container {
            background-color: #F6F6F6;
            width: 100vw;
            height: 70vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .center-box {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 12px;
        }

        .btn-accion {
            background-color: #8aaeea;
            border: none;
            border-radius: 6px;
            padding: 10px 20px;
            width: 200px;
            font-size: 14px;
            cursor: pointer;
            color: white;
        }

        .btn-accion:hover {
            background-color: #3f4db7;
        }

        .volver-link {
            font-size: 14px;
            display: inline-block;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-1">
            <asp:Label ID="Label1" runat="server" Text="tipoUsuario"></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="lblNombreUsuario"></asp:Label>
        </div>

        <div class="pacientes-container">
            <div class="center-box">
                <asp:Button ID="btnAltaP" runat="server" CssClass="btn-accion" OnClick="btnAltaP_Click" Text="Alta" />
                <asp:Button ID="btnBajaP" runat="server" CssClass="btn-accion" OnClick="btnBajaP_Click" Text="Baja" />
                <asp:Button ID="btnModificarP" runat="server" CssClass="btn-accion" OnClick="btnModificarP_Click" Text="Modificar" />
                <asp:Button ID="btnListarP" runat="server" CssClass="btn-accion" OnClick="btnListarP_Click" Text="Listar" />
            </div>
        </div>

        <div class="container-3">
            <asp:HyperLink ID="lnkVolver" runat="server" NavigateUrl="~/AdminVista.aspx" CssClass="volver-link">Volver</asp:HyperLink>
        </div>
    </form>
</body>
</html>
