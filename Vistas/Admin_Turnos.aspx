<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Turnos.aspx.cs" Inherits="Vistas.Admin_Turnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Administracion de Turnos</title>
    <style type="text/css">
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #F6F6F6;
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
        background-color: #8aaeea;
        color: white;
        font-weight: bold;
    }

    .container-3 {
        background-color: #e9ecef;
    }

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

    .container-3 input[type="submit"]:hover,
    .btn:hover {
        background-color: #3f4db7;
    }

    .container-2 {
        height: 85vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .button-group {
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .btn {
        width: 220px;
        padding: 12px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        background-color: #8aaeea;
        color: white;
        cursor: pointer;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-1">
    <asp:Label ID="tipoUsuario" runat="server" Text="tipoUsuario"></asp:Label>
    <asp:Label ID="nombreUsuario" runat="server" Text="Nombre del Usuario"></asp:Label>
</div>

<div class="container-2">
    <div class="button-group">
        <asp:Button ID="AltaTurnosBtn" runat="server" Text="Generar Turno" CssClass="btn" OnClick="AltaTurnosBtn_Click" />
        <asp:Button ID="BajaTurnosBtn" runat="server" Text="Cancelar Turno" CssClass="btn" OnClick="BajaTurnosBtn_Click" />
        <asp:Button ID="ListaTurnosBtn" runat="server" Text="Lista de Turnos" CssClass="btn" OnClick="ListaTurnosBtn_Click" />
    </div>
</div>

<div class="container-3">
    <asp:Button ID="CerrarBtn" runat="server" Text="Cerrar Sesión" CssClass="btn" />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminVista.aspx">Volver</asp:HyperLink>
</div>
    </form>
</body>
</html>
