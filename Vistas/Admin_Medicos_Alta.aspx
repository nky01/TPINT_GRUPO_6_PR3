<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Medicos_Alta.aspx.cs" Inherits="Vistas.AltaMedicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 209px;
        }
        .auto-style3 {
            width: 193px;
        }
        .auto-style4 {
            width: 209px;
            height: 26px;
        }
        .auto-style5 {
            width: 193px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
            width: 219px;
        }
        .auto-style7 {
            width: 196px;
        }
        .auto-style8 {
            height: 26px;
            width: 196px;
        }
        .auto-style9 {
            width: 206px;
        }
        .auto-style10 {
            width: 206px;
            height: 26px;
        }
        .auto-style11 {
            width: 209px;
            height: 188px;
        }
        .auto-style12 {
            width: 193px;
            height: 188px;
        }
        .auto-style13 {
            width: 206px;
            height: 188px;
        }
        .auto-style14 {
            width: 196px;
            height: 188px;
        }
        .auto-style15 {
            height: 188px;
            width: 219px;
        }
        .auto-style16 {
            width: 219px;
        }
        .auto-style17 {
            width: 209px;
            height: 48px;
        }
        .auto-style18 {
            width: 193px;
            height: 48px;
        }
        .auto-style19 {
            width: 206px;
            height: 48px;
        }
        .auto-style20 {
            width: 196px;
            height: 48px;
        }
        .auto-style21 {
            width: 219px;
            height: 48px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="labelHeader" runat="server" Font-Bold="True" Font-Size="15pt" Text="Datos del medico:"></asp:Label>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="labelLegajo" runat="server" Text="Legajo:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="textboxLegajo" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">
                        <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="textboxLegajo" ForeColor="#CC0000" ValidationGroup="0">Completar el legajo</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="labelDNI" runat="server" Text="DNI:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="textboxDNI" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">
                        <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="textboxDNI" ForeColor="#CC0000" ValidationGroup="0">Completar DNI</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="labelNombre" runat="server" Text="Nombre:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="textboxNombre" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style10">
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="textboxNombre" ForeColor="#CC0000" ValidationGroup="0">Completar Nombre</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style8"></td>
                    <td class="auto-style6"></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="labelApellido" runat="server" Text="Apellido:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="textboxApellido" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="textboxApellido" ForeColor="#CC0000" ValidationGroup="0">Completar Apellido</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="labelSexo" runat="server" Text="Sexo:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:RadioButtonList ID="radioButtonSexo" runat="server">
                            <asp:ListItem>Masculino</asp:ListItem>
                            <asp:ListItem>Femenino</asp:ListItem>
                            <asp:ListItem>No Especificado</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="auto-style9">
                        <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="radioButtonSexo" ForeColor="#CC0000" ValidationGroup="0">Ingresar un genero</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">
                        <asp:Label ID="labelNacionalidad" runat="server" Text="Nacionalidad:"></asp:Label>
                    </td>
                    <td class="auto-style18">
                        <asp:TextBox ID="textboxNacionalidad" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style19">
                        <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="textboxNacionalidad" ForeColor="#CC0000" ValidationGroup="0">Completar Nacionalidad</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style20"></td>
                    <td class="auto-style21"></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="labelNacimiento" runat="server" Text="Fecha de Nacimiento:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="textboxFecha" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="labelDireccion" runat="server" Text="Direccion:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="textboxDireccion" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="textboxDireccion" ForeColor="#CC0000" ValidationGroup="0">Completar Direccion</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Localidad" runat="server" Text="Localidad:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="textboxLocalidad" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">
                        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="textboxLocalidad" ForeColor="#CC0000" ValidationGroup="0">Completar Localidad</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="labelProvincia" runat="server" Text="Provincia:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="textboxProvincia" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">
                        <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="textboxProvincia" ForeColor="#CC0000" ValidationGroup="0">Completar Provincia</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="labelEmail" runat="server" Text="Correo Electronico:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="textboxEmail" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="textboxEmail" ForeColor="#CC0000" ValidationGroup="0">Completar Email</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">
                        <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="textboxEmail" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ValidationGroup="0">Ingrese un correo valido</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="labelTelefono" runat="server" Text="Telefono:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="textboxTelefono" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="textboxTelefono" ForeColor="#CC0000" ValidationGroup="0">Completar Telefono</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">
                        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="textboxTelefono" ForeColor="Red" ValidationGroup="0" ValidationExpression="^(\d{10})$">Ingrese un numero sin el  0 / 15</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="labelEspecialidad" runat="server" Text="Especialidad:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="textboxEspecialidad" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">
                        <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="textboxEspecialidad" ForeColor="#CC0000" ValidationGroup="0">Completar Especialidad</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11">
                        <asp:Label ID="labelDias" runat="server" Text="Dias de atencion:"></asp:Label>
                    </td>
                    <td class="auto-style12">
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                            <asp:ListItem>Lunes</asp:ListItem>
                            <asp:ListItem> Martes</asp:ListItem>
                            <asp:ListItem>Miercoles</asp:ListItem>
                            <asp:ListItem>Jueves</asp:ListItem>
                            <asp:ListItem>Viernes</asp:ListItem>
                            <asp:ListItem>Sabado</asp:ListItem>
                            <asp:ListItem>Domingo</asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                    <td class="auto-style13">
                        <asp:CustomValidator ID="customValidatorDias" runat="server"></asp:CustomValidator>
                    </td>
                    <td class="auto-style14"></td>
                    <td class="auto-style15"></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="labelHoras" runat="server" Text="Horarios de Atencion:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="labelHorarioComienzo" runat="server" Text="Desde:"></asp:Label>
                    </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="textboxHorarioComienzo" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="labelHorarioFinal" runat="server" Text="Hasta:"></asp:Label>
                    </td>
                    <td class="auto-style16">
                        <asp:TextBox ID="textboxHorarioFinal" runat="server" Width="100px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="labelUsuario" runat="server" Text="Nombre de Usuario:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="textboxUsuario" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">
                        <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="textboxUsuario" ForeColor="#CC0000" ValidationGroup="0">Completar Usuario</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">
                        <asp:RangeValidator ID="rangeHorario1" runat="server" ControlToValidate="textboxHorarioComienzo" ErrorMessage="RangeValidator" MaximumValue="23" MinimumValue="0" Type="Integer">Ingrese un comienzo de horario entre 0 y 23 horas.</asp:RangeValidator>
                    </td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="labelPassword" runat="server" Text="Contraseña:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="textboxPassword" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="textboxPassword" ForeColor="#CC0000" ValidationGroup="0">Completar Contraseña</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">
                        <asp:RangeValidator ID="rangeHorario2" runat="server" ControlToValidate="textboxHorarioFinal" ErrorMessage="RangeValidator" MaximumValue="23" MinimumValue="0" Type="Integer">Ingrese un fin de horario entre 0 y 23 horas.</asp:RangeValidator>
                    </td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="buttonVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" Width="100px" />
                    </td>
                    <td class="auto-style3">
                        <asp:Button ID="buttonAgregar" runat="server" OnClick="Button1_Click" Text="Agregar" ValidationGroup="0" Width="100px" />
                        </td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style16">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
