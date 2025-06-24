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
    public partial class Admin_Modificar_Medico : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioClinica negocio = new NegocioClinica();
            Usuarios usuario = Session["usuario"] as Usuarios;
            if (!negocio.CheckLogin(usuario, "Administrador"))
            {
                Response.Redirect("Login.aspx");
            }
            tipoUsuario.Text = usuario.getRol();
            nombreUsuario.Text = usuario.getNombre();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
        }

        protected void gvMedico_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvMedico_RowEditing(object sender, GridViewEditEventArgs e)
        {
           
            gvMedico.EditIndex = e.NewEditIndex;
            CargarMedico();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CargarMedico();
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
            gvMedico.DataSource = negocioClinica.GetPaciente(txtBuscar.Text);
            gvMedico.DataBind();
        }

        protected void gvMedico_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string legajo = ((Label)gvMedico.Rows[e.RowIndex].FindControl("lblLegajo")).Text;
            int especialidad = Int32.Parse(((TextBox)gvMedico.Rows[e.RowIndex].FindControl("textboxEditEspecialidad")).Text);
            string nombre = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtEditNombre")).Text;
            string apellido = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtEditApellido")).Text;
            char sexo = Char.Parse(((Label)gvMedico.Rows[e.RowIndex].FindControl("labelSexo")).Text);
            DateTime fecha = DateTime.Parse(((Label)gvMedico.Rows[e.RowIndex].FindControl("labelFecha")).Text);
            string nacionalidad = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("textboxEditNacionalidad")).Text;
            string direccion = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtEditDireccion")).Text;
            int localidad = Int32.Parse(((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtEditLocalidad")).Text);
            int provincia = Int32.Parse(((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtEditProvincia")).Text);
            string email = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtEditCorreo")).Text;
            string telefono = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtEditTelefono")).Text;
            Medico obj = new Medico();
            obj.setDNI(legajo);
            obj.setIdEspecialidad(especialidad);
            obj.setNombre(nombre);
            obj.setApellido(apellido);
            obj.setSexo(sexo);
            obj.setFechaNacimiento(fecha);
            obj.setNacionalidad(nacionalidad);
            obj.setDireccion(direccion);
            obj.setIdLocalidad(localidad);
            obj.setIdProvincia(provincia);
            obj.setCorreoElectronico(email);
            obj.setTelefono(telefono);

        }
    }
}