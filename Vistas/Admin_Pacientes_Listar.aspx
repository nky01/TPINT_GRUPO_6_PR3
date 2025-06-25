<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Pacientes_Listar.aspx.cs" Inherits="Vistas.ListarPaciente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
        align-items: center;
        padding: 10px 20px;
        width: 100%;
    }

    .container-1 {
        background-color: #8aaeea;
        color: white;
        font-weight: bold;
        height: 40px;
        width: 100vw;
        margin-bottom: 50px;
    }


    .search-row {
        display: flex;
        align-items: center;
        gap: 10px;
        flex-wrap: wrap;
    }

    #txtBusqueda {
        flex-grow: 1;
        padding: 8px 10px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[type="submit"], input[type="button"], button {
        background-color: #8aaeea;
        color: white;
        border: none;
        padding: 8px 16px;
        cursor: pointer;
        font-weight: bold;
        border-radius: 4px;
        min-width: 100px;
    }

    input[type="submit"]:hover, input[type="button"]:hover, button:hover {
        background-color: #3f4db7;
    }

    .container-2 {
        margin-left: 20px;
    }
        .auto-style1 {
            margin-bottom: 19;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class ="container-1">
            <asp:Label ID="tipoUsuario" runat="server" Text="tipoUsuario"></asp:Label>
            <asp:Label ID="nombreUsuario" runat="server" Text="lblNombreUsuario"></asp:Label>
            </div>
     <div class="container-2">
         <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="15pt" Text="Pacientes"></asp:Label>
           <asp:Label ID="Label4" runat="server" Text="Buscar por DNI:"></asp:Label>
           &nbsp;
           <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>
           &nbsp;
           <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" ValidationGroup="0" Width="100px" />
           <br />
           <br />
           <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txtBusqueda" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="0">Ingrese un dni</asp:RequiredFieldValidator>
           &nbsp;<asp:RegularExpressionValidator ID="rexvDni" runat="server" ControlToValidate="txtBusqueda" ForeColor="Red" ValidationExpression="^\d{7,8}$" ValidationGroup="0">Ingrese un dni valido</asp:RegularExpressionValidator>
           <br />
           <br />
           <asp:GridView ID="gridviewPacientes" runat="server" AutoGenerateColumns="True" CssClass="auto-style1" Height="231px" Width="954px">
               <Columns>
                </Columns>
           </asp:GridView>
     </div>
      
     <div class ="container-3">
               <asp:Button ID="CerrarBtn" runat="server" Text="Cerrar Sesión" />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin_Pacientes.aspx">Volver</asp:HyperLink>
     </div>
  
    </form>
</body>
</html>
