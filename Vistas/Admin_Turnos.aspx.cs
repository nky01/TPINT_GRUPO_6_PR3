using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class Admin_Turnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AltaTurnosBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Turnos_Alta.aspx");
        }

        protected void BajaTurnosBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Turnos_Baja.aspx");
        }

        protected void ListaTurnosBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Turnos_Listado.aspx");
        }
    }
}