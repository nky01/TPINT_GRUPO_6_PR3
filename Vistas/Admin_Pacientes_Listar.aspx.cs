using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class ListarPaciente : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                CargarPacientes();
            }
        }
        private void CargarPacientes()
        {
            NegocioClinica negocioClinica = new NegocioClinica();
            gridviewPacientes.DataSource = negocioClinica.GetPacientes();
            gridviewPacientes.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            NegocioClinica negocioClinica = new NegocioClinica();
            if(txtBusqueda.Text == string.Empty)
            {
                CargarPacientes();
                return;
            }
            gridviewPacientes.DataSource = negocioClinica.GetPaciente(txtBusqueda.Text);
            gridviewPacientes.DataBind();
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