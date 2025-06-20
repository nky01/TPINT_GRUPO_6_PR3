using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class BajaPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBaja_Click(object sender, EventArgs e)
        {
            NegocioClinica neg = new NegocioClinica();
            bool resultado = neg.BajaPacienteDNI(txtDni.Text);
            lblExito.Visible = false;
            if(resultado)
            {
                txtDni.Text = string.Empty;
                lblExito.Visible = true;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Pacientes.aspx");
        }
    }
}