<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Turnos_Alta.aspx.cs" Inherits="Vistas.Admin_Turnos_Alta" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Generar Turno</title>
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

        .container-1 {
            background-color: #8aaeea;
            color: white;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            width: 100vw;
            padding: 10px 20px;
        }

        .container-2 {
            background-color: #ffffff;
            width: 70%;
            height: 70vh;
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 40px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            align-items: center;
            margin: 40px auto;
        }

        .columna {
            width: 45%;
            display: flex;
            flex-direction: column;
        }

        .columna > * {
            margin-bottom: 10px;
        }


        .container-3 {
            display: flex;
            justify-content: space-around;
            align-items: center;
            width: 100%;
            padding: 15px 0;
        }

        .container-3-btn {
            padding: 10px 16px;
            background-color: #8aaeea;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 14px;
            cursor: pointer;
        }

        .aspNet-validators {
            color: #CC0000;
            font-size: 13px;
            margin-top: -5px;
            margin-bottom: 10px;
        }

        select, input[type="text"] {
            padding: 5px;
            width: 150px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-1">
            <asp:Label ID="tipoUsuario" runat="server" Text="tipoUsuario"></asp:Label>
            <asp:Label ID="nombreUsuario" runat="server" Text="lblNombreUsuario"></asp:Label>
        </div>

        <div class="container-2">
            <h2>Generar Turno</h2>
            <div class="columna">
                <asp:Label runat="server" Text="Seleccione Especialidad:" />
                <asp:DropDownList ID="ddlEspecialidad" runat="server" />
                <asp:RequiredFieldValidator CssClass="aspNet-validators" ID="RfvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad" ErrorMessage="Por favor seleccione una especialidad." ForeColor="Red" />

                <asp:Label runat="server" Text="Seleccione Médico:" />
                <asp:DropDownList ID="ddlMedicos" runat="server" />
                <asp:RequiredFieldValidator CssClass="aspNet-validators" ID="rfvMedicos" runat="server" ControlToValidate="ddlMedicos" ErrorMessage="Por favor seleccione un médico." ForeColor="Red" />

                <asp:Label runat="server" Text="DNI del Paciente:" />
                <asp:TextBox ID="txtPaciente" runat="server" />
                <asp:RequiredFieldValidator CssClass="aspNet-validators" ID="rfvPaciente" runat="server" ControlToValidate="txtPaciente" ErrorMessage="Por favor escriba el DNI del paciente." ForeColor="Red" />
            </div>

            <div class="columna">
                <asp:Label runat="server" Text="Seleccione Fecha:" />
                <asp:DropDownList ID="ddlFecha" runat="server" />
                <asp:RequiredFieldValidator CssClass="aspNet-validators" ID="rfvFecha" runat="server" ControlToValidate="ddlFecha" ErrorMessage="Por favor seleccione una fecha." ForeColor="Red" />

                <asp:Label runat="server" Text="Seleccione Día:" />
                <asp:DropDownList ID="ddlDia" runat="server" />
                <asp:RequiredFieldValidator CssClass="aspNet-validators" ID="rfvDia" runat="server" ControlToValidate="ddlDia" ErrorMessage="Por favor seleccione un día." ForeColor="Red" />

                <asp:Label runat="server" Text="Seleccione Hora:" />
                <asp:DropDownList ID="ddlHora" runat="server" />
                <asp:RequiredFieldValidator CssClass="aspNet-validators" ID="rfvHora" runat="server" ControlToValidate="ddlHora" ErrorMessage="Por favor seleccione una hora." ForeColor="Red" />
            </div>
        </div>

        <div class="container-3">
            <asp:Button ID="CerrarBtn" runat="server" Text="Cerrar Sesión" CssClass="container-3-btn" />
            <asp:Button ID="AltaTurnoBtn" runat="server" Text="Generar Turno" OnClientClick="return confirm('¿Estás seguro que quieres generar este turno?');" CssClass="container-3-btn" />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin_Turnos.aspx">Volver</asp:HyperLink>
        </div>
    </form>
</body>
</html>
