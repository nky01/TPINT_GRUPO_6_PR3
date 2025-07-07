using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

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
            panelNombre.Visible = false;
            lblMensaje.Visible = false;



            switch (ddlOpcionesFiltro.SelectedValue)
            {
                case "Vacio":
                    break;
                case "ID":
                    panelID.Visible = true;
                    panelPaciente.Visible = false;
                    panelMedico.Visible = false;
                    panelEspecialidad.Visible = false;
                    panelFecha.Visible = false;
                    panelEstado.Visible = false;
                    break;
                case "Paciente":
                    panelID.Visible = false;
                    panelPaciente.Visible = true;
                    panelMedico.Visible = false;
                    panelEspecialidad.Visible = false;
                    panelFecha.Visible = false;
                    panelEstado.Visible = false;
                    break;
                case "Medico":
                    panelID.Visible = false;
                    panelPaciente.Visible = false;
                    panelMedico.Visible = true;
                    panelEspecialidad.Visible = false;
                    panelFecha.Visible = false;
                    panelEstado.Visible = false;
                    break;
                case "Especialidad":
                    panelID.Visible = false;
                    panelPaciente.Visible = false;
                    panelMedico.Visible = false;
                    panelEspecialidad.Visible = true;
                    panelFecha.Visible = false;
                    panelEstado.Visible = false;
                    break;
                case "Fecha":
                    panelID.Visible = false;
                    panelPaciente.Visible = false;
                    panelMedico.Visible = false;
                    panelEspecialidad.Visible = false;
                    panelFecha.Visible = true;
                    panelEstado.Visible = false;
                    break;
                case "Estado":
                    panelID.Visible = false;
                    panelPaciente.Visible = false;
                    panelMedico.Visible = false;
                    panelEspecialidad.Visible = false;
                    panelFecha.Visible = false;
                    panelEstado.Visible = true;
                    break;
                case "Nombre":
                    panelID.Visible = false;
                    panelPaciente.Visible = false;
                    panelMedico.Visible = false;
                    panelEspecialidad.Visible = false;
                    panelFecha.Visible = false;
                    panelEstado.Visible = false;
                    panelNombre.Visible = true;
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
            txtID.Text = "";
        }

        protected void btnDNIPac_Click(object sender, EventArgs e)
        {
            if (!negocio.existePacientePorDni(txtPaciente.Text.Trim()))
            {
                lblMensaje.Text = "No existe el paciente";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                lblMensaje.Visible = true;
                return;
            }
            ObtenerTurnosFiltro(txtPaciente.Text.Trim());
            txtPaciente.Text = "";
            lblMensaje.Visible = false;
        }

        protected void btnMed_Click(object sender, EventArgs e)
        {
            ObtenerTurnosFiltro(txtMedico.Text.Trim());
            txtMedico.Text = "";
        }

        protected void btnEspecialidad_Click(object sender, EventArgs e)
        {
            string idEspecialidad = ddlEspecialidad.SelectedValue;


            DataTable table = negocio.GetTurnosFiltro("Especialidad", idEspecialidad);
            
            if(table.Rows.Count == 0)
            {
                gvTurnos.DataSource = null;
                gvTurnos.DataBind();
                lblMensaje.Text = "no existen turnos con esa Especialidad";
                lblMensaje.Visible = true;
            }
            else
            {
                gvTurnos.DataSource = table;
                gvTurnos.DataBind();
                lblMensaje.Visible = false;
            }
            ddlEspecialidad.SelectedIndex = 0;
        }

        protected void btnFecha_Click(object sender, EventArgs e)
        {
            DataTable tabla = negocio.GetTurnosFiltro("Fecha", txtFecha.Text.Trim());
            if(tabla.Rows.Count == 0)
            {
                gvTurnos.DataSource = null;
                gvTurnos.DataBind();
                lblMensaje.Text = "no existen turnos en esa fecha";
                lblMensaje.Visible = true;
            }
            else
            {
                gvTurnos.DataSource = tabla;
                gvTurnos.DataBind();
                lblMensaje.Visible = false;
            }

            txtFecha.Text = "";
        }
        protected void btnEstado_Click(object sender, EventArgs e)
        {
            ObtenerTurnosFiltro(ddlEstado.SelectedValue);
            ddlEstado.SelectedIndex = 0;
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
            if (!negocio.existeTurnoPaciente(txtNombre.Text.Trim()))
            {
                gvTurnos.DataSource = null;
                gvTurnos.DataBind();
                lblMensaje.Text = "no existe este paciente";
                lblMensaje.Visible = true;
                return;
            }
           gvTurnos.DataSource = negocio.GetTurnosPorNombre(txtNombre.Text.Trim());
           gvTurnos.DataBind();
        }

        protected void CerrarBtn_Click(object sender, EventArgs e)
        {
            Session["usuario"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}