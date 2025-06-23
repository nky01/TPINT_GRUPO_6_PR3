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
    public partial class AdminVista : System.Web.UI.Page
    {
        NegocioClinica negocio = new NegocioClinica();
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuarios usuario = Session["usuario"] as Usuarios;
            if (!negocio.CheckLogin(usuario, "Administrador"))
            {
                Response.Redirect("Login.aspx");
            }
            tipoUsuario.Text = usuario.getRol();
            nombreUsuario.Text = usuario.getNombre();
        }

        protected void PacientesBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Pacientes.aspx");
        }

        protected void MedicosBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Medicos.aspx");
        }

        protected void CerrarBtn_Click(object sender, EventArgs e)
        {

        }

        protected void TurnosBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Turnos.aspx");
        }
    }
}