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

        public int actualizarHorario(string legajo, int entrada, int salida)
        {
            return dao.actualizarHorario(legajo, entrada, salida);
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
            return dao.BajaLogicaMedicoPorLegajo(legajo);
        }
        public DataTable getTablaPaciente(string dni)
        {
            return dao.getTablaPaciente(dni);
        }

        public DataTable GetPacientes()
        {
            return dao.GetPacientes();
        }
        public DataTable GetMedicos()
        {
            return dao.GetMedicos();
        }

        public DataTable GetMedicosPorEspecialidad(int idEspecialidad)
        {
            return dao.GetMedicosPorEspecialidad(idEspecialidad);
        }

        public DataTable GetMedicosPorLegajo(string legajo)
        {
            return dao.GetMedicosPorLegajo(legajo);
        }

        public DataTable GetHorarioLegajoMod(string legajo)
        {
            return dao.GetHorariosPorLegajoMod(legajo);
        }

        public DataTable GetTodosLosHorarios()
        {
            return dao.GetTodosLosHorarios();
        }

        public DataTable GetHorariosPorMedico(string legajo)
        {
            return dao.GetHorariosPorLegajo(legajo);         
        }

        public DataTable GetPaciente(string DNIbuscado)
        {
            DataTable table = dao.getTablaPaciente(DNIbuscado);
            return table;
        }

        public bool existePaciente(string dni)
        {
            return dao.existePaciente(dni);
        }

        public bool existeIdTurno(string id)
        {
            return dao.existeTurno(id);
        }
        
        public bool existeMedico(string legajo)
        {
            return dao.existeMedico(legajo);
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


        public DataTable GetTablaTurnos()
        {
            DaoClinica dao =new DaoClinica();
            return dao.GetTableTurnos();
        }

        public DataTable GetTurno(int idTurno)
        {
            DaoClinica dao =new DaoClinica();
            return dao.GetTurno(idTurno);
        }

        public DataTable GetTurnosFiltro(string filtro, string valor)
        {
            DaoClinica dao = new DaoClinica();
            return dao.GetTurnosFiltro(filtro, valor);
        }

        public int AgregarTurno(Turno obj)
        {
            DaoClinica dao = new DaoClinica();
            return dao.AgregarTurno(obj);
        }

        public int BajaTurno(int idTurno)
        {
            DaoClinica dao = new DaoClinica();
            return dao.BajaTurno(idTurno);
        }

        public string diaSemanaLetra(DateTime fecha)
        {
            switch (fecha.DayOfWeek)
            {
                case DayOfWeek.Monday: return "L";
                case DayOfWeek.Tuesday: return "M";
                case DayOfWeek.Wednesday: return "X";
                case DayOfWeek.Thursday: return "J";
                case DayOfWeek.Friday: return "V";
                case DayOfWeek.Saturday: return "S";
                case DayOfWeek.Sunday: return "D";
                default: return "";
            }
        }

        public (TimeSpan, TimeSpan) obtenerHorarioMedico(string legajoMedico, string dia)
        {
            DaoClinica dao = new DaoClinica();
            return dao.obtenerHorarioMedico(legajoMedico, dia);
        }

        public bool DisponibilidadTurno(string legajoMedico, DateTime fecha, string hora)
        {
            DaoClinica dao = new DaoClinica();
            return dao.existeTurnoMedico(legajoMedico, fecha, hora);
        }

        public bool pacienteTieneTurno(string dniPaciente, DateTime fecha, string hora)
        {
            DaoClinica dao = new DaoClinica();
            return dao.existeTurnoPaciente(dniPaciente, fecha, hora);
        }
    }        
}