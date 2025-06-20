using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Datos;
using Entidades;
using System.Data;

namespace Negocio
{
    public class NegocioClinica
    {
        DaoClinica dao = new DaoClinica();

        public Usuarios ValidarLogin(string nombre, string contrasenia)
        {
            return dao.LoginUsuario(nombre, contrasenia);
        }

        public int AgregarPaciente(Paciente paciente)
        {
            return dao.AgregarPaciente(paciente);
        }

        public DataTable ObtenerProvincias()
        {
            DaoClinica dao = new DaoClinica();
            return dao.GetTableProvincias();
        }

        public DataTable ObtenerLocalidades()
        {
            DaoClinica dao = new DaoClinica();
            return dao.GetTableLocalidades();
        }
    }        
}