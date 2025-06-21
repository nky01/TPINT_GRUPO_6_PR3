using Entidades;
using System;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public  class DaoClinica
    {
        AccesoDatos ds = new AccesoDatos();
        string consultaPaciente = @"
                        SELECT p.DNI_Paciente AS DNI,
                               p.Nombre_Paciente AS Nombre,
                               p.Apellido_Paciente AS Apellido,
                               p.Sexo_Paciente AS Sexo,
                               p.FechaNac_Paciente AS FechaNacimiento,
                               p.Nacionalidad_Paciente AS Nacionalidad,
                               p.Direccion_Paciente AS Direccion,
                               l.Descripcion_Localidad AS Localidad,
                               pr.Descripcion_Provincia AS Provincia,
                               p.CorreoElectronico_Paciente AS Correo,
                               p.Telefono_Paciente AS Telefono,
                               p.Id_Localidad_Paciente AS idLocalidad,
                               p.Id_Provincia_Paciente AS idProvincia
                        FROM Paciente p
                        INNER JOIN Localidad l ON p.Id_Localidad_Paciente = l.Id_Localidad
                        INNER JOIN Provincia pr ON l.Id_Provincia_Localidad = pr.Id_Provincia"
                        ;
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



       public DataTable getTablaPaciente(string dni)
        {
            SqlCommand comando = new SqlCommand(consultaPaciente + "WHERE p.DNI_Paciente = @dni; ");
            comando.Parameters.AddWithValue("@dni", dni);

            return ds.obtenerTablaConComando(comando, "Paciente");
        }

        public int actualizarCliente(string dni, string nombre, string apellido, string direccion, int idLocalidad, int idProvincia, string correo, string telefono)
        {
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@DNI", dni);
            comando.Parameters.AddWithValue("@Nombre", nombre);
            comando.Parameters.AddWithValue("@Apellido", apellido);
            comando.Parameters.AddWithValue("@Direccion", direccion);
            comando.Parameters.AddWithValue("@Correo", correo);
            comando.Parameters.AddWithValue("@Telefono", telefono);
            comando.Parameters.AddWithValue("@IdLocalidad", idLocalidad);
            comando.Parameters.AddWithValue("@IdProvincia", idProvincia);

            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_ActualizarPaciente");
        }


        public DataTable GetTableProvincias()
        {
            DataTable table = ds.ObtenerTabla("Provincia", "SELECT * FROM Provincia");
            return table;
        }

        public DataTable GetTableProvinciasPorLocalidad(int idlocalidad)
        {
            string consulta = @"
                SELECT p.Id_Provincia, p.Descripcion_Provincia
                FROM Provincia p
                INNER JOIN Localidad l
                ON l.Id_Provincia_Localidad = p.Id_Provincia
                WHERE l.Id_Localidad = @IdLocalidad";
            SqlCommand comando = new SqlCommand(consulta);
            comando.Parameters.AddWithValue("@IdLocalidad", idlocalidad);
            return ds.obtenerTablaConComando(comando, "Provincia");
        }

        public DataTable GetTableLocalidades()
        {
            DataTable table = ds.ObtenerTabla("Localidad", "SELECT * FROM Localidad");
            return table;
        }

        public DataTable GetTableLocalidadesPorProvincia(int idprovincia)
        {
            string consulta = @"
                SELECT l.Id_Localidad, l.Descripcion_Localidad
                FROM Localidad L
                WHERE l.Id_Provincia_Localidad = @IdProvincia";
            SqlCommand comando = new SqlCommand(consulta);
            comando.Parameters.AddWithValue("@IdProvincia", idprovincia);
            return ds.obtenerTablaConComando(comando, "Localidad");

        }

        public bool BajaLogicaPorDni(string dni)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.Add(new SqlParameter("@DNI", dni));

            int filasAfectadas = ds.EjecutarProcedimientoAlmacenado(cmd, "SP_BajaLogicaPaciente");

            return filasAfectadas > 0;
        }

        public DataTable GetPacientes()
        {
            DataTable table = ds.ObtenerTabla("Paciente", consultaPaciente);
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