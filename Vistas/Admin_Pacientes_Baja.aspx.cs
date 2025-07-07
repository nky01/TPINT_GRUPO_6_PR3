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
    public partial class BajaPaciente : System.Web.UI.Page
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
            NegocioClinica neg = new NegocioClinica();
            if (!neg.existePaciente(txtDni.Text.Trim()))
            {
                lblExito.Visible = true;
                lblExito.Text = "No existe un paciente con ese DNI o ya fue dado de baja!";
                lblExito.ForeColor = System.Drawing.Color.Green;
                return;
            }
            bool resultado = neg.BajaPacienteDNI(txtDni.Text.Trim());
            lblExito.Visible = false;
            if(resultado)
            {
                txtDni.Text = string.Empty;
                lblExito.Visible = true;
                lblExito.Text = "Se a dado de baja exitosamente!";
                lblExito.ForeColor = System.Drawing.Color.Green;
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