﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class AltaPaciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lblExito.Visible = true;
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Pacientes.aspx");

        }
    }
}