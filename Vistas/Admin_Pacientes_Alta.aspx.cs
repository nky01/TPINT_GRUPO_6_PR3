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
    public partial class AltaPaciente : System.Web.UI.Page
    {
        NegocioClinica negocio = new NegocioClinica();

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuarios usuario = Session["usuario"] as Usuarios;
            if(!negocio.CheckLogin(usuario, "Administrador"))
            {
                Response.Redirect("Login.aspx");
            }
            

            if (!IsPostBack)
            {
                tipoUsuario.Text = usuario.getRol();
                nombreUsuario.Text = usuario.getNombre();
                CargarProvincias();
                CargarLocalidades();
            }
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

        private void CargarNombreYRol()
        {

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Pacientes.aspx");
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (negocio.existePaciente(txtDni.Text.Trim()))
                {
                    lblExito.Visible = true;
                    lblExito.ForeColor = System.Drawing.Color.Red;
                    lblExito.Text = "Error: ya existe un paciente con ese DNI.";
                    return;
                }

                Paciente p = new Paciente();

                p.setDNI(txtDni.Text.Trim());
                p.setNombre(txtNombre.Text.Trim());
                p.setApellido(txtApellido.Text.Trim());

                // La radio button devuelve valores 2-masculino y 1-femnino, se convierte a char 'M' o 'F'(y va para la bd con el formato correspondiente)
                char sexo = rblSexo.SelectedValue == "2" ? 'M' : 'F';
                p.setSexo(sexo);

                p.setNacionalidad(txtNacionalidad.Text.Trim());

                DateTime fechaNac;
                if (DateTime.TryParse(txtFechaNacimiento.Text, out fechaNac))
                {
                    p.setFechaNacimiento(fechaNac);
                }
                else
                {
                    return;
                }

                p.setDireccion(txtDireccion.Text.Trim());
                p.setCorreoElectronico(txtCorreo.Text.Trim());
                p.setTelefono(txtTelefono.Text.Trim());

                int idProvincia;
                int idLocalidad;

                if (int.TryParse(ddlProvincia.SelectedValue, out idProvincia) && int.TryParse(ddlLocalidad.SelectedValue, out idLocalidad))
                {
                    p.setIdProvincia(idProvincia);
                    p.setIdLocalidad(idLocalidad);
                }
                else
                {
                    return;
                }

                int filasAfectadas = negocio.AgregarPaciente(p);

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
            catch (Exception ex)
            {
                lblExito.Visible = true;
                lblExito.ForeColor = System.Drawing.Color.Red;
                lblExito.Text = "Error: " + ex.Message;
            }
        }

        private void LimpiarCampos()
        {
            txtDni.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            rblSexo.ClearSelection();
            txtNacionalidad.Text = "";
            txtFechaNacimiento.Text = "";
            txtDireccion.Text = "";
            txtCorreo.Text = "";
            txtTelefono.Text = "";
            ddlProvincia.SelectedIndex = 0;
            ddlLocalidad.SelectedIndex = 0;
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idProvincia;
            if (int.TryParse(ddlProvincia.SelectedValue, out idProvincia) && idProvincia > 0)
            {
                CargarLocalidadesPorProvincia(idProvincia);
            }
            else
            {
                ddlLocalidad.Items.Clear();
                ddlLocalidad.Items.Insert(0, new ListItem("-- Seleccione una localidad --", "0"));
            }
        }

        private void CargarLocalidadesPorProvincia(int idProvincia)
        {
            ddlLocalidad.DataSource = negocio.ObtenerLocalidadesPorProvincia(idProvincia);
            ddlLocalidad.DataTextField = "Descripcion_Localidad";
            ddlLocalidad.DataValueField = "Id_Localidad";
            ddlLocalidad.DataBind();
            ddlLocalidad.Items.Insert(0, new ListItem("-- Seleccione una localidad --", "0"));
        }
    }
}