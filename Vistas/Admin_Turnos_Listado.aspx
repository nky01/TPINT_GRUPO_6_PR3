<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Pacientes_Listar.aspx.cs" Inherits="Vistas.ListarPaciente" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Listado de Pacientes</title>
    <style type="text/css">
        body {
            background-color: #F6F6F6;
            font-family: Arial, sans-serif;
        }

        .header {
            background-color: #8aaeea;
            color: white;
            font-weight: bold;
            padding: 10px 20px;
        }

        .content {
            padding: 20px;
        }

        .form-controls {
            margin-bottom: 20px;
        }

        .form-controls label,
        .form-controls input,
        .form-controls button {
            margin-right: 10px;
        }

        .footer {
            margin-top: 20px;
        }

        .error {
            color: red;
            font-size: small;
        }

        .gridview {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <asp:Label ID="Label2" runat="server" Text="tipoUsuario"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="lblNombreUsuario"></asp:Label>
        </div>

        <div class="content">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="15pt" Text="Pacientes"></asp:Label>
            <div class="form-controls">
                <asp:Label ID="Label4" runat="server" Text="Buscar por DNI"></asp:Label>
                <asp:TextBox ID="txtBusqueda" runat="server" />
                <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtBusqueda"
                    ErrorMessage="Ingrese un DNI" ForeColor="Red" ValidationGroup="0" CssClass="error" />
                <asp:RegularExpressionValidator ID="rexvDni" runat="server" ControlToValidate="txtBusqueda"
                    ValidationExpression="^\d{7,8}$" ErrorMessage="Ingrese un DNI válido" ForeColor="Red"
                    ValidationGroup="0" CssClass="error" />
                <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" ValidationGroup="0" />
            </div>

           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                <Columns>
                    <asp:TemplateField HeaderText="DNI">
                        <ItemTemplate><asp:Label ID="Label5" runat="server" Text="DNI"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <ItemTemplate><asp:Label ID="Label6" runat="server" Text="Nombre"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido">
                        <ItemTemplate><asp:Label ID="Label7" runat="server" Text="Apellido"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sexo">
                        <ItemTemplate><asp:Label ID="Label8" runat="server" Text="Sexo"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nacionalidad">
                        <ItemTemplate><asp:Label ID="Label9" runat="server" Text="Nacionalidad"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha de nacimiento">
                        <ItemTemplate><asp:Label ID="Label10" runat="server" Text="Fecha de nacimiento"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Direccion">
                        <ItemTemplate><asp:Label ID="Label11" runat="server" Text="Direccion"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Localidad">
                        <ItemTemplate><asp:Label ID="Label12" runat="server" Text="Localidad"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Provincia">
                        <ItemTemplate><asp:Label ID="Label13" runat="server" Text="Provincia"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Correo Electronico">
                        <ItemTemplate><asp:Label ID="Label14" runat="server" Text="Correo Electronico"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefono">
                        <ItemTemplate><asp:Label ID="Label15" runat="server" Text="Telefono"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

            <div class="footer">
                <asp:Button ID="CerrarBtn" runat="server" Text="Cerrar Sesión" />
                &nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin_Turnos.aspx">Volver</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
