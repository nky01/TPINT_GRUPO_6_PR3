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

        private void LimpiarCampos()
        {
            txtBusqueda.Text = string.Empty;
            textboxNombre.Text = string.Empty;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            NegocioClinica negocioClinica = new NegocioClinica();
            lblNombreError.Visible = false;

            if (txtBusqueda.Text == string.Empty)
            {
                CargarPacientes();
                lblPacienteNotFound.Visible = false;
                return;
            }
            if(!negocioClinica.existePaciente(txtBusqueda.Text.Trim()))
            {
                lblPacienteNotFound.Visible = true;
                return;
            }
            gridviewPacientes.DataSource = negocioClinica.GetPaciente(txtBusqueda.Text.Trim());
            gridviewPacientes.DataBind();
            LimpiarCampos();
            lblPacienteNotFound.Visible = false;
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

        protected void gridviewPacientes_SelectedIndexChanged(EventArgs e)
        {

        }

        protected void buttonBuscarNombre_Click(object sender, EventArgs e)
        {
            NegocioClinica negocio = new NegocioClinica();
            gridviewPacientes.DataSource = negocio.GetPacientesPorNombre(textboxNombre.Text.Trim());
            gridviewPacientes.DataBind();
            lblNombreError.Visible = false;


            if (!(gridviewPacientes.Rows.Count >= 1))
            {
                lblNombreError.Visible = true;
            }
            else
            {
                LimpiarCampos();
            }
            
        }

        protected void gridviewPacientes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}