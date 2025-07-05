<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicoCargar.aspx.cs" Inherits="Vistas.MedicoCargarObservacion" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Cargar Observación</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f4f4;
        }

        .header {
            background-color: #8aaeea;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
        }

        .container {
            padding: 30px;
            background-color: white;
            margin: 30px auto;
            width: 90%;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .input-group {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .input-group label {
            font-weight: bold;
            margin-right: 10px;
        }

        .input-group input[type="text"] {
            padding: 6px;
            width: 200px;
        }

        .input-group button,
        .btn-volver button {
            padding: 6px 16px;
            background-color: #8aaeea;
            color: white;
            border: none;
            cursor: pointer;
        }

        .grid-container {
            margin-top: 30px;
        }

        #btnBuscar {
            padding: 10px 16px;
            background-color: #8aaeea;
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
        <!-- Encabezado -->
        <div class="header">
            <asp:Label ID="tipoUsuario" runat="server" Text="tipoUsuario"></asp:Label>
            <asp:Label ID="nombreUsuario" runat="server" Text="lblNombreUsuario"></asp:Label>
        </div>

        <div class="container">
            <div class="input-group">
                <label><asp:Label ID="Label3" runat="server" Text="Seleccione un turno:"></asp:Label></label>
                <asp:DropDownList ID="ddlTurnos" runat="server">
                </asp:DropDownList>
                &nbsp;<asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" ValidationGroup="0" />
                <asp:RequiredFieldValidator ID="rfvTurnos" runat="server" ControlToValidate="ddlTurnos" ErrorMessage="Por favor, seleccione un turno." ForeColor="Red" InitialValue="0" ValidationGroup="0"></asp:RequiredFieldValidator>
                <asp:Label ID="lblNoExiste" runat="server" ForeColor="Red" Text="Usted no tiene turnos!" Visible="False"></asp:Label>
                <br />
                <asp:HiddenField ID="hdfTurnoSelected" runat="server" />
            </div>

            <div class="grid-container">
                <asp:GridView ID="gvTurnos" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" CssClass="table" Height="191px" Width="759px" OnRowCancelingEdit="gvTurnos_RowCancelingEdit" OnRowEditing="gvTurnos_RowEditing" OnRowUpdating="gvTurnos_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Código Turno">
                            <EditItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("CodigoTurno") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("CodigoTurno") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DNI Paciente">
                            <EditItemTemplate>
                                <asp:Label ID="lblDni" runat="server" Text='<%# Bind("DniPaciente") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDni" runat="server" Text='<%# Bind("DniPaciente") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Paciente">
                            <EditItemTemplate>
                                <asp:Label ID="lblPaciente" runat="server" Text='<%# Bind("Paciente") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPaciente" runat="server" Text='<%# Bind("Paciente") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEstado" runat="server">
                                    <asp:ListItem>Pendiente</asp:ListItem>
                                    <asp:ListItem>Presente</asp:ListItem>
                                    <asp:ListItem>Ausente</asp:ListItem>
                                    <asp:ListItem>Cancelado</asp:ListItem>
                                </asp:DropDownList>
                                <asp:HiddenField ID="hiddenFieldEstado" runat="server" Value='<%# Bind("Estado") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("Estado") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Observación">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtObservacion" runat="server" Text='<%# Bind("Observacion") %>' TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblObservacion" runat="server" Text='<%# Bind("Observacion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
            </div>

            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Volver</asp:HyperLink> 
        </div>
    </form>
</body>
</html>
