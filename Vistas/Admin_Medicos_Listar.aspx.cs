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
    public partial class Admin_Medicos_Listado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioClinica negocio = new NegocioClinica();
            //Usuarios usuario = Session["usuario"] as Usuarios;
            //if (!negocio.CheckLogin(usuario, "Administrador"))
            //{
            //    Response.Redirect("Login.aspx");
            //}
            //tipoUsuario.Text = usuario.getRol();
            //nombreUsuario.Text = usuario.getNombre();

            if (!IsPostBack)
            {
                CargarMedicos();
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
        }

        private void CargarMedicos()
        {
            NegocioClinica negocioClinica = new NegocioClinica();
           gvMedico.DataSource = negocioClinica.GetMedicos();
            gvMedico.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            NegocioClinica negocioClinica = new NegocioClinica();
            if (txtBuscar.Text == string.Empty)
            {
                CargarMedicos();
                return;
            }
            gvMedico.DataSource = negocioClinica.GetPaciente(txtBuscar.Text);
            gvMedico.DataBind();
        }
    }
}