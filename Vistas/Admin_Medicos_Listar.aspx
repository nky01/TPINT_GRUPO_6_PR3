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
          .container-1{
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
           height: 80vh;
           min-height: 30vh;
           padding: 10px 20px;
           gap: 10px;

         }

        #btnBuscar, #btnFiltro {
            padding: 10px 16px;
            background-color: #8aaeea;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 14px;
            cursor: pointer;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 14px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);            
        }

        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .gridview th {
            background-color: #8aaeea;
            color: white;
            font-weight: bold;
        }

        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .container-3 {
            width: 100vw;
            padding: 20px 70px;
            align-items: center;
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
            
            &nbsp;&nbsp; <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="Button1_Click" />

            &nbsp;&nbsp;&nbsp; <asp:Button ID="btnFiltro" runat="server" Text="Filtrar todo" OnClick="btnFiltrar_Click" />

            &nbsp;<br />
                        <asp:RequiredFieldValidator ID="rfvBuscar" runat="server" ControlToValidate="txtBuscar" ErrorMessage="* Ingrese un legajo" ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;<asp:Label ID="lblMensajeError" runat="server" ForeColor="Red"></asp:Label>
                        <br />
            
            <asp:GridView 
                ID="gvMedico" 
                runat="server" 
                CssClass="gridview"
                AllowPaging="True" 
                PageSize="10"
                AutoGenerateColumns="False" 
                OnPageIndexChanging="gvMedico_PageIndexChanging"
                PagerStyle-CssClass="pager">

                <Columns>
                    <asp:BoundField DataField="Legajo_Medico" HeaderText="Legajo" />
                    <asp:BoundField DataField="Nombre_Medico" HeaderText="Nombre" />
                    <asp:BoundField DataField="Apellido_Medico" HeaderText="Apellido" />
                    <asp:BoundField DataField="Sexo_Medico" HeaderText="Sexo" />
                    <asp:BoundField DataField="DNI_Medico" HeaderText="DNI" />
                    <asp:BoundField DataField="Nacionalidad_Medico" HeaderText="Nacionalidad" />
                    <asp:BoundField DataField="FechaNac_Medico" HeaderText="Fecha Nac." DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Direccion_Medico" HeaderText="Dirección" />
                    <asp:BoundField DataField="CorreoElectronico_Medico" HeaderText="Correo Electrónico" />
                    <asp:BoundField DataField="Telefono_Medico" HeaderText="Teléfono" />
                    <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" />
                    <asp:BoundField DataField="Localidad" HeaderText="Localidad" />
                    <asp:BoundField DataField="Provincia" HeaderText="Provincia" />
                </Columns>
            </asp:GridView>


                        <br />


               </div>
        <div class ="container-3">
               <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Volver</asp:HyperLink> 
        </div>
    </form>
</body>
</html>
