﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vistas.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login - Grupo Médico</title>
    <style>
        * {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #F6F6F6;
        }

        body {
            background-color: #F6F6F6;
            width: 100vw;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .login-container {
            padding: 40px;
            width: 400px;
            text-align: center;
            margin-top: 60px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.15);
        }

        .login-container img.logo {
            width: 100px;
            margin-bottom: 20px;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .input-txt {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin: 10px 0;
        }

        .login-btn {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            margin-top: 15px;
            cursor: pointer;
        }

        .login-btn:hover {
            background-color: #0056b3;
        }

        .link {
            display: block;
            margin-top: 15px;
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
        }

        .link:hover {
            text-decoration: underline;
        }

        .error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <img class="logo" src="MiraeLogo.png" alt="Logo Mirae" />
            <h2>Mirae Clinica Integral</h2>

            <asp:TextBox ID="txtboxUser" runat="server" CssClass="input-txt" placeholder="DNI"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtboxUser" ErrorMessage="Ingrese su usuario!" ForeColor="Red" Display="Dynamic" />

            <asp:TextBox ID="txtboxPassword" runat="server" TextMode="Password" CssClass="input-txt" placeholder="CONTRASEÑA"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtboxPassword" ErrorMessage="Ingrese su contraseña!" ForeColor="Red" Display="Dynamic" />

            <asp:Button ID="btnIngresar" runat="server" Text="Iniciar sesión" CssClass="login-btn" />

            <asp:Label ID="lblErrorLogin" runat="server" ForeColor="Red" CssClass="error" Text="Usuario o contraseña incorrectos!" Visible="False"></asp:Label>

            <a class="link" href="#">¿Ha olvidado su contraseña?</a>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RegistrarCuenta.aspx" CssClass="link">Crear nuevo usuario</asp:HyperLink>
        </div>
    </form>
</body>
</html>
