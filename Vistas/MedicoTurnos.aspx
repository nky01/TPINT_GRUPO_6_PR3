<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicoTurnos.aspx.cs" Inherits="Vistas.MedicoTurnos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Gestión de Turnos - Médico</title>
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
            padding: 20px;
            background-color: white;
            margin: 30px auto;
            width: 90%;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .filter-section {
            margin-bottom: 20px;
        }

        .filter-section label {
            font-weight: bold;
            margin-right: 10px;
        }

        .panel-inputs {
            margin-bottom: 20px;
        }

        .grid-container {
            margin-top: 30px;
        }

        .btn-volver {
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <div><asp:Label ID="Label1" runat="server" Text="tipoUsuario"></asp:Label></div>
            <div><asp:Label ID="Label2" runat="server" Text="lblNombreUsuario"></asp:Label></div>
        </div>

        <div class="container">
            <div class="filter-section">
                <asp:Label ID="Label3" runat="server" Text="Buscar turno por: "></asp:Label>
                <asp:DropDownList ID="ddlFiltros" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="0">Seleccione un filtro</asp:ListItem>
                    <asp:ListItem Value="1">DNI Paciente</asp:ListItem>
                    <asp:ListItem Value="2">Código Turno</asp:ListItem>
                    <asp:ListItem Value="3">Estado del Turno</asp:ListItem>
                    <asp:ListItem Value="4">Observación Cargada</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="panel-inputs">
                <asp:Panel ID="panelDni" runat="server" Visible="false">
                    <label>Ingrese DNI del paciente:</label>
                    <asp:TextBox ID="txtDni" runat="server" MaxLength="8"/>
                    <asp:Button ID="btnBuscarPanel1" runat="server" Text="Buscar" />
                    <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtDni" ErrorMessage="Ingrese un DNI para buscar." ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:Panel>

                <asp:Panel ID="panelCodigoTurno" runat="server" Visible="false">
                    <label>Ingrese el Código de Turno:</label>
                    <asp:TextBox ID="txtCodigoTurno" runat="server" />
                    <asp:Button ID="btnBuscarPanel2" runat="server" Text="Buscar" />
                    <asp:RequiredFieldValidator ID="rfvCodigo" runat="server" ControlToValidate="txtCodigoTurno" ErrorMessage="Ingrese un código para buscar." ForeColor="Red"></asp:RequiredFieldValidator>
                </asp:Panel>

                <asp:Panel ID="panelEstado" runat="server" Visible="false">
                    <label>Seleccione un estado:</label>
                    <asp:DropDownList ID="ddlEstados" runat="server">
                        <asp:ListItem Value="0">Seleccione un estado</asp:ListItem>
                        <asp:ListItem Value="1">Ausente</asp:ListItem>
                        <asp:ListItem Value="2">Presente</asp:ListItem>
                        <asp:ListItem Value="3">Pendiente</asp:ListItem>
                    </asp:DropDownList>
                </asp:Panel>
            </div>

            <div class="grid-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" Height="175px" Width="825px">
                    <Columns>
                        <asp:BoundField DataField="CodigoTurno" HeaderText="Turno" />
                        <asp:BoundField DataField="DniPaciente" HeaderText="DNI Paciente" />
                        <asp:BoundField DataField="Hora" HeaderText="Hora" />
                        <asp:BoundField DataField="Dia" HeaderText="Día" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                        <asp:BoundField DataField="Observacion" HeaderText="Observación" />
                    </Columns>
                </asp:GridView>
            </div>

                 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Volver</asp:HyperLink> 
        </div>
    </form>
</body>
</html>
