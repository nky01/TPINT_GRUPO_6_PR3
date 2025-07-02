using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Data;
using System.Web.UI.DataVisualization.Charting;

namespace Vistas
{
    public partial class Admin_Informes : System.Web.UI.Page
    {
        NegocioClinica negocio = new NegocioClinica();
        protected void Page_Load(object sender, EventArgs e)
        {

            Usuarios usuario = Session["usuario"] as Usuarios;
            if (!negocio.CheckLogin(usuario, "Administrador"))
            {
                Response.Redirect("Login.aspx");
            }
            tipoUsuario.Text = usuario.getRol();
            nombreUsuario.Text = usuario.getNombre();

            DropDownList1.AutoPostBack = true;
            DropDownList1.SelectedIndexChanged += DropDownList1_SelectedIndexChanged;
            if (!IsPostBack)
            {
               ActualizarInforme(DropDownList1.SelectedValue);
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ActualizarInforme(DropDownList1.SelectedValue);
        }

        private void ActualizarInforme(string periodo)
        {
            DateTime fechaInicio;
            DateTime fechaFin;

            if (periodo.ToLower().Contains("enero"))
            {
                fechaInicio = new DateTime(2025, 1, 1);
                fechaFin = new DateTime(2025, 2, 28);
            }
            else if (periodo.ToLower().Contains("marzo"))
            {
                fechaInicio = new DateTime(2025, 3, 1);
                fechaFin = new DateTime(2025, 4, 30);
            }
            else
            {
                fechaInicio = DateTime.MinValue;
                fechaFin = DateTime.MaxValue;
            }

            DataTable dt = negocio.ObtenerAusentesPresentesPorFechas(fechaInicio, fechaFin);

            int ausentes = 0;
            int presentes = 0;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string estado = dt.Rows[i]["Estado_Turno"].ToString().ToLower();
                int cantidad = Convert.ToInt32(dt.Rows[i]["Cantidad"]);

                if (estado == "ausente")
                {
                    ausentes = cantidad;
                }
                else if (estado == "presente")
                {
                    presentes = cantidad;
                }
            }

            ChartAusencias.Series["Serie1"].Points.Clear();
            ChartAusencias.Titles.Clear();

            ChartAusencias.Titles.Add("Ausentes vs Presentes (" + periodo + ")");

            ChartAusencias.Series["Serie1"].ChartType = SeriesChartType.Pie;
            ChartAusencias.Series["Serie1"].IsValueShownAsLabel = true;

            ChartAusencias.Series["Serie1"].Points.AddXY("Ausentes", ausentes);
            ChartAusencias.Series["Serie1"].Points.AddXY("Presentes", presentes);

            for (int j = 0; j < ChartAusencias.Series["Serie1"].Points.Count; j++)
            {
                ChartAusencias.Series["Serie1"].Points[j].Label = ChartAusencias.Series["Serie1"].Points[j].AxisLabel + ": " + ChartAusencias.Series["Serie1"].Points[j].YValues[0];
            }

            ActualizarGridView(ausentes, presentes);
        }
        private void ActualizarGridView(int ausentes, int presentes)
        {
            DataTable tabla = new DataTable();
            tabla.Columns.Add("Ausentes", typeof(int));
            tabla.Columns.Add("Presentes", typeof(int));

            DataRow fila = tabla.NewRow();
            fila["Ausentes"] = ausentes;
            fila["Presentes"] = presentes;
            tabla.Rows.Add(fila);

            GridView1.DataSource = tabla;
            GridView1.DataBind();
        }
    }
}