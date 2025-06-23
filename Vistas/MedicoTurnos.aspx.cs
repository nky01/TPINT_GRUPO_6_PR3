using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class MedicoTurnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioClinica negocio = new NegocioClinica();
            Usuarios usuario = Session["usuario"] as Usuarios;
            if (!negocio.CheckLogin(usuario, "Medico"))
            {
                Response.Redirect("Login.aspx");
            }
            tipoUsuario.Text = usuario.getRol();
            nombreUsuario.Text = usuario.getNombre();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("MedicoVista.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {


            switch (ddlFiltros.SelectedValue)
            {
                case "0":
                    panelCodigoTurno.Visible = false;
                    panelDni.Visible = false;
                    panelEstado.Visible = false;
                    break;
                case "1":
                    panelDni.Visible = true;
                    panelCodigoTurno.Visible = false;
                    panelEstado.Visible = false;
                    break;
                case "2":
                    panelCodigoTurno.Visible = true;
                    panelDni.Visible = false;
                    panelEstado.Visible = false;
                    break;
                case "3":
                    panelEstado.Visible = true;
                    panelCodigoTurno.Visible = false;
                    panelDni.Visible = false;
                    break;

            }
        }
    }
}