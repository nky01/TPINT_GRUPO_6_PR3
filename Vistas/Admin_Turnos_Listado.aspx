<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Turnos_Listado.aspx.cs" Inherits="Vistas.Admin_Turnos_Listado" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Listado de Pacientes</title>
    <style type="text/css">
        body {
            background-color: #F6F6F6;
            font-family: Arial, sans-serif;
        }

        .header {
            background-color: #8aaeea;
            color: white;
            font-weight: bold;
            padding: 10px 20px;
        }

        .content {
            padding: 20px;
        }

        .form-controls {
            margin-bottom: 20px;
        }

        .form-controls label,
        .form-controls input,
        .form-controls button {
            margin-right: 10px;
        }

        .footer {
            margin-top: 20px;
        }

        .error {
            color: red;
            font-size: small;
        }

        .gridview {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <asp:Label ID="tipoUsuario" runat="server" Text="tipoUsuario"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="nombreUsuario" runat="server" Text="lblNombreUsuario"></asp:Label>
        </div>

        <div class="content">
            <asp:Label ID="labelHeader" runat="server" Font-Bold="True" Font-Size="15pt" Text="Turnos"></asp:Label>
            <br />
            <asp:Label ID="labelFiltros" runat="server" Text="Filtrar por:"></asp:Label>
            <asp:DropDownList ID="ddlOpcionesFiltro" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlOpcionesFiltro_SelectedIndexChanged">
                <asp:ListItem Value="Vacio">-- Seleccione un filtro --</asp:ListItem>
                <asp:ListItem>ID</asp:ListItem>
                <asp:ListItem Value="Paciente">DNI Paciente</asp:ListItem>
                <asp:ListItem Value="Medico">Legajo Medico</asp:ListItem>
                <asp:ListItem>Especialidad</asp:ListItem>
                <asp:ListItem>Fecha</asp:ListItem>
                <asp:ListItem>Estado</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnAll" runat="server" OnClick="btnAll_Click" Text="Filtrar Todos" />
            <asp:Panel ID="panelID" runat="server" Visible="False">
                <asp:Label ID="labelID" runat="server" Text="Buscar por ID"></asp:Label>
                <asp:TextBox ID="txtID" runat="server" />
                <asp:RequiredFieldValidator ID="rfvID" runat="server" ControlToValidate="txtID"
                    ErrorMessage="Ingrese un ID" ForeColor="Red" ValidationGroup="0" CssClass="error" />
                <asp:CustomValidator ID="cvID" runat="server" ControlToValidate="txtID" CssClass="error" ErrorMessage="Ese ID no existe." ForeColor="Red" OnServerValidate="cvID_ServerValidate" ValidationGroup="0"></asp:CustomValidator>
                <asp:Button ID="btnID" runat="server" OnClick="btnID_Click" Text="Buscar" ValidationGroup="0" />
            </asp:Panel>
            <div class="form-controls">
                <asp:Panel ID="panelPaciente" runat="server" Visible="False">
                    <asp:Label ID="labelPaciente" runat="server" Text="Buscar por Paciente"></asp:Label>
                    <asp:TextBox ID="txtPaciente" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvDNIPac" runat="server" ControlToValidate="txtPaciente"
                    ErrorMessage="Ingrese un DNI" ForeColor="Red" ValidationGroup="1" CssClass="error" />
                    <asp:CustomValidator ID="cvDniPac" runat="server" ControlToValidate="txtPaciente" CssClass="error" ErrorMessage="DNI No registrado" ForeColor="Red" OnServerValidate="cvDniPac_ServerValidate" ValidationGroup="1"></asp:CustomValidator>
                    <asp:Button ID="btnDNIPac" runat="server" OnClick="btnDNIPac_Click" Text="Buscar" ValidationGroup="1" />
                    <br />
                    <asp:Label ID="labelNombre" runat="server" Text="Buscar por Nombre"></asp:Label>
                    <asp:TextBox ID="txtNombre" runat="server" />
                    <asp:Button ID="btnNombre" runat="server" OnClick="btnNombre_Click" Text="Button" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNombre" ErrorMessage="Solo ingrese letras, sin acentos." Font-Size="Small" ForeColor="#CC0000" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="6"></asp:RegularExpressionValidator>
                </asp:Panel>
                <asp:Panel ID="panelMedico" runat="server" Visible="False">
                    <asp:Label ID="labelMedico" runat="server" Text="Buscar por Medico"></asp:Label>
                    <asp:TextBox ID="txtMedico" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvMed" runat="server" ControlToValidate="txtMedico"
                    ErrorMessage="Ingrese un Legajo" ForeColor="Red" ValidationGroup="2" CssClass="error" />
                    <asp:CustomValidator ID="cvMed" runat="server" CssClass="error" ErrorMessage="Ingrese un Legajo Valido" ForeColor="Red" ValidationGroup="2" ControlToValidate="txtMedico" OnServerValidate="cvMed_ServerValidate"></asp:CustomValidator>
                    <asp:Button ID="btnMed" runat="server" OnClick="btnMed_Click" Text="Buscar" ValidationGroup="2" />
                </asp:Panel>
                <asp:Panel ID="panelEspecialidad" runat="server" Visible="False">
                    <asp:Label ID="labelEspecialidad" runat="server" Text="Buscar por Especialidad"></asp:Label>
                    <asp:DropDownList ID="ddlEspecialidad" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad"
                    ErrorMessage="Seleccione una Especialidad" ForeColor="Red" ValidationGroup="3" CssClass="error" InitialValue="0" />
                    <asp:Button ID="btnEspecialidad" runat="server" OnClick="btnEspecialidad_Click" Text="Buscar" ValidationGroup="3" />
                </asp:Panel>
                <asp:Panel ID="panelFecha" runat="server" style="width: 793px; margin-top: 0px" Visible="False">
                    <asp:Label ID="labelFecha" runat="server" Text="Buscar por Fecha"></asp:Label>
                    <asp:TextBox ID="txtFecha" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="txtFecha" CssClass="error" Display="Dynamic" ErrorMessage="Seleccione una Fecha" ValidationGroup="4"></asp:RequiredFieldValidator>
                    <asp:Button ID="btnFecha" runat="server" Text="Buscar" ValidationGroup="4" OnClick="btnFecha_Click" />
                </asp:Panel>
                <asp:Panel ID="panelEstado" runat="server" Visible="False">
                    <asp:Label ID="labelEstado" runat="server" Text="Buscar por Estado"></asp:Label>
                    <asp:DropDownList ID="ddlEstado" runat="server">
                        <asp:ListItem Value="0">--Seleccione un Estado--</asp:ListItem>
                        <asp:ListItem>Pendiente</asp:ListItem>
                        <asp:ListItem>Presente</asp:ListItem>
                        <asp:ListItem>Ausente</asp:ListItem>
                        <asp:ListItem>Cancelado</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvEstado" runat="server" ControlToValidate="ddlEstado"
                    ErrorMessage="Seleccione un Estado" ForeColor="Red" ValidationGroup="5" CssClass="error" InitialValue="0" />
                    <asp:Button ID="btnEstado" runat="server" Text="Buscar" ValidationGroup="5" OnClick="btnEstado_Click" />
                </asp:Panel>
            </div>

           <asp:GridView ID="gvTurnos" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="Medico" HeaderText="Medico" />
                    <asp:BoundField DataField="Legajo" HeaderText="Legajo Medico" />
                    <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" />
                    <asp:BoundField DataField="Paciente" HeaderText="Paciente" />
                    <asp:BoundField DataField="DniPaciente" HeaderText="DNI Paciente" />
                    <asp:BoundField DataField="Dia" HeaderText="Dia" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                    <asp:BoundField DataField="Hora" HeaderText="Hora" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" />
                </Columns>
            </asp:GridView>
        </div>

            <div class="footer">
                <asp:Button ID="CerrarBtn" runat="server" Text="Cerrar Sesión" />
                &nbsp;&nbsp;
                <asp:HyperLink ID="hyperlinkVolver" runat="server" NavigateUrl="~/Admin_Turnos.aspx">Volver</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
