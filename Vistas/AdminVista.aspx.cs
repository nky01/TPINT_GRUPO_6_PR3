using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class AdminVista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PacientesBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Pacientes.aspx");
        }

        protected void MedicosBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Medicos.aspx");
        }
    }
}