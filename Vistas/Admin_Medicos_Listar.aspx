<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Medicos_Listar.aspx.cs" Inherits="Vistas.Admin_Medicos_Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
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

        .lista-container{

           background-color: #F6F6F6;
           width: 100vw;
           height: 20vh;
           min-height: 30vh;
           display: flex;
           justify-content: center;
           padding: 10px 20px;
           gap: 10px;

         }

        #Button1 {
            padding: 10px 16px;
            background-color: #8aaeea;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 14px;
            cursor: pointer;

        }

    </style>
    <form id="form1" runat="server">
        <div class ="container-1">
              <asp:Label ID="tipoUsuario" runat="server" Text="tipoUsuario"></asp:Label>
                        <asp:Label ID="nombreUsuario" runat="server" Text="lblNombreUsuario"></asp:Label>
        </div>
           <div class ="lista-container">
                        <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Médicos"></asp:Label>
               <asp:Label ID="Label20" runat="server" Text="Ingrese el legajo del medico:"></asp:Label>
            <asp:TextBox ID="txtBuscar" runat="server" Width="203px"></asp:TextBox>
            
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" />

            &nbsp;<asp:RequiredFieldValidator ID="rfvBuscar" runat="server" ControlToValidate="txtBuscar" ErrorMessage="* Ingrese un legajo" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtBuscar" ErrorMessage="* Solo se permiten valores numericos" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lblMensajeError" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:GridView ID="gvMedico" runat="server" Height="265px" Width="971px">
                        </asp:GridView>
               </div>
        <div class ="container-3">
               <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Volver</asp:HyperLink> 
        </div>
    </form>
</body>
</html>
