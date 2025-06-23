<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Turnos_Baja.aspx.cs" Inherits="Vistas.Admin_Turnos_Baja" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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

        .container-1, .container-3 {
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
        }

        .container-1 {
            background-color: #8aaeea;
            color: white;
            font-weight: bold;
        }

        .container-2 {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 85vh;
        }


        .form-box {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
        }

        .form-row {
            margin-bottom: 7px;
            display: flex;
            flex-direction: column;
        }

        .form-row label {
            margin-bottom: 6px;
            font-weight: bold;
        }

        .form-row input[type="text"] {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-top: 10px;
        }

        .btn {
            padding: 10px 18px;
            background-color: #8aaeea;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            width: 140px;
        }

        .btn:hover {
            background-color: #3f4db7;
        }

        .validation-message {
            color: #cc0000;
            font-size: 0.9em;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class ="container-1">
             <asp:Label ID="tipoUsuario" runat="server" Text="tipoUsuario"></asp:Label>
            <asp:Label ID="nombreUsuario" runat="server" Text="lblNombreUsuario"></asp:Label>
            </div>
        <div class ="form-box">
            <div class ="form-row">
           <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="15pt" Text="Dar de baja un turno"></asp:Label>

            </div>
        <div class="form-row"> 
            Escriba el ID del turno:<asp:TextBox ID="txtID" runat="server"></asp:TextBox>
            <asp:Label ID="lblmensaje" runat="server"></asp:Label>
            </div>
        <div style="text-align: center;">
               <asp:Button ID="cancelarTurnoBtn" runat="server" Text="Cancelar Turno" OnClientClick="return confirm('¿Estás seguro quieres cancelar este turno?');"  />
            </div>
        </div>
        <div class ="container-3">
        <asp:Button ID="CerrarBtn" runat="server" Text="Cerrar Sesión" />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin_Turnos.aspx">Volver</asp:HyperLink>
        </div>
    </form>
</body>
</html>
