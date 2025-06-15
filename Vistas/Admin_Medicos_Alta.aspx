<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Medicos_Alta.aspx.cs" Inherits="Vistas.AltaMedicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
                        <asp:Label ID="labelTipoUsuario" runat="server" Text="tipoUsuario"></asp:Label>
                         <asp:Label ID="labelNombreUsuario" runat="server" Text="lblNombreUsuario"></asp:Label>
             </div>
         <div class="alta-container">
    <div class="columna">
        <asp:Label ID="labelHeader" runat="server" Font-Bold="True" Font-Size="15pt" Text="Datos del médico:"></asp:Label>
        <asp:Label ID="labelLegajo" runat="server" Text="Legajo:"></asp:Label>
        <asp:TextBox ID="textboxLegajo" runat="server" Width="100px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="textboxLegajo" ForeColor="#CC0000" ValidationGroup="0">Completar el legajo</asp:RequiredFieldValidator>

        <asp:Label ID="labelDNI" runat="server" Text="DNI:"></asp:Label>
        <asp:TextBox ID="textboxDNI" runat="server" Width="100px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="textboxDNI" ForeColor="#CC0000" ValidationGroup="0">Completar DNI</asp:RequiredFieldValidator>

        <asp:Label ID="labelNombre" runat="server" Text="Nombre:"></asp:Label>
        <asp:TextBox ID="textboxNombre" runat="server" Width="100px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="textboxNombre" ForeColor="#CC0000" ValidationGroup="0">Completar Nombre</asp:RequiredFieldValidator>

        <asp:Label ID="labelApellido" runat="server" Text="Apellido:"></asp:Label>
        <asp:TextBox ID="textboxApellido" runat="server" Width="100px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="textboxApellido" ForeColor="#CC0000" ValidationGroup="0">Completar Apellido</asp:RequiredFieldValidator>

        <asp:Label ID="labelSexo" runat="server" Text="Sexo:"></asp:Label>
        <asp:RadioButtonList ID="radioButtonSexo" runat="server">
            <asp:ListItem>Masculino</asp:ListItem>
            <asp:ListItem>Femenino</asp:ListItem>
            <asp:ListItem>No Especificado</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="radioButtonSexo" ForeColor="#CC0000" ValidationGroup="0">Ingresar un sexo</asp:RequiredFieldValidator>

        <asp:Label ID="labelNacionalidad" runat="server" Text="Nacionalidad:"></asp:Label>
        <asp:TextBox ID="textboxNacionalidad" runat="server" Width="100px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="textboxNacionalidad" ForeColor="#CC0000" ValidationGroup="0">Completar Nacionalidad</asp:RequiredFieldValidator>

        <asp:Label ID="labelNacimiento" runat="server" Text="Fecha de Nacimiento:"></asp:Label>
        <asp:TextBox ID="textboxFecha" runat="server" Width="100px"></asp:TextBox>

        <asp:Label ID="labelDireccion" runat="server" Text="Direccion:"></asp:Label>
        <asp:TextBox ID="textboxDireccion" runat="server" Width="100px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="textboxDireccion" ForeColor="#CC0000" ValidationGroup="0">Completar Direccion</asp:RequiredFieldValidator>
    </div>

    <div class="columna">
        <asp:Label ID="labelProvincia" runat="server" Text="Provincia:"></asp:Label>
        <asp:DropDownList ID="ddlProvincia" runat="server"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="ddlProvincia" ForeColor="#CC0000" ValidationGroup="0" InitialValue="0">Seleccione Provincia</asp:RequiredFieldValidator>

        <asp:Label ID="labelLocalidad" runat="server" Text="Localidad:"></asp:Label>
        <asp:DropDownList ID="ddlLocalidad" runat="server"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="ddlLocalidad" ForeColor="#CC0000" ValidationGroup="0" InitialValue="0">Seleccione Localidad</asp:RequiredFieldValidator>

        <asp:Label ID="labelEmail" runat="server" Text="Correo Electronico:"></asp:Label>
        <asp:TextBox ID="textboxEmail" runat="server" Width="100px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="textboxEmail" ForeColor="#CC0000" ValidationGroup="0">Completar Email</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="textboxEmail" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ValidationGroup="0">Ingrese un correo valido</asp:RegularExpressionValidator>

        <asp:Label ID="labelTelefono" runat="server" Text="Telefono:"></asp:Label>
        <asp:TextBox ID="textboxTelefono" runat="server" Width="100px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="textboxTelefono" ForeColor="#CC0000" ValidationGroup="0">Completar Telefono</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="textboxTelefono" ForeColor="Red" ValidationGroup="0" ValidationExpression="^(\d{10})$">Ingrese un numero sin el 0 / 15</asp:RegularExpressionValidator>

        <asp:Label ID="labelEspecialidad" runat="server" Text="Especialidad:"></asp:Label>
        <asp:DropDownList ID="ddlEspecialidad" runat="server"></asp:DropDownList>

        <asp:Label ID="labelDias" runat="server" Text="Dias de atencion:"></asp:Label>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server">
            <asp:ListItem>Lunes</asp:ListItem>
            <asp:ListItem> Martes</asp:ListItem>
            <asp:ListItem>Miercoles</asp:ListItem>
            <asp:ListItem>Jueves</asp:ListItem>
            <asp:ListItem>Viernes</asp:ListItem>
            <asp:ListItem>Sabado</asp:ListItem>
            <asp:ListItem>Domingo</asp:ListItem>
        </asp:CheckBoxList>
        <asp:CustomValidator ID="customValidatorDias" runat="server"></asp:CustomValidator>

        <asp:Label ID="labelHoras" runat="server" Text="Horarios de Atencion:"></asp:Label>
        <asp:Label ID="labelHorarioComienzo" runat="server" Text="Desde:"></asp:Label>
        <asp:TextBox ID="textboxHorarioComienzo" runat="server" Width="100px"></asp:TextBox>

        <asp:Label ID="labelHorarioFinal" runat="server" Text="Hasta:"></asp:Label>
        <asp:TextBox ID="textboxHorarioFinal" runat="server" Width="100px"></asp:TextBox>
        <asp:RangeValidator ID="rangeHorario1" runat="server" ControlToValidate="textboxHorarioComienzo" MaximumValue="23" MinimumValue="0" Type="Integer">Ingrese un comienzo de horario entre 0 y 23 horas.</asp:RangeValidator>
        <asp:RangeValidator ID="rangeHorario2" runat="server" ControlToValidate="textboxHorarioFinal" MaximumValue="23" MinimumValue="0" Type="Integer">Ingrese un fin de horario entre 0 y 23 horas.</asp:RangeValidator>

        <asp:Label ID="labelUsuario" runat="server" Text="Nombre de Usuario:"></asp:Label>
        <asp:TextBox ID="textboxUsuario" runat="server" Width="100px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="textboxUsuario" ForeColor="#CC0000" ValidationGroup="0">Completar Usuario</asp:RequiredFieldValidator>

        <asp:Label ID="labelPassword" runat="server" Text="Contraseña:"></asp:Label>
        <asp:TextBox ID="textboxPassword" runat="server" Width="100px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="textboxPassword" ForeColor="#CC0000" ValidationGroup="0">Completar Contraseña</asp:RequiredFieldValidator>
    </div>
</div>

        <div class="container-3">
               <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Volver</asp:HyperLink>
                 
                        <asp:Button ID="buttonAgregar" runat="server" OnClick="Button1_Click" Text="Agregar" ValidationGroup="0" Width="100px" OnClientClick="return confirm('¿Estás seguro que quieres añadirlo?');" CssClass ="container-3-btn" />
        </div>
      
    </form>
</body>
</html>
