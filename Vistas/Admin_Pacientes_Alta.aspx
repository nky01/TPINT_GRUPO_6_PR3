<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Pacientes_Alta.aspx.cs" Inherits="Vistas.AltaPaciente" %>

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

        .alta-container{

           background-color: #F6F6F6;
           width: 100vw;
           min-height: 30vh;
           display: flex;
           justify-content: center;
           padding: 10px 20px;
           gap: 10px;

         }

        .columna {
         width: 45%;
        display: flex;
         flex-direction: column;
        }

.columna > * {
    margin-bottom: 10px;
}
         .alta-btn {
            width: 30%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            margin-top: 15px;
            cursor: pointer;
        }

        .container-3-btn {
            padding: 10px 16px;
            background-color: #007bff;
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
        <div class="container-1">
                        <asp:Label ID="Label3" runat="server" Text="tipoUsuario"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text="lblNombreUsuario"></asp:Label>
                 </div>
        <div class ="alta-container">
            <div class ="columna">
                  <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="15pt" Text="Datos del paciente"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="DNI"></asp:Label>
                <asp:TextBox ID="txtDni" runat="server" Width="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtDni" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="txtDni" ForeColor="#CC0000" ValidationExpression="^\d{7,8}$" ValidationGroup="0">Ingrese un dni valido</asp:RegularExpressionValidator>
                  <asp:Label ID="Label7" runat="server" Text="Nombre"></asp:Label>
                  <asp:TextBox ID="txtNombre" runat="server" Width="100px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                 <asp:Label ID="Label8" runat="server" Text="Apellido"></asp:Label>
                        <asp:TextBox ID="txtApellido" runat="server" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                        <asp:Label ID="Label9" runat="server" Text="Sexo"></asp:Label>
                        <asp:RadioButtonList ID="rblSexo" runat="server" Width="100px">
                            <asp:ListItem Value="2">Masculino</asp:ListItem>
                            <asp:ListItem Value="1">Femenino</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="rblSexo" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                        <asp:Label ID="Label10" runat="server" Text="Nacionalidad"></asp:Label>
                        <asp:TextBox ID="txtNacionalidad" runat="server" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                        <asp:Label ID="Label11" runat="server" Text="Fecha de nacimiento"></asp:Label>
                        <asp:TextBox ID="txtFechaNacimiento" TextMode="Date" runat="server" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ControlToValidate="txtFechaNacimiento" ForeColor="#CC0000" ValidationGroup="0">Poner una fecha valida</asp:RequiredFieldValidator>
                        <asp:Label ID="Label12" runat="server" Text="Direccion"></asp:Label>
                        <asp:TextBox ID="txtDireccion" runat="server" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
            </div>
            <div class="columna">
                   <asp:Label ID="Label13" runat="server" Text="Provincia"></asp:Label>
                        <asp:DropDownList ID="ddlProvincia" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="ddlProvincia" ForeColor="#CC0000" ValidationGroup="0" InitialValue="0">Seleccione una provincia</asp:RequiredFieldValidator>
                        <asp:Label ID="Localidad" runat="server" Text="Localidad"></asp:Label>
                        <asp:DropDownList ID="ddlLocalidad" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="ddlLocalidad" ForeColor="#CC0000" ValidationGroup="0">Seleccione una localidad</asp:RequiredFieldValidator>
                        <asp:Label ID="Label15" runat="server" Text="Correo electronico"></asp:Label>
                        <asp:TextBox ID="txtCorreo" runat="server" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtCorreo" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ValidationGroup="0">Ingrese un correo valido</asp:RegularExpressionValidator>
                        <asp:Label ID="Label16" runat="server" Text="Telefono"></asp:Label>
                        <asp:TextBox ID="txtTelefono" runat="server" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ForeColor="#CC0000" ValidationGroup="0">Completar</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTelefono" ForeColor="Red" ValidationGroup="0" ValidationExpression="^(\d{10})$">Ingrese un numero sin el  0 / 15</asp:RegularExpressionValidator>
            </div>

        </div>
        <div class="container-3"
            <div class="container-3-btn">
                  <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" ValidationGroup="0" Width="100px" OnClientClick="return confirm('¿Estás seguro que quieres añadirlo?');" CssClass ="container-3-btn" />
            </div>
            <asp:Label ID="lblExito" runat="server" ForeColor="#33CC33" Text="Agregado correctamente" Visible="False"></asp:Label>
               <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Volver</asp:HyperLink> 
            </div>
    </form>
</body>
</html>
