<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicoCargar.aspx.cs" Inherits="Vistas.MedicoCargarObservacion" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Cargar Observación</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f4f4;
        }

        .header {
            background-color: #8aaeea;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
        }

        .container {
            padding: 30px;
            background-color: white;
            margin: 30px auto;
            width: 90%;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .input-group {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .input-group label {
            font-weight: bold;
            margin-right: 10px;
        }

        .input-group input[type="text"] {
            padding: 6px;
            width: 200px;
        }

        .input-group button,
        .btn-volver button {
            padding: 6px 16px;
            background-color: #8aaeea;
            color: white;
            border: none;
            cursor: pointer;
        }

        .grid-container {
            margin-top: 30px;
        }

        #btnBuscar {
            padding: 10px 16px;
            background-color: #8aaeea;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 14px;
            cursor: pointer;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Encabezado -->
        <div class="header">
            <asp:Label ID="tipoUsuario" runat="server" Text="tipoUsuario"></asp:Label>
            <asp:Label ID="nombreUsuario" runat="server" Text="lblNombreUsuario"></asp:Label>
        </div>

        <div class="container">
            <div class="input-group">
                <label><asp:Label ID="Label3" runat="server" Text="Ingrese un código de turno:"></asp:Label></label>
                <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
                &nbsp;<asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
                <asp:RequiredFieldValidator ID="rfvTurnos" runat="server" ControlToValidate="txtBusqueda" ErrorMessage="Por favor, escriba un código" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <div class="grid-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" CssClass="table" Height="191px" Width="759px">
                    <Columns>
                        <asp:TemplateField HeaderText="Código Turno">
                            <EditItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text="Código Turno"></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text="Código Turno"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditEstado" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text="Estado"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Observación">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditObservacion" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text="Observación"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
            </div>

            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Volver</asp:HyperLink> 
        </div>
    </form>
</body>
</html>
