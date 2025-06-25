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
    public partial class Admin_Medicos : System.Web.UI.Page
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

        protected void buttonAltaMedicos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Medicos_Alta.aspx");
        }

        protected void buttonBajaMedicos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_MedicosBaja.aspx");
        }

        protected void btnModificarMedicos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Medicos_Modificar.aspx");
        }

        protected void btnListadoMedicos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Medicos_Listar.aspx");
        }

        protected void CerrarBtn_Click(object sender, EventArgs e)
        {
            Session["usuario"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}