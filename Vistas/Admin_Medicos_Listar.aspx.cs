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
            if (!IsPostBack)
            {
                CargarMedicos();
            }
        }

        private void CargarMedicos()
        {
            NegocioClinica negocioClinica = new NegocioClinica();
            DataTable dt = negocioClinica.GetMedicos();

            gvMedico.DataSource = dt;
            gvMedico.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            NegocioClinica negocioClinica = new NegocioClinica();
            string legajo = txtBuscar.Text.Trim();

            DataTable dt = negocioClinica.GetMedicosPorLegajo(legajo);

            if (dt.Rows.Count > 0)
            {
                gvMedico.DataSource = dt;
                gvMedico.DataBind();
                lblMensajeError.Text = "";
            }
            else
            {
                gvMedico.DataSource = null;
                gvMedico.DataBind();
                lblMensajeError.Text = "No se encontró ningun medico con ese legajo";
            }
        }

        protected void gvMedico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMedico.PageIndex = e.NewPageIndex;
            CargarMedicos();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            txtBuscar.Text = string.Empty;
            CargarMedicos();
        }
    }
}