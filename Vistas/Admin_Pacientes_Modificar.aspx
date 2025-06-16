<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Pacientes_Modificar.aspx.cs" Inherits="Vistas.ModificarPaciente" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Modificar Paciente</title>
    <style>
        * {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            width: 100%;
            background-color: #f4f4f4;
        }

        .container-1, .container-3 {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        .container-1 {
            background-color: #8aaeea;
            color: white;
            font-weight: bold;
        }

        .modif-container {
            padding: 30px 20px;
            width: 100%;
        }

        .modif-container h2 {
            font-size: 20px;
            margin-bottom: 20px;
            text-align: center;
        }

        .search-section {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
            margin-bottom: 10px;
        }

        .search-section input[type="text"] {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 250px;
        }

        .btn {
            padding: 10px 18px;
            background-color: #8aaeea;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn:hover {
            background-color: #3f4db7;
        }

        .validation-message {
            color: red;
            font-size: 0.9em;
            margin-top: 5px;
        }

        .grid-container {
            margin-top: 30px;
            width: 100%;
        }

        .grid-container table {
            width: 100%;
            border-collapse: collapse;
        }

        .grid-container th,
        .grid-container td {
            padding: 8px;
            border: 1px solid #ccc;
            text-align: left;
        }

        .grid-container th {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-1">
            <asp:Label ID="Label1" runat="server" Text="tipoUsuario"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="lblNombreUsuario"></asp:Label>
        </div>

        <div class="modif-container">
            <h2>Modificar Paciente</h2>

            <div class="search-section">
                <asp:Label ID="Label4" runat="server" Text="Buscar por DNI:"></asp:Label>
                <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
                &nbsp;<asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn" />
            </div>

            <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtBusqueda" CssClass="validation-message" ValidationGroup="0" ForeColor="Red">Ingrese un DNI!</asp:RequiredFieldValidator><br />
            <asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="txtBusqueda" CssClass="validation-message" ValidationExpression="^\d{7,8}$" ValidationGroup="0" ForeColor="Red">Ingrese un DNI válido!</asp:RegularExpressionValidator>

            <div class="grid-container">
                <asp:GridView ID="gvPaciente" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True">
                    <Columns>
                        <asp:TemplateField HeaderText="DNI">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text="DNI"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditNombre" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text="Nombre"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apellido">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditApellido" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text="Apellido"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sexo">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text="Sexo"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha Nacimiento">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text="Fecha de nacimiento"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nacionalidad">
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text="Nacionalidad"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Dirección">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditDireccion" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label14" runat="server" Text="Direccion"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Localidad">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditLocalidad" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text="Localidad"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Provincia">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditProvincia" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label16" runat="server" Text="Provincia"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Correo Electrónico">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditCorreo" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label17" runat="server" Text="Correo"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Teléfono">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditTelefono" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label18" runat="server" Text="Telefono"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <div class="container-3">
            <asp:Button ID="CerrarSesionbtn" runat="server" CssClass="btn" Text="Cerrar Sesión" />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin_Pacientes.aspx" CssClass="btn">Volver</asp:HyperLink>
        </div>
    </form>
</body>
</html>
