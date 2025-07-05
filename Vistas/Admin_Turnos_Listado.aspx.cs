using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class Admin_Turnos_Listado : System.Web.UI.Page
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

            CargarTurnosAll();
            if(!IsPostBack)
            {
                CargarEspecialidades();
            }
            
        }

        protected void btnAll_Click(object sender, EventArgs e)
        {
            CargarTurnosAll();
        }

        protected void CargarTurnosAll()
        {
            gvTurnos.DataSource = negocio.GetTablaTurnos();
            gvTurnos.DataBind();
        }

        protected void CargarEspecialidades()
        {
            ddlEspecialidad.DataSource = negocio.ObtenerEspecialidades();
            ddlEspecialidad.DataTextField = "Descripcion_Especialidad";
            ddlEspecialidad.DataValueField = "Id_Especialidad";
            ddlEspecialidad.DataBind();
            ddlEspecialidad.Items.Insert(0, new ListItem("--Seleccione una especialidad--", "0"));
        }

        protected void ddlOpcionesFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            panelID.Visible = false;
            panelPaciente.Visible = false;
            panelMedico.Visible = false;
            panelEspecialidad.Visible = false;
            panelFecha.Visible = false;
            panelEstado.Visible = false;

            switch(ddlOpcionesFiltro.SelectedValue)
            {
                case "Vacio":
                    break;
                case "ID":
                    panelID.Visible = true;
                    break;
                case "Paciente":
                    panelPaciente.Visible =true;
                    break;
                case "Medico":
                    panelMedico.Visible =true;
                    break;
                case "Especialidad":
                    panelEspecialidad.Visible=true;
                    break;
                case "Fecha":
                    panelFecha.Visible=true;
                    break;
                case "Estado":
                    panelEstado.Visible=true;
                    break;
                default:
                    break;
            }

        }

        protected void ObtenerTurnosFiltro(string valor)
        {
            gvTurnos.DataSource = negocio.GetTurnosFiltro(ddlOpcionesFiltro.SelectedValue, valor);
            gvTurnos.DataBind();
        }

        protected void btnID_Click(object sender, EventArgs e)
        {
            ObtenerTurnosFiltro(txtID.Text.Trim());
        }

        protected void btnDNIPac_Click(object sender, EventArgs e)
        {
            ObtenerTurnosFiltro(txtPaciente.Text.Trim());
        }

        protected void btnMed_Click(object sender, EventArgs e)
        {
            ObtenerTurnosFiltro(txtMedico.Text.Trim());
        }

        protected void btnEspecialidad_Click(object sender, EventArgs e)
        {
            ObtenerTurnosFiltro(ddlEspecialidad.SelectedValue);
        }

        protected void btnFecha_Click(object sender, EventArgs e)
        {
            ObtenerTurnosFiltro(txtFecha.Text.Trim());
        }
        protected void btnEstado_Click(object sender, EventArgs e)
        {
            ObtenerTurnosFiltro(ddlEstado.SelectedValue);
        }

        protected void cvID_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string idIngresado = args.Value.Trim();
            bool existeID = negocio.existeIdTurno(idIngresado);
            args.IsValid = existeID;
        }

        protected void cvDniPac_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string PacienteIngresado = args.Value.Trim();
            bool existeID = negocio.existePaciente(PacienteIngresado);
            args.IsValid = existeID;
        }

        protected void cvMed_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string MedicoIngresado = args.Value.Trim();
            bool existeID = negocio.existeMedico(MedicoIngresado);
            args.IsValid = existeID;
        }

        protected void btnNombre_Click(object sender, EventArgs e)
        {
            negocio.GetTurnosPorNombre(txtNombre.Text.Trim());
        }
    }
}