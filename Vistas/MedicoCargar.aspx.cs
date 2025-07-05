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
    public partial class MedicoCargarObservacion : System.Web.UI.Page
    {

        private Medico medico = new Medico();
        private NegocioClinica negocio = new NegocioClinica();

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuarios usuario = Session["usuario"] as Usuarios;
            if (!negocio.CheckLogin(usuario, "Medico"))
            {
                Response.Redirect("Login.aspx");
            }
            tipoUsuario.Text = usuario.getRol();
            nombreUsuario.Text = usuario.getNombre();

            if(!IsPostBack)
            {
                medico = negocio.GetMedicoPorUsuarioNombre(usuario.getNombre());
                if (medico.getLegajo() == string.Empty) { Response.Redirect("Login.aspx"); }
                CargarTurnosDDL();
            }

        }

        protected void CargarGV()
        {
            gvTurnos.DataSource = negocio.GetTurno(int.Parse(hdfTurnoSelected.Value));
            gvTurnos.DataBind();
        }

        protected void CargarTurnosDDL()
        {

            if(!negocio.existeTurnoMedico(medico.getLegajo()))
            {
                ddlTurnos.Items.Insert(0, "--No hay turnos--");
                lblNoExiste.Visible = true;
                return;
            }

            ddlTurnos.DataSource = negocio.ObtenerTurnosPorMedico(medico.getLegajo());
            ddlTurnos.DataTextField = "DescripcionTurno";
            ddlTurnos.DataValueField = "CodigoTurno"; 
            ddlTurnos.DataBind();
            ddlTurnos.Items.Insert(0, "--Seleccione un turno--");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("MedicoVista.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            hdfTurnoSelected.Value = ddlTurnos.SelectedValue;
            CargarGV();
        }

        protected void gvTurnos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTurnos.EditIndex = e.NewEditIndex;
            CargarGV();

            GridViewRow fila = gvTurnos.Rows[e.NewEditIndex];
            DropDownList ddlEstado = fila.FindControl("ddlEstado") as DropDownList;

            if (ddlEstado != null)
            {
                string estado = ((HiddenField)fila.FindControl("hiddenFieldEstado")).Value;
                ddlEstado.SelectedValue = estado;
            }
        }

        protected void gvTurnos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string estado = ((DropDownList)gvTurnos.Rows[e.RowIndex].FindControl("ddlEstado")).SelectedValue;
            string observacion = ((TextBox)gvTurnos.Rows[e.RowIndex].FindControl("txtObservacion")).Text;

            int rowAfectadas = negocio.actualizarTurno(int.Parse(hdfTurnoSelected.Value), estado, observacion);
            if(rowAfectadas > 0)
            {
                gvTurnos.EditIndex = -1;
                CargarGV();
            }


        }

        protected void gvTurnos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTurnos.EditIndex = -1;
            CargarGV();
        }
    }
}