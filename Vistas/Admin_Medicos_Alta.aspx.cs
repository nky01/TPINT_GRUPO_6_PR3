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
	public partial class AltaMedicos : System.Web.UI.Page
	{
		NegocioClinica negocio = new NegocioClinica();
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                CargarProvincias();
                CargarLocalidades();
                CargarEspecialidades();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        private void CargarProvincias()
        {
            ddlProvincia.DataSource = negocio.ObtenerProvincias();
            ddlProvincia.DataTextField = "Descripcion_Provincia";
            ddlProvincia.DataValueField = "Id_Provincia";
            ddlProvincia.DataBind();
            ddlProvincia.Items.Insert(0, new ListItem("--Seleccione una provincia--", "0"));
        }

        private void CargarLocalidades()
        {
            ddlLocalidad.DataSource = negocio.ObtenerLocalidades();
            ddlLocalidad.DataTextField = "Descripcion_Localidad";
            ddlLocalidad.DataValueField = "Id_Localidad";
            ddlLocalidad.DataBind();
            ddlLocalidad.Items.Insert(0, new ListItem("--Seleccione una localidad--", "0"));
        }

        private void CargarEspecialidades()
        {
            ddlEspecialidad.DataSource = negocio.ObtenerEspecialidades();
            ddlEspecialidad.DataTextField = "Descripcion_Especialidad";
            ddlEspecialidad.DataValueField = "Id_Especialidad";
            ddlEspecialidad.DataBind();
            ddlEspecialidad.Items.Insert(0, new ListItem("--Seleccione una especialidad--", "0"));
        }

        protected void buttonAgregar_Click(object sender, EventArgs e)
        {
            AgregarPaciente();
        }

        private void AgregarPaciente()
        {
            Medico obj = new Medico();
            obj.setDNI(textboxDNI.Text.Trim());
            obj.setNombre(textboxNombre.Text.Trim());
            obj.setApellido(textboxApellido.Text.Trim());
            char genero;
            switch (radioButtonSexo.SelectedValue)
            {
                case "3":
                    genero = 'M';
                    break;
                case "2":
                    genero = 'F';
                    break;
                default:
                    genero = 'N';
                    break;
            }
            obj.setSexo(genero);
            obj.setNacionalidad(textboxNacionalidad.Text.Trim());
            DateTime fecha;
            DateTime.TryParse(textboxFecha.Text.Trim(), out fecha);
            obj.setFechaNacimiento(fecha);
            obj.setDireccion(textboxDireccion.Text.Trim());
            int idProvincia;
            int idLocalidad;

            if (int.TryParse(ddlProvincia.SelectedValue, out idProvincia) && int.TryParse(ddlLocalidad.SelectedValue, out idLocalidad))
            {
                obj.setIdProvincia(idProvincia);
                obj.setIdLocalidad(idLocalidad);
            }
            obj.setCorreoElectronico(textboxEmail.Text.Trim());
            obj.setTelefono(textboxTelefono.Text.Trim());
            int filasAfectadas = negocio.AgregarMedico(obj);
            if (filasAfectadas > 0)
            {
                lblExito.Visible = true;
                lblExito.ForeColor = System.Drawing.Color.Green;
                lblExito.Text = "Paciente agregado correctamente!";
                LimpiarCampos();
            }
            else
            {
                lblExito.Visible = true;
                lblExito.ForeColor = System.Drawing.Color.Red;
                lblExito.Text = "Error al agregar paciente";
            }
        }

        private void LimpiarCampos()
        {
            textboxApellido.Text = "";
            textboxDireccion.Text = "";
            textboxDNI.Text = "";
            textboxEmail.Text = "";
            textboxFecha.Text = "";
            textboxHorarioComienzo.Text = "";
            textboxHorarioFinal.Text = "";
            textboxLegajo.Text = "";
            textboxNacionalidad.Text = "";
            textboxNombre.Text = "";
            textboxPassword.Text = "";
            textboxTelefono.Text = "";
            textboxUsuario.Text = "";
        }
    }
}