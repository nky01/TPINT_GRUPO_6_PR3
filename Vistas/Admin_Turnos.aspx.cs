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
    public partial class Admin_Turnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioClinica negocio = new NegocioClinica();
            Usuarios usuario = Session["usuario"] as Usuarios;
            if (!negocio.CheckLogin(usuario, "Administrador"))
            {
                Response.Redirect("Login.aspx");
            }
            tipoUsuario.Text = usuario.getRol();
            nombreUsuario.Text = usuario.getNombre();
        }

        protected void AltaTurnosBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Turnos_Alta.aspx");
        }

        protected void BajaTurnosBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Turnos_Baja.aspx");
        }

        protected void ListaTurnosBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Turnos_Listado.aspx");
        }
    }
}