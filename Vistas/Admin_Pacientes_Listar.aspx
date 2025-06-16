<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Pacientes_Listar.aspx.cs" Inherits="Vistas.ListarPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
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

        .lista-container{

           background-color: #F6F6F6;
           width: 100vw;
           height: 20vh;
           min-height: 30vh;
           display: flex;
           justify-content: center;
           padding: 10px 20px;
           gap: 10px;

         }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class ="container-1">
            <asp:Label ID="Label2" runat="server" Text="tipoUsuario"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="lblNombreUsuario"></asp:Label>
            </div>
        <div class ="lista-container">
             <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="15pt" Text="Pacientes"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text="Buscar por DNI"></asp:Label>
                        <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtBusqueda" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="0">Ingrese un dni</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rexvDni" runat="server" ControlToValidate="txtBusqueda" ForeColor="Red" ValidationExpression="^\d{7,8}$" ValidationGroup="0">Ingrese un dni valido</asp:RegularExpressionValidator>
                        <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" ValidationGroup="0" Width="100px" />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="DNI">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text="DNI"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text="Nombre"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellido">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text="Apellido"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sexo">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text="Sexo"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nacionalidad">
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text="Nacionalidad"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha de nacimiento">
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text="Fecha de nacimiento"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Direccion">
                                    <ItemTemplate>
                                        <asp:Label ID="Label11" runat="server" Text="Direccion"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Localidad">
                                    <ItemTemplate>
                                        <asp:Label ID="Label12" runat="server" Text="Localidad"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Provincia">
                                    <ItemTemplate>
                                        <asp:Label ID="Label13" runat="server" Text="Provincia"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Correo Electronico">
                                    <ItemTemplate>
                                        <asp:Label ID="Label14" runat="server" Text="Correo Electronico"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Telefono">
                                    <ItemTemplate>
                                        <asp:Label ID="Label15" runat="server" Text="Telefono"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
            </div>
     <div class ="container-3">
               <asp:Button ID="CerrarBtn" runat="server" Text="Cerrar Sesión" />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin_Turnos.aspx">Volver</asp:HyperLink>
     </div>
  
    </form>
</body>
</html>
