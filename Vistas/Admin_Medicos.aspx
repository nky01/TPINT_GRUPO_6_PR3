<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Medicos.aspx.cs" Inherits="Vistas.Admin_Medicos" %>

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
            padding: 10px 20px;
        }

         
        .container-1 {
            background-color: #8aaeea;
            color: white;
            font-weight: bold;
        }

         .container-3 {
            background-color: #e9ecef;
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 20px;
         gap: 10px;
        }
         .medic-container{
             width: 100vw;
             height: 85vh;
             display: flex;
             flex-direction: column;
             align-items: center;
             justify-content: center;

         }
         .medic-btn {
            width: 30%;
            padding: 12px;
            background-color:  #8aaeea;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            margin-top: 15px;
            cursor: pointer;
        }

        .container-3-btn {
            padding: 10px 16px;
            background-color:  #8aaeea;
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
         <div class="container-1">
                        <asp:Label ID="tipoUsuario" runat="server" Text="tipoUsuario"></asp:Label>
                         <asp:Label ID="nombreUsuario" runat="server" Text="lblNombreUsuario"></asp:Label>
             </div>
        <div class ="medic-container">
                         <asp:Button ID="buttonAltaMedicos" runat="server" Text="Alta" CssClass="medic-btn" />
                         <asp:Button ID="buttonBajaMedicos" runat="server" Text="Baja" CssClass="medic-btn" />
                         <asp:Button ID="btnModificarMedicos" runat="server" Text="Modificar" CssClass="medic-btn" />
                         <asp:Button ID="btnListadoMedicos" runat="server" Text="Listado" CssClass="medic-btn" />
        </div>
        <div class ="container-3">
            <asp:Button ID="CerrarBtn" runat="server" Text="Cerrar Sesión"  CssClass="container-3-btn"/>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Volver</asp:HyperLink>
        </div>
    </form>
</body>
</html>
