using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Datos
{
    public  class DaoClinica
    {
        AccesoDatos ds = new AccesoDatos();

        public Usuarios LoginUsuario(string nombre, string contrasenia)
        {
            string consulta = "SELECT * FROM Usuario WHERE Nombre_Usuario = @usuario AND Contrasena_Usuario = @contrasenia";
            SqlParameter[] parametros = new SqlParameter[]
            {
                new SqlParameter("@usuario", nombre),
                new SqlParameter("@contrasenia", contrasenia)
            };

            SqlDataReader dr = ds.EjecutarConsulta(consulta);

            if (dr.Read())
            {
                Usuarios u = new Usuarios();
                u.setId(Convert.ToInt32(dr["Id_Usuario"]));
                u.setNombre(dr["Nombre_Usuario"].ToString());
                u.setContrasenia(dr["Contrasena_Usuario"].ToString());
                u.setRol(dr["Rol_Usuario"].ToString());

                dr.Close();
                return u;
            }

            dr.Close();
            return null;
        }

        public int AgregarPaciente(Paciente paciente)
        {
            string consulta = @"INSERT INTO Paciente 
                        (DNI_Paciente, Id_Localidad, Id_Provincia, Nombre_Paciente, Apellido_Paciente, Sexo_Paciente, Nacionalidad_Paciente, FechaNac_Paciente, 
                        Direccion_Paciente, CorreoElectronico_Paciente, Telefono_Paciente)

                        VALUES (@DNI, @IdLocalidad, @IdProvincia, @Nombre, @Apellido, @Sexo, @Nacionalidad, @FechaNac, @Direccion, @Correo, @Telefono)";

            SqlParameter[] parametros = new SqlParameter[]
            {
                new SqlParameter("@DNI", paciente.getDNI()),
                new SqlParameter("@IdLocalidad", paciente.getIdLocalidad()),
                new SqlParameter("@IdProvincia", paciente.getIdProvincia()),
                new SqlParameter("@Nombre", paciente.getNombre()),
                new SqlParameter("@Apellido", paciente.getApellido()),
                new SqlParameter("@Sexo", paciente.getSexo()),
                new SqlParameter("@Nacionalidad", paciente.getNacionalidad()),
                new SqlParameter("@FechaNac", paciente.getFechaNacimiento()),
                new SqlParameter("@Direccion", paciente.getDireccion()),
                new SqlParameter("@Correo", paciente.getCorreoElectronico()),
                new SqlParameter("@Telefono", paciente.getTelefono())
            };

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Parameters.AddRange(parametros);

                return ds.EjecutarProcedimientoAlmacenado(cmd, "SP_InsertarPaciente");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable GetTableProvincias()
        {
            DataTable table = ds.ObtenerTabla("Provincia", "SELECT * FROM Provincia");
            return table;
        }

        public DataTable GetTableLocalidades()
        {
            DataTable table = ds.ObtenerTabla("Localidad", "SELECT * FROM Localidad");
            return table;
        }

    }
}

//CREATE PROCEDURE SP_InsertarPaciente
//    @DNI VARCHAR(20),
//    @IdLocalidad INT,
//    @IdProvincia INT,
//    @Nombre VARCHAR(50),
//    @Apellido VARCHAR(50),
//    @Sexo CHAR(1),
//    @Nacionalidad VARCHAR(50),
//    @FechaNac DATE,
//    @Direccion VARCHAR(100),
//    @Correo VARCHAR(100),
//    @Telefono VARCHAR(20)
//AS
//BEGIN
//    INSERT INTO Paciente (
//        DNI_Paciente,
//        Id_Localidad_Paciente,
//        Id_Provincia_Paciente,
//        Nombre_Paciente,
//        Apellido_Paciente,
//        Sexo_Paciente,
//        Nacionalidad_Paciente,
//        FechaNac_Paciente,
//        Direccion_Paciente,
//        CorreoElectronico_Paciente,
//        Telefono_Paciente)
//    VALUES (
//        @DNI,
//        @IdLocalidad,
//        @IdProvincia,
//        @Nombre,
//        @Apellido,
//        @Sexo,
//        @Nacionalidad,
//        @FechaNac,
//        @Direccion,
//        @Correo,
//        @Telefono)
//END