<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Informes.aspx.cs" Inherits="Vistas.Admin_Informes" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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

.chart-container {
    width: 400px;
    height: 400px;
    margin: 40px auto;
    position: relative;
    background-color: #ffffff;
    border: 2px dashed #ccc;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.chart-placeholder {
    position: absolute;
    color: #999;
    font-size: 18px;
    font-style: italic;
    text-align: center;
    pointer-events: none;
}

 .grid-container {
            margin-top: 30px;
        }

 .tabla {
    width: 50%;
    margin: 0 auto;
    border-collapse: collapse;
    text-align: center;
    background-color: white;
    border: 1px solid #ccc;
}

.tabla th {
    background-color: #8aaeea;
    color: white;
    padding: 10px;
    border: 1px solid #ccc;
}

.tabla td {
    padding: 10px;
    border: 1px solid #ccc;
}

.tabla td[colspan] {
    color: #999;
    font-style: italic;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class ="header">
            <asp:Label ID="Label1" runat="server" Text="tipoUsuario"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="lblNombreUsuario"></asp:Label>
        </div>
       <div class="container">
    <div class="filter-section">
        <asp:Label ID="lblInforme" runat="server" Text="Seleccione el informe a generar:"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" Height="22px" Width="180px">
            <asp:ListItem>Enero-Febrero 2025</asp:ListItem>
            <asp:ListItem>Marzo-Abril 2025</asp:ListItem>
        </asp:DropDownList>
    </div>
</div>
    <div class="chart-container">
        <asp:Chart ID="ChartAusencias" runat="server" Width="400px" Height="400px" />
        <div class="chart-placeholder">No hay datos para mostrar</div>
    </div>
 <div class="grid-container">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="No hay registros para mostrar." CssClass="tabla">
    <Columns>
        <asp:BoundField HeaderText="Ausentes" DataField="Ausentes" />
        <asp:BoundField HeaderText="Presentes" DataField="Presentes" />
    </Columns>
</asp:GridView>
</div>
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Volver</asp:HyperLink> 
    </form>
</body>
</html>
