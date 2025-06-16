<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Turnos_Alta.aspx.cs" Inherits="Vistas.Admin_Turnos_Alta" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
        <div class ="container-1">
            <asp:Label ID="Label1" runat="server" Text="tipoUsuario"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="lblNombreUsuario"></asp:Label>
            </div>
          <div class="alta-container">
              <div class="columna">
                  Seleccione Especialidad:
            <asp:DropDownList ID="ddlEspecialidad" runat="server" Width="151px"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RfvEspecialidad" runat="server" ControlToValidate="ddlEspecialidad" ErrorMessage="Por favor seleccione una especialidad." ForeColor="Red" />

            Seleccione Médico:
            <asp:DropDownList ID="ddlMedicos" runat="server" Width="150px"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvMedicos" runat="server" ControlToValidate="ddlMedicos" ErrorMessage="Por favor seleccione un médico." ForeColor="Red" />

            DNI del Paciente:
            <asp:TextBox ID="txtPaciente" runat="server" Width="143px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPaciente" runat="server" ControlToValidate="txtPaciente" ErrorMessage="Por favor escriba el DNI del paciente." ForeColor="Red" />
              </div>
            <div class="columna">
                    Seleccione Fecha:
            <asp:DropDownList ID="ddlFecha" runat="server" Width="152px"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="ddlFecha" ErrorMessage="Por favor seleccione una fecha." ForeColor="Red" />
            Seleccione Día:
            <asp:DropDownList ID="ddlDia" runat="server" Width="152px"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvDia" runat="server" ControlToValidate="ddlDia" ErrorMessage="Por favor seleccione un día." ForeColor="Red" />
            Seleccione Hora:
            <asp:DropDownList ID="ddlHora" runat="server" Width="152px"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvHora" runat="server" ControlToValidate="ddlHora" ErrorMessage="Por favor seleccione una hora." ForeColor="Red" />
            </div>
            </div>
        
        <div class="container-3">
             <asp:Button ID="CerrarBtn" runat="server" Text="Cerrar Sesión" CssClass="container-3-btn"/>
            <asp:Button ID="AltaTurnoBtn" runat="server" Text="Generar Turno" OnClientClick="return confirm('¿Estás seguro que quieres generar este turno?');" CssClass="container-3-btn" />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin_Turnos.aspx">Volver</asp:HyperLink>
        </div>
    </form>
</body>
</html>
