<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Medicos_Alta.aspx.cs" Inherits="Vistas.AltaMedicos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Alta de Médicos</title>
    <style>
        * {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #f6f6f6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .container-1 {
            background-color: #8aaeea;
            color: white;
            width: 100%;
            display: flex;
            justify-content: space-between;
            padding: 15px 30px;
            font-weight: bold;
            font-size: 16px;
        }

        .alta-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            width: 100%;
            padding: 30px 20px;
            gap: 40px;
            background-color: white;
        }

        .columna {
            width: 400px;
            display: flex;
            flex-direction: column;
        }

        .columna > * {
            margin-bottom: 10px;
        }

        input[type="text"], select {
            padding: 8px;
            width: 100%;
            font-size: 14px;
        }

        .alta-btn,
        .container-3-btn {
            padding: 12px;
            background-color: #8aaeea;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 14px;
            cursor: pointer;
        }

        .alta-btn:hover,
        .container-3-btn:hover {
            background-color: #274ede;
        }

        .container-3 {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 90%;
            max-width: 900px;
            margin: 20px auto;
        }

        .validator {
            color: red;
            font-size: 13px;
        }

        .radio-list,
        .check-list {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .radio-list label,
        .check-list label {
            font-weight: normal;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-1">
            <asp:Label ID="labelTipoUsuario" runat="server" Text="TipoUsuario"></asp:Label>
            <asp:Label ID="labelNombreUsuario" runat="server" Text="NombreUsuario"></asp:Label>
        </div>

        <div class="alta-container">
            <div class="columna">
                <asp:Label runat="server" Font-Bold="True" Font-Size="15pt" Text="Datos del médico:" />
                <asp:Label runat="server" Text="Legajo:" />
                <asp:TextBox ID="textboxLegajo" runat="server" />
                <asp:RequiredFieldValidator CssClass="validator" ID="rfvLegajo" runat="server" ControlToValidate="textboxLegajo" ValidationGroup="0" Text="* Completar el legajo" />

                <asp:Label runat="server" Text="DNI:" />
                <asp:TextBox ID="textboxDNI" runat="server" />
                <asp:RequiredFieldValidator CssClass="validator" ID="rfvDni" runat="server" ControlToValidate="textboxDNI" ValidationGroup="0" Text="* Completar DNI" />

                <asp:Label runat="server" Text="Nombre:" />
                <asp:TextBox ID="textboxNombre" runat="server" />
                <asp:RequiredFieldValidator CssClass="validator" ID="rfvNombre" runat="server" ControlToValidate="textboxNombre" ValidationGroup="0" Text="* Completar Nombre" />

                <asp:Label runat="server" Text="Apellido:" />
                <asp:TextBox ID="textboxApellido" runat="server" />
                <asp:RequiredFieldValidator CssClass="validator" ID="rfvApellido" runat="server" ControlToValidate="textboxApellido" ValidationGroup="0" Text="* Completar Apellido" />

                <asp:Label runat="server" Text="Sexo:" />
                <asp:RadioButtonList ID="radioButtonSexo" runat="server" CssClass="radio-list">
                    <asp:ListItem>Masculino</asp:ListItem>
                    <asp:ListItem>Femenino</asp:ListItem>
                    <asp:ListItem>No Especificado</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator CssClass="validator" ID="rfvSexo" runat="server" ControlToValidate="radioButtonSexo" ValidationGroup="0" Text="* Seleccione un sexo" />

                <asp:Label runat="server" Text="Nacionalidad:" />
                <asp:TextBox ID="textboxNacionalidad" runat="server" />
                <asp:RequiredFieldValidator CssClass="validator" ID="rfvNacionalidad" runat="server" ControlToValidate="textboxNacionalidad" ValidationGroup="0" Text="* Completar Nacionalidad" />

                <asp:Label runat="server" Text="Fecha de Nacimiento:" />
                <asp:TextBox ID="textboxFecha" runat="server" />

                <asp:Label runat="server" Text="Dirección:" />
                <asp:TextBox ID="textboxDireccion" runat="server" />
                <asp:RequiredFieldValidator CssClass="validator" ID="rfvDireccion" runat="server" ControlToValidate="textboxDireccion" ValidationGroup="0" Text="* Completar Dirección" />
            </div>

            <div class="columna">
                <asp:Label runat="server" Text="Provincia:" />
                <asp:DropDownList ID="ddlProvincia" runat="server" />
                <asp:RequiredFieldValidator CssClass="validator" ID="rfvProvincia" runat="server" ControlToValidate="ddlProvincia" InitialValue="0" ValidationGroup="0" Text="* Seleccione Provincia" />

                <asp:Label runat="server" Text="Localidad:" />
                <asp:DropDownList ID="ddlLocalidad" runat="server" />
                <asp:RequiredFieldValidator CssClass="validator" ID="rfvLocalidad" runat="server" ControlToValidate="ddlLocalidad" InitialValue="0" ValidationGroup="0" Text="* Seleccione Localidad" />

                <asp:Label runat="server" Text="Correo Electrónico:" />
                <asp:TextBox ID="textboxEmail" runat="server" />
                <asp:RequiredFieldValidator CssClass="validator" ID="rfvEmail" runat="server" ControlToValidate="textboxEmail" ValidationGroup="0" Text="* Completar Email" />
                <asp:RegularExpressionValidator CssClass="validator" ID="revCorreo" runat="server" ControlToValidate="textboxEmail" ValidationGroup="0" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Text="* Email inválido" />

                <asp:Label runat="server" Text="Teléfono:" />
                <asp:TextBox ID="textboxTelefono" runat="server" />
                <asp:RequiredFieldValidator CssClass="validator" ID="rfvTelefono" runat="server" ControlToValidate="textboxTelefono" ValidationGroup="0" Text="* Completar Teléfono" />
                <asp:RegularExpressionValidator CssClass="validator" ID="revTelefono" runat="server" ControlToValidate="textboxTelefono" ValidationGroup="0" ValidationExpression="^(\d{10})$" Text="* Ingrese 10 dígitos sin 0 ni 15" />

                <asp:Label runat="server" Text="Especialidad:" />
                <asp:DropDownList ID="ddlEspecialidad" runat="server" />

                <asp:Label runat="server" Text="Días de Atención:" />
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" CssClass="check-list">
                    <asp:ListItem>Lunes</asp:ListItem>
                    <asp:ListItem>Martes</asp:ListItem>
                    <asp:ListItem>Miércoles</asp:ListItem>
                    <asp:ListItem>Jueves</asp:ListItem>
                    <asp:ListItem>Viernes</asp:ListItem>
                    <asp:ListItem>Sábado</asp:ListItem>
                    <asp:ListItem>Domingo</asp:ListItem>
                </asp:CheckBoxList>
                <asp:CustomValidator CssClass="validator" ID="customValidatorDias" runat="server" />

                <asp:Label runat="server" Text="Horarios de Atención:" />
                <asp:Label runat="server" Text="Desde:" />
                <asp:TextBox ID="textboxHorarioComienzo" runat="server" />
                <asp:RangeValidator CssClass="validator" ID="rangeHorario1" runat="server" ControlToValidate="textboxHorarioComienzo" MinimumValue="0" MaximumValue="23" Type="Integer" Text="* Entre 0 y 23" />

                <asp:Label runat="server" Text="Hasta:" />
                <asp:TextBox ID="textboxHorarioFinal" runat="server" />
                <asp:RangeValidator CssClass="validator" ID="rangeHorario2" runat="server" ControlToValidate="textboxHorarioFinal" MinimumValue="0" MaximumValue="23" Type="Integer" Text="* Entre 0 y 23" />

                <asp:Label runat="server" Text="Nombre de Usuario:" />
                <asp:TextBox ID="textboxUsuario" runat="server" />
                <asp:RequiredFieldValidator CssClass="validator" ID="rfvUsuario" runat="server" ControlToValidate="textboxUsuario" ValidationGroup="0" Text="* Completar Usuario" />

                <asp:Label runat="server" Text="Contraseña:" />
                <asp:TextBox ID="textboxPassword" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator CssClass="validator" ID="rfvPassword" runat="server" ControlToValidate="textboxPassword" ValidationGroup="0" Text="* Completar Contraseña" />
            </div>
        </div>

        <div class="container-3">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin_Medicos.aspx">Volver</asp:HyperLink>
            <asp:Button ID="buttonAgregar" runat="server" Text="Agregar" CssClass="container-3-btn" ValidationGroup="0" OnClick="buttonAgregar_Click"  />
            <asp:Label ID="lblExito" runat="server" ForeColor="#33CC33" Text="Agregado correctamente" Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
