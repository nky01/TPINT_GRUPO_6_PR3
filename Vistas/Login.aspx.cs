using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using Entidades;
using Negocio;
using System.Data.SqlClient;

namespace Vistas
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text;
            string contrasenia = txtContrasenia.Text;

            NegocioClinica negocio = new NegocioClinica();
            Usuarios user = negocio.ValidarLogin(usuario, contrasenia);

            if (user != null)
            {
                Session["usuario"] = user;

                if (user.getRol() == "Administrador")
                    Response.Redirect("AdminVista.aspx");
                else if (user.getRol() == "Medico")
                    Response.Redirect("MedicoVista.aspx");
                else
                    lblErrorLogin.Visible = true;
                    lblErrorLogin.Text="El rol no fue reconocido";
            }
            else
            {
                lblErrorLogin.Visible = true;
                lblErrorLogin.Text= "Usuario o contraseña incorrectos!";
            }
        }
    }
}