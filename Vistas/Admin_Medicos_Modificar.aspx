<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Medicos_Modificar.aspx.cs" Inherits="Vistas.Admin_Modificar_Medico" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Modificar Médico</title>
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
        }


        .container-1 {
            background-color: #8aaeea;
            color: white;
            font-weight: bold;
        }

        .modif-container{
           background-color: #F6F6F6;
           width: 100vw;
           height: 85vh;
           min-height: 30vh;
           display: flex;
           justify-content: center;
           padding: 10px 20px;
           gap: 10px;
           flex-direction: column;
         }

        #Button1 {            
            padding: 12px;
            background-color: #8aaeea;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 14px;
            cursor: pointer;
            width: 100px;
        }
        #Button1:hover {
            background-color: #274ede;
        }

        #txtBuscar{
            width: 500px;
            height: 30px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-1">
            <asp:Label ID="tipoUsuario" runat="server" Text="tipoUsuario"></asp:Label>
            <asp:Label ID="nombreUsuario" runat="server" Text="lblNombreUsuario"></asp:Label>
        </div>

        <div class="modif-container">
            <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Modificar Médico"></asp:Label>
            <asp:Label ID="Label20" runat="server" Text="Ingrese el legajo del medico a modificar:"></asp:Label>
            <asp:TextBox ID="txtBuscar" runat="server" Width="203px"></asp:TextBox>
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Buscar" />
            &nbsp;<asp:RequiredFieldValidator ID="rfvBuscar" runat="server" ControlToValidate="txtBuscar" ErrorMessage="* Ingrese un legajo" CssClass="error-message" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revLegajo" runat="server" ControlToValidate="txtBuscar" ErrorMessage="* Solo se permiten valores numericos" CssClass="error-message" ValidationExpression="^\d+$" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:Label ID="lblMensajeError" runat="server" CssClass="error-message"></asp:Label>
            <asp:GridView ID="gvMedico" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" Height="248px" Width="1216px">
                <Columns>
                    <asp:TemplateField HeaderText="Numero de legajo">
                        <ItemTemplate><asp:Label ID="lblLegajo" runat="server" Text="Legajo"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Especialidad">
                        <ItemTemplate><asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DNI">
                        <ItemTemplate><asp:Label ID="Label5" runat="server" Text="DNI"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate><asp:TextBox ID="txtEditNombre" runat="server"></asp:TextBox></EditItemTemplate>
                        <ItemTemplate><asp:Label ID="Label12" runat="server" Text="Nombre"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido">
                        <EditItemTemplate><asp:TextBox ID="txtEditApellido" runat="server"></asp:TextBox></EditItemTemplate>
                        <ItemTemplate><asp:Label ID="Label13" runat="server" Text="Apellido"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sexo">
                        <ItemTemplate><asp:Label ID="Label8" runat="server" Text="Sexo"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha Nacimiento">
                        <ItemTemplate><asp:Label ID="Label9" runat="server" Text="Fecha de nacimiento"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nacionalidad">
                        <ItemTemplate><asp:Label ID="Label10" runat="server" Text="Nacionalidad"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Direccion">
                        <EditItemTemplate><asp:TextBox ID="txtEditDireccion" runat="server"></asp:TextBox></EditItemTemplate>
                        <ItemTemplate><asp:Label ID="Label14" runat="server" Text="Direccion"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Localidad">
                        <EditItemTemplate><asp:TextBox ID="txtEditLocalidad" runat="server"></asp:TextBox></EditItemTemplate>
                        <ItemTemplate><asp:Label ID="Label15" runat="server" Text="Localidad"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Provincia">
                        <EditItemTemplate><asp:TextBox ID="txtEditProvincia" runat="server"></asp:TextBox></EditItemTemplate>
                        <ItemTemplate><asp:Label ID="Label16" runat="server" Text="Provincia"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Correo Electronico">
                        <EditItemTemplate><asp:TextBox ID="txtEditCorreo" runat="server"></asp:TextBox></EditItemTemplate>
                        <ItemTemplate><asp:Label ID="Label17" runat="server" Text="Correo"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefono">
                        <EditItemTemplate><asp:TextBox ID="txtEditTelefono" runat="server"></asp:TextBox></EditItemTemplate>
                        <ItemTemplate><asp:Label ID="Label18" runat="server" Text="Telefono"></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="container-3">
               <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Volver</asp:HyperLink> 
        </div>
    </form>
</body>
</html>