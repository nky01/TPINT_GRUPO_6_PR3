using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;
using System.Reflection.Emit;

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

        public int actualizarPaciente(string dni, string nombre, string apellido, string direccion, string correo, string telefono, int idLocalidad, int idProvincia, string nuevaNacionalidad, char sexo, DateTime fecha)
        {
            return dao.actualizarCliente(dni, nombre, apellido, direccion, idLocalidad, idProvincia, correo, telefono, nuevaNacionalidad, sexo, fecha);
        }

        public int AgregarMedico(Medico medico, Usuarios usuario)
        {
            return dao.AgregarMedico(medico, usuario);
        }

        public int AgregarHorario(List<Horario> horarios, string legajoMedico)
        {
            int horariosAgregados = 0;
            foreach(Horario horario in horarios)
            {
                horariosAgregados += dao.AgregarHorario(horario, legajoMedico);
            }
            return horariosAgregados;
        }

        public DataTable ObtenerProvincias()
        {
            DaoClinica dao = new DaoClinica();
            return dao.GetTableProvincias();
        }

        public DataTable obtenerPronviciasPorLocalidad(int idLocalidad)
        {
            return dao.GetTableProvinciasPorLocalidad(idLocalidad);
        }

     
        public DataTable ObtenerLocalidades()
        {
            DaoClinica dao = new DaoClinica();
            return dao.GetTableLocalidades();
        }

        public DataTable obtenerLocalidadPorProvincia(int idProvincia)
        {
            return dao.GetTableLocalidadesPorProvincia(idProvincia);

        }

        public DataTable ObtenerEspecialidades()
        {
            DaoClinica dao = new DaoClinica();
            return dao.GetTableEspecialidades();
        }
        public bool BajaPacienteDNI(string dni)
        {
            DaoClinica dao = new DaoClinica();
            return dao.BajaLogicaPorDni(dni);
        }

        public bool BajaMedicoPorLegajo(string legajo)
        {
            DaoClinica dao = new DaoClinica();
            return dao.BajaLogicaMedicoPorLegajo(legajo);
        }

        public DataTable getTablaPaciente(string dni)
        {
            DaoClinica dao = new DaoClinica();
            return dao.getTablaPaciente(dni);
        }
        public DataTable GetPacientes()
        {
            DaoClinica dao = new DaoClinica();
            return dao.GetPacientes();
        }

        public DataTable GetPaciente(string DNIbuscado)
        {
            DaoClinica dao = new DaoClinica();
            DataTable table = dao.getTablaPaciente(DNIbuscado);
            return table;
        }

        public bool CheckLogin(Usuarios user, string rol)
        {
            if(user == null)
            {
                return false;
            }
            if(user.getRol() != rol)
            {
                return false;
            }
            return true;
        }

    }        
}