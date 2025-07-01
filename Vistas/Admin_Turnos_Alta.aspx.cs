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
                DateTime fechaIngresada;

                if(DateTime.TryParse(txtFecha.Text, out fechaIngresada))
                {
                    if(fechaIngresada < DateTime.Today)
                    {
                        lblMensaje.Text = "No se pueden generar turnos en una fecha invalida";
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }
                else
                {
                    lblMensaje.Text = "ocurrio un error";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    return;
                }



                Turno turno = new Turno();
                turno.setId_Especialidad(Convert.ToInt32(ddlEspecialidad.SelectedValue));
                turno.setLegajo_Medico(ddlMedicos.SelectedValue);
                turno.setDNI_Paciente(txtPaciente.Text.Trim());
                string dia = fechaIngresada.ToString("dddd", new System.Globalization.CultureInfo("es-ES"));
                turno.setDia(dia);
                turno.setFecha(Convert.ToDateTime(txtFecha.Text.Trim()));
                turno.setHora(ddlHora.SelectedValue);
                if(neg.DisponibilidadTurno(turno.getLegajo_Medico(), turno.getFecha(), turno.getHora()))
                {
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    lblMensaje.Text = "El medico ya tiene un turno en esa fecha y hora o con una diferencia de una hora";
                    return;
                }

                if (neg.pacienteTieneTurno(turno.getDNI_Paciente(), turno.getFecha(), turno.getHora()))
                {
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    lblMensaje.Text = "El paciente ya tiene un turno en esa fecha y hora o con una diferencia de una hora";
                    return;
                }

                int resultado = neg.AgregarTurno(turno);

                if (resultado > 0)
                {
                    lblMensaje.ForeColor = System.Drawing.Color.Green;
                    lblMensaje.Text = "El turno se agrego correctamente";
                }
                else
                {
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    lblMensaje.Text = "Error al agregar el turno";
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

        protected void ddlMedicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarHorariosSiEstaListo();

         
        }

        private void cargarHorarios(TimeSpan inicio, TimeSpan fin)
        {
            ddlHora.Items.Clear();
            for (TimeSpan hora = inicio; hora <= fin; hora = hora.Add(TimeSpan.FromMinutes(30)))
            {
                ddlHora.Items.Add(hora.ToString(@"hh\:mm"));
            }
        }

        private void cargarHorariosSiEstaListo()
        {
            ddlHora.Items.Clear();
            if (string.IsNullOrWhiteSpace(txtFecha.Text) || ddlMedicos.SelectedIndex <= 0)
            {
                ddlHora.Items.Clear();
                ddlHora.Items.Add("-- Seleccione fecha y medico --");
                return;
            }

            DateTime fecha;
            if (DateTime.TryParse(txtFecha.Text, out fecha))
            {
                string legajoMedico = ddlMedicos.SelectedValue;
                string diaSemana = neg.diaSemanaLetra(fecha);
                var horario = neg.obtenerHorarioMedico(legajoMedico, diaSemana);

                if (horario.Item1 != TimeSpan.Zero && horario.Item2 != TimeSpan.Zero)
                {
                    cargarHorarios(horario.Item1, horario.Item2);
                }
                else
                {
                    ddlHora.Items.Clear();
                    ddlHora.Items.Add("-- sin Horarios Disponibles --");
                }
            }
            else
            {
                ddlHora.Items.Clear();
                ddlHora.Items.Add("-- Fecha Invalida --");
            }
        }
        protected void txtFecha_TextChanged(object sender, EventArgs e)
        {
            cargarHorariosSiEstaListo();
        }

        protected void cvPaciente_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string dniIngresado = args.Value.Trim();

            bool existePaciente = neg.existePaciente(dniIngresado);

            args.IsValid = existePaciente;
        }
    }
}
