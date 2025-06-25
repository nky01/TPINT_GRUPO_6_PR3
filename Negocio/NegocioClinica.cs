using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;
using System.Reflection.Emit;
using System.Net;

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


        public int actualizarMedico(string legajo, int especialidad, string dni, string nombre, string apellido, char sexo, DateTime fecha, string nacionalidad, string direccion, int localidad, int provincia, string email, string telefono)
        {
            return dao.actualizarMedico(legajo, especialidad, dni, nombre, apellido, sexo, fecha, nacionalidad, direccion, localidad, provincia, email, telefono);

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
        public DataTable GetMedicos()
        {
            DaoClinica dao = new DaoClinica();
            return dao.GetMedicos();
        }

        public DataTable GetMedicosPorLegajo(string legajo)
        {
            DaoClinica dao = new DaoClinica();
            return dao.GetMedicosPorLegajo(legajo);
        }

        public DataTable GetHorariosPorMedico(string legajo)
        {
            return dao.GetHorariosPorLegajo(legajo);
        }

        public DataTable GetTodosLosHorarios()
        {
            return dao.GetTodosLosHorarios();
        }

        public DataTable GetPaciente(string DNIbuscado)
        {
            DaoClinica dao = new DaoClinica();
            DataTable table = dao.getTablaPaciente(DNIbuscado);
            return table;
        }

        public DataTable GetMedico(string legajoBuscado)
        {
            DaoClinica dao = new DaoClinica();
            DataTable table = dao.getTablaMedico(legajoBuscado);
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

        public DataTable ObtenerLocalidadesPorProvincia(int idProvincia)
        {
            DaoClinica dao = new DaoClinica();
            return dao.GetTableLocalidadesPorProvincia(idProvincia);
        }

        public bool ExisteUsuario(string nombreUsuario)
        {
            DaoClinica dao = new DaoClinica();
            return dao.ExisteUsuario(nombreUsuario);
        }


    }        
}