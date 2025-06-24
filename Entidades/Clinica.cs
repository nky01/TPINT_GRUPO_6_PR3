using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Clinica
    {
        public Clinica() { }
    }

    public class Usuarios
    {
        private int Id_Usuario;
        private string Nombre_Usuario;
        private string Contrasenia_Usuario;
        private string Rol_Usuario;
        public Usuarios() { }

        public int getId()
        {
            return Id_Usuario;
        }
        public void setId(int id)
        {
            Id_Usuario = id;
        }
        public string getNombre()
        {
            return Nombre_Usuario;
        }
        public void setNombre(string nombre)
        {
            Nombre_Usuario = nombre;
        }
        public string getContrasenia()
        {
            return Contrasenia_Usuario;
        }
        public void setContrasenia(string contra)
        {
            Contrasenia_Usuario = contra;
        }
        public string getRol()
        {
            return Rol_Usuario;
        }
        public void setRol(string rol)
        {
            Rol_Usuario = rol;
        }
    }

    public class Administrador
    {
        private string Legajo_Admin;
        private int IdUsuario_Admin;
        private string DNI_Admin;
        private string Nombre_Admin;
        private string Apellido_Admin;
        private string Direccion_Admin;
        private string CorreoElect_Admin;
        private int Telefono_Admin;

        public Administrador() { }

        public string getLegajo()
        {
            return Legajo_Admin;
        }
        public void setLegajo(string legajo)
        {
            Legajo_Admin = legajo;
        }
        public int getIdUsuario()
        {
            return IdUsuario_Admin;
        }
        public string getDni()
        {
            return DNI_Admin;
        }
        public void setDni(string dni)
        {
            DNI_Admin = dni;
        }
        public string getNombre()
        {
            return Nombre_Admin;
        }
        public void setNombre(string nombre)
        {
            Nombre_Admin = nombre;
        }
        public string getApellido()
        {
            return Apellido_Admin;
        }
        public void setApellido(string apellido) {
            Apellido_Admin = apellido;
        }
        public string getDireccion()
        {
            return Direccion_Admin;
        }
        public void setDireccion(string direccion)
        {
            Direccion_Admin = direccion;
        }
        public string getCorreoEl()
        {
            return CorreoElect_Admin;
        }
        public void setCorreoEl(string correoEl)
        {
            CorreoElect_Admin = correoEl;
        }
        public int getTelefono()
        {
            return Telefono_Admin;
        }
        public void setTelefono(int telefono)
        {
            Telefono_Admin = telefono;
        }
    }

    public class Paciente
    {
        private string DNI_Paciente;
        private int Id_Localidad_Paciente;
        private int Id_Provincia_Paciente;
        private string Nombre_Paciente;
        private string Apellido_Paciente;
        private char Sexo_Paciente;
        private string Nacionalidad_Paciente;
        private DateTime FechaNac_Paciente;
        private string Direccion_Paciente;
        private string CorreoElectronico_Paciente;
        private string Telefono_Paciente;

        public Paciente() { }

        public string getDNI()
        {
            return DNI_Paciente;
        }
        public void setDNI(string dni)
        {
            DNI_Paciente = dni;
        }

        public int getIdLocalidad()
        {
            return Id_Localidad_Paciente;
        }
        public void setIdLocalidad(int idLocalidad)
        {
            Id_Localidad_Paciente = idLocalidad;
        }

        public int getIdProvincia()
        {
            return Id_Provincia_Paciente;
        }
        public void setIdProvincia(int idProvincia)
        {
            Id_Provincia_Paciente = idProvincia;
        }

        public string getNombre()
        {
            return Nombre_Paciente;
        }
        public void setNombre(string nombre)
        {
            Nombre_Paciente = nombre;
        }

        public string getApellido()
        {
            return Apellido_Paciente;
        }
        public void setApellido(string apellido)
        {
            Apellido_Paciente = apellido;
        }

        public char getSexo()
        {
            return Sexo_Paciente;
        }
        public void setSexo(char sexo)
        {
            Sexo_Paciente = sexo;
        }

        public string getNacionalidad()
        {
            return Nacionalidad_Paciente;
        }
        public void setNacionalidad(string nacionalidad)
        {
            Nacionalidad_Paciente = nacionalidad;
        }

        public DateTime getFechaNacimiento()
        {
            return FechaNac_Paciente;
        }
        public void setFechaNacimiento(DateTime fechaNac)
        {
            FechaNac_Paciente = fechaNac;
        }

        public string getDireccion()
        {
            return Direccion_Paciente;
        }
        public void setDireccion(string direccion)
        {
            Direccion_Paciente = direccion;
        }

        public string getCorreoElectronico()
        {
            return CorreoElectronico_Paciente;
        }
        public void setCorreoElectronico(string correo)
        {
            CorreoElectronico_Paciente = correo;
        }

        public string getTelefono()
        {
            return Telefono_Paciente;
        }
        public void setTelefono(string telefono)
        {
            Telefono_Paciente = telefono;
        }
    }

    public class Provincia
    {
        private int Id_Prov;
        private string Descripcion_Prov;

        public Provincia() { }

        public int getId() { return Id_Prov; }
        public string getDescripcion() { return Descripcion_Prov; }
    }

    public class Localidad
    {
        private int Id_Loc;
        private string Descripcion_Loc;

        public Localidad() { }

        public int getId() { return Id_Loc; }
        public string getDescripcion() { return Descripcion_Loc; }
    }


    public class Horario
    {
        private int horarioIngreso;
        private int horarioSalida;
        private char dia;

        public void setHorario(int ingreso, int salida)
        {
            horarioSalida = salida;
            horarioIngreso = ingreso;
        }
        public void setDia(char diaRecibido)
        {
            dia = diaRecibido;
        }

        public char getDia()
        {
            return dia;
        }
        public int getHorarioIngreso()
        {
            return horarioIngreso;
        }
        public int getHorarioSalida()
        {
            return horarioSalida;
        }

    }

    public class Medico
    {
        private string Legajo_Medico;
        private int Id_Localidad_Medico;
        private int Id_Provincia_Medico;
        private string DNI_Medico;
        private string Nombre_Medico;
        private string Apellido_Medico;
        private char Sexo_Medico;
        private string Nacionalidad_Medico;
        private DateTime FechaNac_Medico;
        private string Direccion_Medico;
        private string CorreoElectronico_Medico;
        private string Telefono_Medico;
        private string DNI_Medico;
        private int Id_Especialidad_Medico;
        private List<Horario> horarios;

        public Medico() { }

        public string getDNI()
        {
            return DNI_Medico;
        }
        public void setDNI(string dni)
        {
            DNI_Medico = dni;
        }
        public int getIdEspecialidad()
        {
            return Id_Especialidad_Medico;
        }

        public void setIdEspecialidad(int especialidad)
        {
            Id_Especialidad_Medico = especialidad;
        }
        public string getLegajo()
        {
            return Legajo_Medico;
        }

        public void setLegajo(string legajoNew)
        {
            Legajo_Medico = legajoNew;
        }

        public void SetDNI(string dni)
        {
           DNI_Medico = dni;
        }
        public string getDNI()
        {
            return DNI_Medico;
        }

        public int getIdLocalidad()
        {
            return Id_Localidad_Medico;
        }
        public void setIdLocalidad(int idLocalidad)
        {
            Id_Localidad_Medico = idLocalidad;
        }

        public int getIdProvincia()
        {
            return Id_Provincia_Medico;
        }
        public void setIdProvincia(int idProvincia)
        {
            Id_Provincia_Medico = idProvincia;
        }

        public string getNombre()
        {
            return Nombre_Medico;
        }
        public void setNombre(string nombre)
        {
            Nombre_Medico = nombre;
        }

        public string getApellido()
        {
            return Apellido_Medico;
        }
        public void setApellido(string apellido)
        {
            Apellido_Medico = apellido;
        }

        public char getSexo()
        {
            return Sexo_Medico;
        }
        public void setSexo(char sexo)
        {
            Sexo_Medico = sexo;
        }

        public string getNacionalidad()
        {
            return Nacionalidad_Medico;
        }
        public void setNacionalidad(string nacionalidad)
        {
            Nacionalidad_Medico = nacionalidad;
        }

        public DateTime getFechaNacimiento()
        {
            return FechaNac_Medico;
        }
        public void setFechaNacimiento(DateTime fechaNac)
        {
            FechaNac_Medico = fechaNac;
        }

        public string getDireccion()
        {
            return Direccion_Medico;
        }
        public void setDireccion(string direccion)
        {
            Direccion_Medico = direccion;
        }

        public string getCorreoElectronico()
        {
            return CorreoElectronico_Medico;
        }
        public void setCorreoElectronico(string correo)
        {
            CorreoElectronico_Medico = correo;
        }

        public string getTelefono()
        {
            return Telefono_Medico;
        }
        public void setTelefono(string telefono)
        {
            Telefono_Medico = telefono;
        }

        public void setHorarios(List<Horario> horariosRecibidos)
        {
            horarios = horariosRecibidos;
        }
        public List<Horario> getHorarios()
        {
            return horarios;
        }

    }
}