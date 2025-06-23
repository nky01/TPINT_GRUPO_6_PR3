<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_MedicosBaja.aspx.cs" Inherits="Vistas.BajaMedicos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Baja de Médicos</title>
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
        <div class="container-1">

            <asp:Label ID="tipoUsuario" runat="server" Text="tipoUsuario"></asp:Label>
            <asp:Label ID="nombreUsuario" runat="server" Text="nombreUsuario"></asp:Label>

        </div>

        <div class="container-2">
            <div class="form-box">
                <div class="form-row">
                    <asp:Label ID="labelMedico" runat="server" Font-Bold="True" Font-Size="15pt" Text="Dar de baja a un médico"></asp:Label>
                    <br />
                </div>

                <div class="form-row">
                    <asp:Label ID="labelLegajo" runat="server" Text="Legajo a dar de baja:"></asp:Label>
                    <asp:TextBox ID="textboxLegajo" runat="server" />
                    &nbsp;<asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="textboxLegajo" ForeColor="Red" CssClass="validation-message" ValidationGroup="0" ErrorMessage="Ingrese un legajo!" />
                    <br />
                    <br />
                    <asp:Label ID="lblExito" runat="server"></asp:Label>
                </div>
                <div style="text-align: center;">
                    <asp:Button ID="buttonBajaMedico" runat="server" CssClass="btn" Text="Dar de baja" OnClick="btnBaja_Click" ValidationGroup="0" OnClientClick="return confirm('¿Estás seguro de que lo quieres dar de baja?');" />
                </div>
            </div>
        </div>

        <div class="container-3">
            <asp:HyperLink ID="HyperLinkVolver" runat="server" NavigateUrl="~/AdminVista.aspx" CssClass="link-volver">Volver</asp:HyperLink>
            <span></span>
        </div>
    </form>
</body>
</html>
