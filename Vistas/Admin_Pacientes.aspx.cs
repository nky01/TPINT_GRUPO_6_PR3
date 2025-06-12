using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class Pacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAltaP_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaPaciente.aspx");
        }

        protected void btnBajaP_Click(object sender, EventArgs e)
        {
            Response.Redirect("BajaPaciente.aspx");
        }

        protected void btnModificarP_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarPaciente.aspx");
        }

        protected void btnListarP_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarPaciente.aspx");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminVista.aspx");
        }
    }
}