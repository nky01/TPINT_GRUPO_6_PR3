﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class MedicoVista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTurno_Click(object sender, EventArgs e)
        {
            Response.Redirect("MedicoTurnos.aspx");
        }

        protected void btnCargarObservaciones_Click(object sender, EventArgs e)
        {
            Response.Redirect("MedicoCargar.aspx");
        }
    }
}