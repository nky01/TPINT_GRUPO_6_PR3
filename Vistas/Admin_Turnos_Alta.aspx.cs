using Entidades;
using Negocio;
using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class Admin_Turnos_Alta : System.Web.UI.Page
    {
        NegocioClinica neg = new NegocioClinica();
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuarios usuario = Session["usuario"] as Usuarios;
            if (!neg.CheckLogin(usuario, "Administrador"))
            {
                Response.Redirect("Login.aspx");
            }
            tipoUsuario.Text = usuario.getRol();
            nombreUsuario.Text = usuario.getNombre();

            if (!IsPostBack)
            {
                CargarEspecialidad();
            }
        }

        protected void CargarEspecialidad()
        {
            var tabla = neg.ObtenerEspecialidades();
            ddlEspecialidad.DataSource = tabla;
            ddlEspecialidad.DataTextField = "Descripcion_Especialidad";
            ddlEspecialidad.DataValueField = "Id_Especialidad";
            ddlEspecialidad.DataBind();

            ddlEspecialidad.Items.Insert(0, new ListItem("-- Seleccione una especialidad --", "0"));
        }

        protected void AltaTurnoBtn_Click(object sender, EventArgs e)
        {
            try
            {
                Turno turno = new Turno();
                turno.setId_Especialidad(Convert.ToInt32(ddlEspecialidad.SelectedValue));
                turno.setLegajo_Medico(ddlMedicos.SelectedValue);
                turno.setDNI_Paciente(txtPaciente.Text.Trim());
                turno.setDia(ddlDia.SelectedValue);
                turno.setFecha(Convert.ToDateTime(ddlFecha.SelectedValue));
                turno.setHora(ddlHora.SelectedValue);

                int resultado = neg.AgregarTurno(turno);

                if (resultado > 0)
                {
                    lblMensaje.ForeColor = System.Drawing.Color.Green;
                    lblMensaje.Text = "El turno ha sido generado correctamente!";
                }
                else
                {
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    lblMensaje.Text = "Error al generar el turno";
                }
            }
            catch (Exception ex)
            {
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                lblMensaje.Text = "Se genero un error";
            }
        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idEspecialidad = Convert.ToInt32(ddlEspecialidad.SelectedValue);
            if (idEspecialidad > 0)
            {
                CargarMedicoPorEspecialidad(idEspecialidad);
            }
            else
            {
                ddlMedicos.Items.Clear();
                ddlMedicos.Items.Insert(0, new ListItem("-- Seleccione un medico --", "0"));
            }
        }

        private void CargarMedicoPorEspecialidad(int idEspecialidad)
        {
            ddlMedicos.DataSource = neg.GetMedicosPorEspecialidad(idEspecialidad);
            ddlMedicos.DataTextField = "NombreCompleto";
            ddlMedicos.DataValueField = "Legajo_Medico";
            ddlMedicos.DataBind();

            ddlMedicos.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
        }

        protected void CerrarBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
