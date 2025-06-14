<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicoVista.aspx.cs" Inherits="Vistas.MedicoVista" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Vista Médico</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .container-1,
        .container-3 {
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
        }

        .container-1 {
            background-color: #7993bf;
            color: white;
            font-weight: bold;
        }

        .container-3 {
            background-color: #e9ecef;
        }

        .container-3 a,
        .container-3 input[type="submit"],
        .btn {
            text-decoration: none;
            font-weight: bold;
            padding: 6px 12px;
            border-radius: 5px;
            border: none;
            background-color: #8aaeea;
            color: white;
            cursor: pointer;
        }

        .container-3 a:hover,
        .container-3 input[type="submit"]:hover,
        .btn:hover {
            background-color: #3f4db7;
        }

        .container-2 {
            height: 80vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .button-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-1">
            <asp:Label ID="Label1" runat="server" Text="tipoUsuario"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="lblNombreUsuario"></asp:Label>
        </div>

        <div class="container-2">
            <div class="button-group">
                <asp:Button ID="btnTurno" runat="server" Text="Turnos" CssClass="btn" OnClick="btnTurno_Click" />
                <asp:Button ID="btnCargarObservaciones" runat="server" Text="Cargar Observaciones" CssClass="btn" OnClick="btnCargarObservaciones_Click" />
            </div>
        </div>

        <div class="container-3">
            <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" CssClass="btn" />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Volver</asp:HyperLink>
        </div>
    </form>
</body>
</html>
