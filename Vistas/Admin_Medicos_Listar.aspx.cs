using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class Admin_Medicos_Listado : System.Web.UI.Page
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
                CargarMedicos();
                CargarTodosLosHorarios();
            }
        }

        private void CargarMedicos()
        {
            NegocioClinica negocioClinica = new NegocioClinica();
            DataTable dt = negocioClinica.GetMedicos();

            gvMedico.DataSource = dt;
            gvMedico.DataBind();
        }
        private void CargarTodosLosHorarios()
        {
            NegocioClinica negocio = new NegocioClinica();
            DataTable dt = negocio.GetTodosLosHorarios();

            if (dt != null && dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                lblMensajeError.Text = "No hay horarios para mostrar.";
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            NegocioClinica negocioClinica = new NegocioClinica();
            string legajo = txtBuscar.Text.Trim();

            DataTable dtMedicos = negocioClinica.GetMedicosPorLegajo(legajo);
            DataTable dtHorarios = negocioClinica.GetHorariosPorMedico(legajo);

            if (dtMedicos.Rows.Count > 0)
            {
                gvMedico.DataSource = dtMedicos;
                gvMedico.DataBind();
                lblMensajeError.Text = "";

                if (dtHorarios.Rows.Count > 0)
                {
                    GridView1.DataSource = dtHorarios;
                    GridView1.DataBind();
                }
                else
                {
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                    lblMensajeError.Text = "No se encontraron horarios para ese médico.";
                }
            }
            else
            {
                gvMedico.DataSource = null;
                gvMedico.DataBind();
                GridView1.DataSource = null;
                GridView1.DataBind();
                lblMensajeError.Text = "No se encontró ningún médico con ese legajo";
            }
        }


        protected void gvMedico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMedico.PageIndex = e.NewPageIndex;
            CargarMedicos();

            GridView1.DataSource = null;
            GridView1.DataBind();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            txtBuscar.Text = string.Empty;

            CargarMedicos();

            NegocioClinica negocioClinica = new NegocioClinica();
            DataTable dtHorarios = negocioClinica.GetTodosLosHorarios();

            GridView1.DataSource = dtHorarios;
            GridView1.DataBind();

            lblMensajeError.Text = string.Empty;
        }

        protected void gvMedico_SelectedIndexChanged(object sender, EventArgs e)
        {
            string legajoSeleccionado = gvMedico.SelectedRow.Cells[0].Text;
            CargarHorarios(legajoSeleccionado);
        }

        private void CargarHorarios(string legajo)
        {
            NegocioClinica negocioClinica = new NegocioClinica();
            DataTable dtHorarios = negocioClinica.GetHorariosPorMedico(legajo);

            if (dtHorarios.Rows.Count > 0)
            {
                GridView1.DataSource = dtHorarios;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }

        protected void gvMedico_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

    }
}