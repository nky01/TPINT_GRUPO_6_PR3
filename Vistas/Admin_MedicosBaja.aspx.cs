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
	public partial class BajaMedicos : System.Web.UI.Page
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

        protected void btnBaja_Click(object sender, EventArgs e)
        {
            NegocioClinica negocio = new NegocioClinica();
            bool resultado = negocio.BajaMedicoPorLegajo(textboxLegajo.Text);
            lblExito.Visible = false;

            if (resultado)
            {
                textboxLegajo.Text = string.Empty;
                lblExito.Text = "Medico dado de baja correctamente.";
                lblExito.Visible = true;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Pacientes.aspx");
        }

        protected void CerrarBtn_Click(object sender, EventArgs e)
        {
            Session["usuario"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}