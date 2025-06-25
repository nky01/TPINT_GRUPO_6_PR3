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
            overflow-x: hidden;
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .grid-container {
            width: 100%;
            overflow-x: auto; 
            padding: 10px;
            box-sizing: border-box;
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
            <asp:Label ID="tipoUsuario" runat="server" Text="tipoUsuario"></asp:Label>
            <asp:Label ID="nombreUsuario" runat="server" Text="lblNombreUsuario"></asp:Label>
        </div>

        <div class="modif-container">
            <h2>Modificar Paciente</h2>

            <div class="search-section">
                <asp:Label ID="Label4" runat="server" Text="Buscar por DNI:"></asp:Label>
                <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
                &nbsp;<asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn" OnClick="btnBuscar_Click" />
            </div>

            <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtBusqueda" CssClass="validation-message" ValidationGroup="0" ForeColor="Red">Ingrese un DNI!</asp:RequiredFieldValidator><br />
            <asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="txtBusqueda" CssClass="validation-message" ValidationExpression="^\d{7,8}$" ValidationGroup="0" ForeColor="Red">Ingrese un DNI válido!</asp:RegularExpressionValidator>

            <div class="grid-container">
                <asp:GridView ID="gvPaciente" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowCancelingEdit="gvPaciente_RowCancelingEdit" OnRowEditing="gvPaciente_RowEditing" OnRowUpdating="gvPaciente_RowUpdating" OnSelectedIndexChanged="gvPaciente_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="DNI">
                            <EditItemTemplate>
                                <asp:Label ID="dniEditTemplate" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="dniTemplate" runat="server" Text='<%# Eval("DNI") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditNombre" runat="server" ControlToValidate="txtEditNombre" ForeColor="Red">ingrese un nombre</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apellido">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditApellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditApellido" runat="server" ControlToValidate="txtEditApellido" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Ingrese un apelldio</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("Apellido") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sexo">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditSexo" runat="server" Text='<%# Bind("Sexo") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="revSexo" runat="server" ControlToValidate="txtEditSexo" ErrorMessage="&quot;Solo se permite M o F&quot;" ValidationExpression="^[MF]{1}$"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="labelSexo" runat="server" Text='<%# Eval("Sexo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha Nacimiento">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditFecha" runat="server" Text='<%# Bind("FechaNacimiento") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="revFecha" runat="server" ControlToValidate="txtEditFecha" ErrorMessage="Formato inválido. Use DDMMYYYY" ValidationGroup="^(0[1-9]|[12][0-9]|3[01])(0[1-9]|1[0-2])\d{4}$"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="labelFecha" runat="server" Text='<%# Eval("FechaNacimiento") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nacionalidad">
                            <EditItemTemplate>
                                <asp:TextBox ID="textboxNacionalidad" runat="server" Text='<%# Bind("Nacionalidad") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="labelNacionalidad" runat="server" Text='<%# Eval("Nacionalidad") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Dirección">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditDireccion" runat="server" Text='<%# Bind("Direccion") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditDireccion" runat="server" ControlToValidate="txtEditDireccion" ErrorMessage="RequiredFieldValidator" ForeColor="Red">ingrese una direccion</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("Direccion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Localidad">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEditLocalidad" runat="server"  DataTextField="Descripcion_Localidad" DataValueField="Id_Localidad" OnDataBound="ddlEditLocalidad_DataBound" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvEditLocaldiad" runat="server" ControlToValidate="ddlEditLocalidad" ForeColor="Red" InitialValue="0">seleccione una localidad</asp:RequiredFieldValidator>
                                <asp:HiddenField ID="hdnIdLocalidad" runat="server" value ='<%# Eval("idLocalidad") %>'></asp:HiddenField>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text='<%# Eval("Localidad") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Provincia">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEditProvincia" runat="server"  DataTextField="Descripcion_Provincia" DataValueField="Id_Provincia" OnDataBound="ddlEditProvincia_DataBound" AutoPostBack="True" OnSelectedIndexChanged="ddlEditProvincia_SelectedIndexChanged" >
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvEditProvincia" runat="server" ControlToValidate="ddlEditProvincia" ForeColor="Red" InitialValue="0">seleccione una provincia</asp:RequiredFieldValidator>
                                <asp:HiddenField ID="hdnProvincia" runat="server" value ='<%# Eval("idProvincia") %>'></asp:HiddenField>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("Provincia") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Correo Electrónico">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditCorreo" runat="server" Text='<%# Bind("Correo") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditCorreo" runat="server" ControlToValidate="txtEditCorreo" ForeColor="Red">Ingrese un correo</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEditCorreo" runat="server" ControlToValidate="txtEditCorreo" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$">ingrese un correo valido</asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label17" runat="server" Text='<%# Eval("Correo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Teléfono">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditTelefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditTelefono" runat="server" ControlToValidate="txtEditTelefono" ForeColor="Red">Ingrese un telefono</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEditTelefono" runat="server" ControlToValidate="txtEditTelefono" ForeColor="Red" ValidationExpression="^(\d{10})$">Ingrese un telefono valido</asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("Telefono") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <div class="container-3">
            <asp:Button ID="CerrarSesionbtn" runat="server" CssClass="btn" Text="Cerrar Sesión" OnClick="CerrarSesionbtn_Click" />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin_Pacientes.aspx" CssClass="btn">Volver</asp:HyperLink>
        </div>
    </form>
</body>
</html>
