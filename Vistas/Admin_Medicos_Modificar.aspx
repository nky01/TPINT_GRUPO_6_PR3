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
            &nbsp;<asp:Button ID="buttonBuscar" runat="server" Text="Buscar" OnClick="Button1_Click" />
            &nbsp;<asp:RequiredFieldValidator ID="rfvBuscar" runat="server" ControlToValidate="txtBuscar" ErrorMessage="* Ingrese un legajo" CssClass="error-message" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revLegajo" runat="server" ControlToValidate="txtBuscar" ErrorMessage="Formato inválido. Use M0001, M0002, etc." CssClass="error-message" ValidationExpression="^M\d{4}$" ForeColor="Red"></asp:RegularExpressionValidator>
            <asp:Label ID="lblMensajeError" runat="server" CssClass="error-message"></asp:Label>
            <asp:HiddenField ID="hiddenLegajo" runat="server" />
            <asp:GridView ID="gvMedico" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" Height="248px" Width="1216px" OnRowCancelingEdit="gvMedico_RowCancelingEdit" OnRowEditing="gvMedico_RowEditing" OnRowUpdating="gvMedico_RowUpdating" OnSelectedIndexChanged="gvMedico_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Numero de legajo">
                        <EditItemTemplate>
                            <asp:Label ID="labelEditMedico" runat="server" Text='<%# Bind("Legajo_Medico") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate><asp:Label ID="labelItemLegajo" runat="server" Text='<%# Bind("Legajo_Medico") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Especialidad">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditEspecialidad" runat="server" AutoPostBack="True" DataTextField="Descripcion_Especialidad" DataValueField="Id_Especialidad" OnDataBound="ddlEditEspecialidad_DataBound">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvEditEspecialidad" runat="server" ControlToValidate="ddlEditEspecialidad" ForeColor="Red" InitialValue="0">seleccione una especialidad</asp:RequiredFieldValidator>
                            <br />
                            <asp:HiddenField ID="hdnIdEspecialidad" runat="server" value='<%# Eval("idEspecialidad") %>' />
                        </EditItemTemplate>
                        <ItemTemplate><asp:Label ID="labelItemEspecialidad" runat="server" Text='<%# Eval("Especialidad") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DNI">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditDNI" runat="server" Text='<%# Bind("DNI_Medico") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate><asp:Label ID="labelItemDNI" runat="server" Text='<%# Bind("DNI_Medico") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate><asp:TextBox ID="txtEditNombre" runat="server" Text='<%# Bind("Nombre_Medico") %>'></asp:TextBox></EditItemTemplate>
                        <ItemTemplate><asp:Label ID="labelItemNombre" runat="server" Text='<%# Bind("Nombre_Medico") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido">
                        <EditItemTemplate><asp:TextBox ID="txtEditApellido" runat="server" Text='<%# Bind("Apellido_Medico") %>'></asp:TextBox></EditItemTemplate>
                        <ItemTemplate><asp:Label ID="labelItemApellido" runat="server" Text='<%# Bind("Apellido_Medico") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sexo">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditSexo" runat="server" Text='<%# Bind("Sexo_Medico") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revSexo" runat="server" ControlToValidate="txtEditSexo" ErrorMessage="&quot;Solo se permite M o F&quot;" ValidationExpression="^[MF]{1}$"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate><asp:Label ID="labelItemSexo" runat="server" Text='<%# Bind("Sexo_Medico") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha Nacimiento">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditFecha" runat="server" Text='<%# Bind("FechaNac_Medico") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revFecha" runat="server" ControlToValidate="txtEditFecha" ErrorMessage="Formato inválido. Use DDMMYYYY" ValidationGroup="^(0[1-9]|[12][0-9]|3[01])(0[1-9]|1[0-2])\d{4}$"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate><asp:Label ID="labelItemFecha" runat="server" Text='<%# Bind("FechaNac_Medico") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nacionalidad">
                        <EditItemTemplate>
                            <asp:TextBox ID="textboxEditNacionalidad" runat="server" Text='<%# Bind("Nacionalidad_Medico") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate><asp:Label ID="labelItemNacionalidad" runat="server" Text='<%# Bind("Nacionalidad_Medico") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Direccion">
                        <EditItemTemplate><asp:TextBox ID="txtEditDireccion" runat="server" Text='<%# Bind("Direccion_Medico") %>'></asp:TextBox></EditItemTemplate>
                        <ItemTemplate><asp:Label ID="labelItemDireccion" runat="server" Text='<%# Bind("Direccion_Medico") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Localidad">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditLocalidad" runat="server" AutoPostBack="True" DataTextField="Descripcion_Localidad" DataValueField="Id_Localidad" OnDataBound="ddlEditLocalidad_DataBound">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvEditLocaldiad" runat="server" ControlToValidate="ddlEditLocalidad" ForeColor="Red" InitialValue="0">seleccione una localidad</asp:RequiredFieldValidator>
                            <br />
                            <asp:HiddenField ID="hdnIdLocalidad" runat="server" value='<%# Eval("idLocalidad") %>' />
                        </EditItemTemplate>
                        <ItemTemplate><asp:Label ID="labelItemLocalidad" runat="server" Text='<%# Eval("Localidad") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Provincia">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditProvincia" runat="server" AutoPostBack="True" DataTextField="Descripcion_Provincia" DataValueField="Id_Provincia" OnDataBound="ddlEditProvincia_DataBound" OnSelectedIndexChanged="ddlEditProvincia_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvEditProvincia" runat="server" ControlToValidate="ddlEditProvincia" ForeColor="Red" InitialValue="0">seleccione una provincia</asp:RequiredFieldValidator>
                            <br />
                            <asp:HiddenField ID="hdnProvincia" runat="server" value='<%# Eval("idProvincia") %>' />
                        </EditItemTemplate>
                        <ItemTemplate><asp:Label ID="labelItemProvincia" runat="server" Text='<%# Bind("Provincia") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Correo Electronico">
                        <EditItemTemplate><asp:TextBox ID="txtEditCorreo" runat="server" Text='<%# Bind("CorreoElectronico_Medico") %>'></asp:TextBox></EditItemTemplate>
                        <ItemTemplate><asp:Label ID="labelItemCorreo" runat="server" Text='<%# Bind("CorreoElectronico_Medico") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefono">
                        <EditItemTemplate><asp:TextBox ID="txtEditTelefono" runat="server" Text='<%# Bind("Telefono_Medico") %>'></asp:TextBox></EditItemTemplate>
                        <ItemTemplate><asp:Label ID="labelItemTelefono" runat="server" Text='<%# Bind("Telefono_Medico") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="gvHorario" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowCancelingEdit="gvHorario_RowCancelingEdit" OnRowEditing="gvHorario_RowEditing" OnRowUpdating="gvHorario_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="Numero de Legajo">
                        <EditItemTemplate>
                            <asp:Label ID="lblEditLegajo" runat="server" Text='<%# Bind("Legajo") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblLegajoMedico" runat="server" Text='<%# Bind("Legajo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre Medico">
                        <EditItemTemplate>
                            <asp:Label ID="lblNombreMedico" runat="server" Text='<%# Bind("Medico") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNombreMedico" runat="server" Text='<%# Bind("Medico") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Dia">
                        <EditItemTemplate>
                            <asp:Label ID="lblDia" runat="server" Text='<%# Bind("Dia") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDia" runat="server" Text='<%# Bind("Dia") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Horario Entrada">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditEntrada" runat="server" Text='<%# Bind("EntradaSolo") %>'></asp:TextBox>
                            <asp:RangeValidator ID="rvHorarioEntrada" runat="server" ControlToValidate="txtEditEntrada" CssClass="error-message" ErrorMessage="RangeValidator" ForeColor="Red" MaximumValue="23" MinimumValue="0" Type="Integer">Entre 0 y 23</asp:RangeValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEntrada" runat="server" Text='<%# Bind("Entrada") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Horario Salida">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditSalida" runat="server" Text='<%# Bind("SalidaSolo") %>'></asp:TextBox>
                            <asp:RangeValidator ID="rvHorarioSalida" runat="server" ControlToValidate="txtEditSalida" CssClass="error-message" ErrorMessage="RangeValidator" ForeColor="Red" MaximumValue="23" MinimumValue="0" Type="Integer">Entre 0 y 23</asp:RangeValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSalida" runat="server" Text='<%# Bind("Salida") %>'></asp:Label>
                        </ItemTemplate>
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