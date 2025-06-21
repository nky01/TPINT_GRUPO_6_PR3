using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;

namespace Vistas
{
    public partial class ModificarPaciente : System.Web.UI.Page
    {

        private NegocioClinica negocio;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Pacientes.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            negocio = new NegocioClinica();
            gvPaciente.DataSource = negocio.getTablaPaciente(txtBusqueda.Text);
            gvPaciente.DataBind();
        }

        protected void gvPaciente_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPaciente.EditIndex = -1;
            negocio = new NegocioClinica();
            gvPaciente.DataSource = negocio.getTablaPaciente(txtBusqueda.Text);
            gvPaciente.DataBind();
        
        }

        protected void gvPaciente_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvPaciente.EditIndex = e.NewEditIndex;

            negocio = new NegocioClinica();
            gvPaciente.DataSource = negocio.getTablaPaciente(txtBusqueda.Text);
            gvPaciente.DataBind();
            GridViewRow fila = gvPaciente.Rows[e.NewEditIndex];

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

        }

        protected void gvPaciente_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;

            string dni = ((Label)gvPaciente.Rows[e.RowIndex].FindControl("dniTemplate")).Text;

            string nuevoNombre = ((TextBox)gvPaciente.Rows[e.RowIndex].FindControl("txtEditNombre")).Text;
            string nuevoApellido = ((TextBox)gvPaciente.Rows[e.RowIndex].FindControl("txtEditApellido")).Text;
            string nuevaDireccion = ((TextBox)gvPaciente.Rows[e.RowIndex].FindControl("txtEditDireccion")).Text;
            string nuevoCorreo = ((TextBox)gvPaciente.Rows[e.RowIndex].FindControl("txtEditCorreo")).Text;
            string nuevoTelefono = ((TextBox)gvPaciente.Rows[e.RowIndex].FindControl("txtEditTelefono")).Text;
            int nuevaIdLocalidad = int.Parse(((DropDownList)gvPaciente.Rows[index].FindControl("ddlEditLocalidad")).SelectedValue);
            int NuevaIdProvincia = int.Parse(((DropDownList)gvPaciente.Rows[index].FindControl("ddlEditProvincia")).SelectedValue);

            negocio = new NegocioClinica();
            int filasAfectadas = negocio.actualizarPaciente(dni, nuevoNombre, nuevoApellido, nuevaDireccion, nuevoCorreo, nuevoTelefono, nuevaIdLocalidad, NuevaIdProvincia);


            if(filasAfectadas > 0)
            {
                gvPaciente.EditIndex = -1;
                gvPaciente.DataSource = negocio.getTablaPaciente(txtBusqueda.Text);
                gvPaciente.DataBind();
            }
        }

        protected void ddlEditLocalidad_DataBound(object sender, EventArgs e)
        {
            DropDownList ddl = sender as DropDownList;

            if(ddl != null)
            {
                ddl.Items.Insert(0, new ListItem("-- Seleccionar Localidad --", "0"));
                ddl.SelectedIndex = 0;
            }
        }

        protected void ddlEditProvincia_DataBound(object sender, EventArgs e)
        {
            DropDownList ddl = sender as DropDownList;

            if(ddl != null)
            {
                ddl.Items.Insert(0, new ListItem("-- Seleccionar Provincia --", "0"));
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
    }
}