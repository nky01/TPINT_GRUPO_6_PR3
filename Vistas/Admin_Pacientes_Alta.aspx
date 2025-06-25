<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Pacientes_Alta.aspx.cs" Inherits="Vistas.AltaPaciente" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Alta de Paciente</title>
    <style type="text/css">
        * {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body, html {
            background-color: #f6f6f6;
            height: 100%;
            width: 100%;
        }
        
        form {
            height: 100%;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .container-1 {
            background-color: #8aaeea;
            color: white;
            padding: 15px 30px;
            width: 100%;
            display: flex;
            justify-content: space-between;
            font-weight: bold;
        }
        
        .alta-container {
            background-color: white;
            margin: 30px 0;
            padding: 30px;
            width: 90%;
            max-width: 900px;
            display: flex;
            gap: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        .columna {
            display: flex;
            flex-direction: column;
        }
        
        .columna label,
        .columna .aspNetLabel {
            margin-bottom: 6px;
            font-weight: bold;
            color: #333;
        }
        
        .columna input[type="text"],
        .columna input[type="date"],
        .columna select,
        .columna .aspNetTextBox,
        .columna .aspNetDropDownList {
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
            width: 300px;
            max-width: 100%;
        }
        
        .columna .aspNetRadioButtonList {
            margin-bottom: 15px;
        }
        
        .aspNetRequiredValidator,
        .aspNetRegularValidator {
            font-size: 12px;
            margin-bottom: 10px;
            color: #cc0000;
        }
        
        .container-3 {
            width: 90%;
            max-width: 900px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
        }
        
        .container-3-btn {
            padding: 10px 20px;
            background-color: #8aaeea;
            border: none;
            border-radius: 6px;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }
        
        #lblExito {
            font-size: 14px;
            margin-left: 20px;
        }

        h2 {
            width: 100%;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-1">
            <asp:Label ID="tipoUsuario" runat="server" Text="tipoUsuario"></asp:Label>
            <asp:Label ID="nombreUsuario" runat="server" Text="lblNombreUsuario"></asp:Label>
        </div>
        

        <div class="alta-container">
        <h2>Datos del paciente</h2>
            <div class="columna">
                <asp:Label ID="Label6" runat="server" Text="DNI"></asp:Label>
                <asp:TextBox ID="txtDni" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtDni" CssClass="aspNetRequiredValidator" ValidationGroup="0" ForeColor="Red">Completar</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="txtDni" CssClass="aspNetRegularValidator" ValidationExpression="^\d{7,8}$" ValidationGroup="0" ForeColor="Red">Ingrese un DNI válido</asp:RegularExpressionValidator>

                <asp:Label ID="Label7" runat="server" Text="Nombre"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" CssClass="aspNetRequiredValidator" ValidationGroup="0" ForeColor="Red">Completar</asp:RequiredFieldValidator>

                <asp:Label ID="Label8" runat="server" Text="Apellido"></asp:Label>
                <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" CssClass="aspNetRequiredValidator" ValidationGroup="0" ForeColor="Red">Completar</asp:RequiredFieldValidator>

                <asp:Label ID="Label9" runat="server" Text="Sexo"></asp:Label>
                <asp:RadioButtonList ID="rblSexo" runat="server" CssClass="aspNetRadioButtonList">
                    <asp:ListItem Value="2">Masculino</asp:ListItem>
                    <asp:ListItem Value="1">Femenino</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="rblSexo" CssClass="aspNetRequiredValidator" ValidationGroup="0" ForeColor="Red">Completar</asp:RequiredFieldValidator>

                <asp:Label ID="Label10" runat="server" Text="Nacionalidad"></asp:Label>
                <asp:TextBox ID="txtNacionalidad" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad" CssClass="aspNetRequiredValidator" ValidationGroup="0" ForeColor="Red">Completar</asp:RequiredFieldValidator>

                <asp:Label ID="Label11" runat="server" Text="Fecha de nacimiento"></asp:Label>
                <asp:TextBox ID="txtFechaNacimiento" TextMode="Date" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ControlToValidate="txtFechaNacimiento" CssClass="aspNetRequiredValidator" ValidationGroup="0" ForeColor="Red">Ingrese una fecha válida</asp:RequiredFieldValidator>

                <asp:Label ID="Label12" runat="server" Text="Dirección"></asp:Label>
                <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" CssClass="aspNetRequiredValidator" ValidationGroup="0" ForeColor="Red">Completar</asp:RequiredFieldValidator>
            </div>

            <div class="columna">
                <asp:Label ID="Label13" runat="server" Text="Provincia"></asp:Label>
                <asp:DropDownList ID="ddlProvincia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="ddlProvincia" CssClass="aspNetRequiredValidator" ValidationGroup="0" InitialValue="0" ForeColor="Red">Seleccione una provincia</asp:RequiredFieldValidator>

                <asp:Label ID="Localidad" runat="server" Text="Localidad"></asp:Label>
                <asp:DropDownList ID="ddlLocalidad" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="ddlLocalidad" CssClass="aspNetRequiredValidator" ValidationGroup="0" ForeColor="Red">Seleccione una localidad</asp:RequiredFieldValidator>

                <asp:Label ID="Label15" runat="server" Text="Correo electrónico"></asp:Label>
                <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreo" CssClass="aspNetRequiredValidator" ValidationGroup="0" ForeColor="Red">Completar</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtCorreo" CssClass="aspNetRegularValidator" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ValidationGroup="0" ForeColor="Red">Ingrese un correo válido</asp:RegularExpressionValidator>

                <asp:Label ID="Label16" runat="server" Text="Teléfono"></asp:Label>
                <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" CssClass="aspNetRequiredValidator" ValidationGroup="0" ForeColor="Red">Completar</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTelefono" CssClass="aspNetRegularValidator" ValidationExpression="^(\d{10})$" ValidationGroup="0" ForeColor="Red">Ingrese un número sin el 0/15</asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="container-3">
            <asp:Button ID="btnAgregar" runat="server" OnClick="BtnAgregar_Click" Text="Agregar" ValidationGroup="0" CssClass="container-3-btn" />
            <asp:Label ID="lblExito" runat="server" ForeColor="#33CC33" Text="Agregado correctamente" Visible="False"></asp:Label>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin_Pacientes.aspx" CssClass="link-volver">Volver</asp:HyperLink>
            <span>
            <asp:Button ID="CerrarBtn" runat="server" Text="Cerrar Sesión"  CssClass="container-3-btn" OnClick="CerrarBtn_Click"/>
            </span>
        </div>
    </form>
</body>
</html>
