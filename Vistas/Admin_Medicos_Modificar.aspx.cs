using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class Admin_Modificar_Medico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          /*  NegocioClinica negocio = new NegocioClinica();
            Usuarios usuario = Session["usuario"] as Usuarios;
            if (!negocio.CheckLogin(usuario, "Administrador"))
            {
                Response.Redirect("Login.aspx");
            }
            tipoUsuario.Text = usuario.getRol();
            nombreUsuario.Text = usuario.getNombre();*/
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Medicos.aspx");
        }
        protected void gvMedico_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        protected void gvMedico_RowEditing(object sender, GridViewEditEventArgs e)
        {
           
            gvMedico.EditIndex = e.NewEditIndex;
            CargarMedico();
            NegocioClinica negocio = new NegocioClinica();
            GridViewRow fila = gvMedico.Rows[e.NewEditIndex];

            DropDownList ddlProvincia = fila.FindControl("ddlEditProvincia") as DropDownList;
            if (ddlProvincia != null)
            {
                ddlProvincia.DataSource = negocio.ObtenerProvincias();
                ddlProvincia.DataTextField = "Descripcion_Provincia";
                ddlProvincia.DataValueField = "Id_Provincia";
                ddlProvincia.DataBind();

                int idProvincia = Convert.ToInt32(((HiddenField)fila.FindControl("hdnProvincia")).Value);
                ddlProvincia.SelectedValue = idProvincia.ToString();
            }

            DropDownList ddlLocalidad = fila.FindControl("ddlEditLocalidad") as DropDownList;
            if (ddlLocalidad != null && ddlProvincia != null)
            {
                int idProvincia = int.Parse(ddlProvincia.SelectedValue);
                DataTable dtLocalidades = negocio.obtenerLocalidadPorProvincia(idProvincia);

                ddlLocalidad.DataSource = dtLocalidades;
                ddlLocalidad.DataTextField = "Descripcion_Localidad";
                ddlLocalidad.DataValueField = "Id_Localidad";
                ddlLocalidad.DataBind();

                int idLocalidad = Convert.ToInt32(((HiddenField)fila.FindControl("hdnIdLocalidad")).Value);
                ddlLocalidad.SelectedValue = idLocalidad.ToString();
            }

            DropDownList ddlEspecialidad = fila.FindControl("ddlEditEspecialidad") as DropDownList;

            if (ddlEspecialidad != null)
            {
                ddlEspecialidad.DataSource = negocio.ObtenerEspecialidades();
                ddlEspecialidad.DataTextField = "Descripcion_Especialidad";
                ddlEspecialidad.DataValueField = "Id_Especialidad";
                ddlEspecialidad.DataBind();
                int idEspecialidad = Convert.ToInt32(((HiddenField)fila.FindControl("hdnIdEspecialidad")).Value);
                ddlEspecialidad.SelectedValue = idEspecialidad.ToString();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            hiddenLegajo.Value = txtBuscar.Text.Trim();
            CargarMedico();
            CargarHorario();
        }

        protected void gvMedico_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMedico.EditIndex = -1;
            CargarMedico();
        }
        protected void CargarMedico()
        {
            NegocioClinica negocioClinica = new NegocioClinica();
            if (txtBuscar.Text == string.Empty)
            {
                return;
            }
            gvMedico.DataSource = negocioClinica.GetMedicosPorLegajo(hiddenLegajo.Value);
            gvMedico.DataBind();
        }

        protected void CargarHorario()
        {
            NegocioClinica negocioClinica = new NegocioClinica();
            if (txtBuscar.Text == string.Empty)
            {
                return;
            }
            gvHorario.DataSource = negocioClinica.GetHorarioLegajoMod(hiddenLegajo.Value);
            gvHorario.DataBind();
        }

        protected void gvMedico_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string legajo = ((Label)gvMedico.Rows[e.RowIndex].FindControl("labelEditMedico")).Text;
            int especialidad = Int32.Parse(((DropDownList)gvMedico.Rows[e.RowIndex].FindControl("ddlEditEspecialidad")).SelectedValue); 
            string dni = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtEditDNI")).Text;
            string nombre = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtEditNombre")).Text;
            string apellido = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtEditApellido")).Text;
            char sexo = Char.Parse(((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtEditSexo")).Text);
            DateTime fecha = DateTime.Parse(((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtEditFecha")).Text);
            string nacionalidad = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("textboxEditNacionalidad")).Text;
            string direccion = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtEditDireccion")).Text;
            int localidad = int.Parse(((DropDownList)gvMedico.Rows[e.RowIndex].FindControl("ddlEditLocalidad")).SelectedValue);
            int provincia = int.Parse(((DropDownList)gvMedico.Rows[e.RowIndex].FindControl("ddlEditProvincia")).SelectedValue);
            string email = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtEditCorreo")).Text;
            string telefono = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtEditTelefono")).Text;
            NegocioClinica negocioClinica = new NegocioClinica();
           int filasAfectadas = negocioClinica.actualizarMedico(legajo, especialidad, dni, nombre, apellido, sexo, fecha, nacionalidad, direccion, localidad, provincia, email, telefono);
            if (filasAfectadas > 0)
            {
                gvMedico.EditIndex = -1;
                CargarMedico();
            }
        }
        protected void ddlEditLocalidad_DataBound(object sender, EventArgs e)
        {
            DropDownList ddl = sender as DropDownList;

            if (ddl != null)
            {
                ddl.Items.Insert(0, new ListItem("-- Seleccionar Localidad --", "0"));
                ddl.SelectedIndex = 0;
            }
        }

        protected void ddlEditProvincia_DataBound(object sender, EventArgs e)
        {
            DropDownList ddl = sender as DropDownList;

            if (ddl != null)
            {
                ddl.Items.Insert(0, new ListItem("-- Seleccionar Provincia --", "0"));
                ddl.SelectedIndex = 0;

            }
        }

        protected void ddlEditEspecialidad_DataBound(object sender, EventArgs e)
        {
            DropDownList ddl = sender as DropDownList;

            if (ddl != null)
            {
                ddl.Items.Insert(0, new ListItem("-- Seleccionar Especialidad --", "0"));
                ddl.SelectedIndex = 0;
            }
        }

        protected void ddlEditProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlProvincia = sender as DropDownList;
            if (ddlProvincia == null)
                return;

            GridViewRow fila = (GridViewRow)ddlProvincia.NamingContainer;
            if (fila == null)
                return;

            int idProvincia;
            if (int.TryParse(ddlProvincia.SelectedValue, out idProvincia))
            {
                DropDownList ddlLocalidad = fila.FindControl("ddlEditLocalidad") as DropDownList;
                if (ddlLocalidad != null)
                {
                    NegocioClinica negocio = new NegocioClinica();
                    DataTable dtLocalidades = negocio.obtenerLocalidadPorProvincia(idProvincia);

                    ddlLocalidad.DataSource = dtLocalidades;
                    ddlLocalidad.DataTextField = "Descripcion_Localidad";
                    ddlLocalidad.DataValueField = "Id_Localidad";
                    ddlLocalidad.DataBind();

                }
            }
        }

        protected void gvHorario_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string legajo = ((Label)gvHorario.Rows[e.RowIndex].FindControl("lblEditLegajo")).Text;
            int entrada;
            int.TryParse(((TextBox)gvHorario.Rows[e.RowIndex].FindControl("txtEditEntrada")).Text, out entrada);
            int salida;
            int.TryParse(((TextBox)gvHorario.Rows[e.RowIndex].FindControl("txtEditSalida")).Text, out salida);

            NegocioClinica neg = new NegocioClinica();
            int filasAfectadas = neg.actualizarHorario(legajo, entrada, salida);
            if(filasAfectadas > 0)
            {
                gvHorario.EditIndex = -1;
                CargarHorario();
            }

        }

        protected void gvHorario_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvHorario.EditIndex = e.NewEditIndex;
            CargarHorario();
        }

        protected void gvHorario_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvHorario.EditIndex = -1;
            CargarHorario();
        }
    }
}