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
    public partial class Admin_Turnos_Baja : System.Web.UI.Page
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

        protected void cancelarTurnoBtn_Click(object sender, EventArgs e)
        {
           int filasAfectadas = negocio.BajaTurno(Convert.ToInt32(txtID.Text));
            if (filasAfectadas > 0)
            {
                lblmensaje.ForeColor = System.Drawing.Color.Green;
                lblmensaje.Text = "El turno fue dado de baja correctamente";
            }
            else
            {
                lblmensaje.ForeColor = System.Drawing.Color.Red;
                lblmensaje.Text = "Error al dar de baja el turno";
            }
        }
    }
}