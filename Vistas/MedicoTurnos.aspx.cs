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
    public partial class MedicoTurnos : System.Web.UI.Page
    {

        NegocioClinica negocio = new NegocioClinica();
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuarios usuario = Session["usuario"] as Usuarios;

            if (!negocio.CheckLogin(usuario, "Medico"))
            {
                Response.Redirect("Login.aspx");
                return;
            }

            tipoUsuario.Text = usuario.getRol();

            if (!IsPostBack)
            {
                Medico medico = negocio.GetMedicoPorUsuarioNombre(usuario.getNombre());
                nombreUsuario.Text = medico.getNombre();

                if (medico != null)
                {
                    CargarTurnosDelMedico(medico.getLegajo());
                }
                else
                {
                    lblMsj.Text = "No tiene turnos";
                }
            }
        }

        private void CargarTurnosDelMedico(string legajoMedico)
        {
            NegocioClinica negocio = new NegocioClinica();
            DataTable dt = negocio.ObtenerTurnosPorMedico(legajoMedico);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
       
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("MedicoVista.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (ddlEstados.SelectedValue)
            {
                case "0":
                    panelCodigoTurno.Visible = false;
                    panelDni.Visible = false;
                    panelEstado.Visible = false;
                    break;
                case "1":
                    panelDni.Visible = true;
                    panelCodigoTurno.Visible = false;
                    panelEstado.Visible = false;
                    break;
                case "2":
                    panelCodigoTurno.Visible = true;
                    panelDni.Visible = false;
                    panelEstado.Visible = false;
                    break;
                case "3":
                    panelEstado.Visible = true;
                    panelCodigoTurno.Visible = false;
                    panelDni.Visible = false;
                    break;

            }


        }

        

    }
}