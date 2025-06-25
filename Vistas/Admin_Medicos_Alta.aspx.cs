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
            Usuarios usuario = Session["usuario"] as Usuarios;
            if (!negocio.CheckLogin(usuario, "Administrador"))
            {
                Response.Redirect("Login.aspx");
            }
            tipoUsuario.Text = usuario.getRol();
            nombreUsuario.Text = usuario.getNombre();
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
            
            ddlLocalidad.Items.Clear();
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
            AgregarMedico();
        }

        private void AgregarMedico()
        {
            Medico obj = new Medico();
            Usuarios usuario = new Usuarios();

            if (negocio.ExisteUsuario(textboxUsuario.Text.Trim()))
            {
                lblExito.Visible = true;
                lblExito.ForeColor = System.Drawing.Color.Red;
                lblExito.Text = "ERROR: El nombre de usuario ya existe, ingrese otro";
                return;
            }

            usuario.setNombre(textboxUsuario.Text.Trim());
            usuario.setContrasenia(textboxPassword.Text.Trim());
            usuario.setRol("Medico");

            obj.setDNI(textboxDNI.Text.Trim());
            obj.setNombre(textboxNombre.Text.Trim());
            obj.setApellido(textboxApellido.Text.Trim());
            obj.setLegajo(textboxLegajo.Text.Trim());
            obj.setSexo(Convert.ToChar(radioButtonSexo.SelectedValue));
            obj.setNacionalidad(textboxNacionalidad.Text.Trim());
            DateTime fecha;
            DateTime.TryParse(textboxFecha.Text.Trim(), out fecha);
            obj.setFechaNacimiento(fecha);
            obj.setDireccion(textboxDireccion.Text.Trim());
            int idProvincia;
            int idLocalidad;
            int idEspecialidad = int.Parse(ddlEspecialidad.SelectedValue);
            obj.setIdEspecialidad(idEspecialidad);
            if (int.TryParse(ddlProvincia.SelectedValue, out idProvincia) && int.TryParse(ddlLocalidad.SelectedValue, out idLocalidad))
            {
                obj.setIdProvincia(idProvincia);
                obj.setIdLocalidad(idLocalidad);
            }
            obj.setCorreoElectronico(textboxEmail.Text.Trim());
            obj.setTelefono(textboxTelefono.Text.Trim());


            List<Horario> horarios = new List<Horario>();

            int selecionados = cblDias.Items.Cast<ListItem>().Count(i => i.Selected);

            if (selecionados == 1)
            {
                foreach (ListItem item in cblDias.Items)
                {
                    if (item.Selected)
                    {
                        Horario horario = new Horario();
                        horario.setDia(Convert.ToChar(item.Value));
                        horario.setHorario(int.Parse(textboxHorarioComienzo.Text), int.Parse(textboxHorarioFinal.Text));
                        horarios.Add(horario);
                    }
                }
            }

             /// en el else tendria que ponerse la logica para el resto de dias, es decir si hay dos dias por lo menos
             /// o mas ahi empieza la logica de varios horarios


            int filasAfectadas = negocio.AgregarMedico(obj, usuario);
            if (filasAfectadas > 0)
            {
                lblExito.Visible = true;
                lblExito.ForeColor = System.Drawing.Color.Green;
                lblExito.Text = "Medico agregado correctamente!";
                obj.setHorarios(horarios);
                negocio.AgregarHorario(horarios, obj.getLegajo());
                LimpiarCampos();
            }
            else
            {
                lblExito.Visible = true;
                lblExito.ForeColor = System.Drawing.Color.Red;
                lblExito.Text = "ERROR: LEGAJO/DNI Ya existen";
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
            txtRepetirContraseña.Text = "";
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        

        

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idProvincia;
            if(int.TryParse(ddlProvincia.SelectedValue, out idProvincia) && idProvincia > 0)
            {
                CargarLocalidadesPorProvincia(idProvincia);
            }
            else
            {
                ddlLocalidad.Items.Clear();
                ddlLocalidad.Items.Insert(0, new ListItem("-- Seleccione una localidad", "0"));
            }
        }

        private void CargarLocalidadesPorProvincia(int idProvincia)
        {
            ddlLocalidad.DataSource = negocio.ObtenerLocalidadesPorProvincia(idProvincia);
            ddlLocalidad.DataTextField = "Descripcion_Localidad";
            ddlLocalidad.DataValueField = "Id_Localidad";
            ddlLocalidad.DataBind();
            ddlLocalidad.Items.Insert(0, new ListItem("-- Seleccione una localidad", "0"));
        }

        
    }
}