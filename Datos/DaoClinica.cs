using Entidades;
using System;
using System.Collections.Generic;
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
         string consultaMedico = @"
                        SELECT 
                            M.Legajo_Medico,
                            M.Nombre_Medico,
                            M.Apellido_Medico,
                            M.Sexo_Medico,
                            M.DNI_Medico,
                            M.Nacionalidad_Medico,
                            M.FechaNac_Medico,
                            M.Direccion_Medico,
                            M.CorreoElectronico_Medico,
                            M.Telefono_Medico,
                            E.Descripcion_Especialidad AS Especialidad,
                            L.Descripcion_Localidad AS Localidad,
                            P.Descripcion_Provincia AS Provincia
                        FROM 
                            Medico M
                            INNER JOIN Especialidad E ON M.Id_Especialidad_Medico = E.Id_Especialidad
                            INNER JOIN Localidad L ON M.Id_Localidad_Medico = L.Id_Localidad
                            INNER JOIN Provincia P ON M.Id_Provincia_Medico = P.Id_Provincia;
                    ";

         string consultaMedicoFiltrado = @"
                        SELECT 
                            M.Legajo_Medico,
                            M.Nombre_Medico,
                            M.Apellido_Medico,
                            M.Sexo_Medico,
                            M.DNI_Medico,
                            M.Nacionalidad_Medico,
                            M.FechaNac_Medico,
                            M.Direccion_Medico,
                            M.CorreoElectronico_Medico,
                            M.Telefono_Medico,
                            E.Descripcion_Especialidad AS Especialidad,
                            L.Descripcion_Localidad AS Localidad,
                            P.Descripcion_Provincia AS Provincia
                        FROM 
                            Medico M
                            INNER JOIN Especialidad E ON M.Id_Especialidad_Medico = E.Id_Especialidad
                            INNER JOIN Localidad L ON M.Id_Localidad_Medico = L.Id_Localidad
                            INNER JOIN Provincia P ON M.Id_Provincia_Medico = P.Id_Provincia
                        WHERE 
                            M.Legajo_Medico = @Legajo_Medico;
                    ";

        public DataTable GetMedicos()
        {
            return ds.ObtenerTabla("Medico", consultaMedico);
        }

        public DataTable GetMedicosPorLegajo(string legajo)
        {
            SqlCommand cmd = new SqlCommand(consultaMedicoFiltrado);
            cmd.Parameters.AddWithValue("@Legajo_Medico", legajo);

            return ds.obtenerTablaConComando(cmd, "Medico");
        }

        public Usuarios LoginUsuario(string nombre, string contrasenia)
        {
            string consulta = "SELECT * FROM Usuario WHERE Nombre_Usuario = @usuario AND Contrasena_Usuario = @contrasenia";
            SqlParameter[] parametros = new SqlParameter[]
            {
                new SqlParameter("@usuario", nombre),
                new SqlParameter("@contrasenia", contrasenia)
            };

            SqlDataReader dr = ds.EjecutarConsulta(consulta, parametros);

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

        public int actualizarCliente(string dni, string nombre, string apellido, string direccion, int idLocalidad, int idProvincia, string correo, string telefono, string nuevaNacionalidad, char sexo, DateTime fecha)
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
            comando.Parameters.AddWithValue("@Nacionalidad", nuevaNacionalidad);
            comando.Parameters.AddWithValue("@Sexo", sexo);
            comando.Parameters.AddWithValue("@Fecha", fecha);
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

        public DataTable GetTableEspecialidades()
        {
            DataTable table = ds.ObtenerTabla("Especialidad", "SELECT * FROM Especialidad");
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

        public bool BajaLogicaMedicoPorLegajo(string legajo)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.Add(new SqlParameter("@Legajo", legajo));

            int filasAfectadas = ds.EjecutarProcedimientoAlmacenado(cmd, "SP_BajaLogicaMedico");
            return filasAfectadas > 0;
        }

        public DataTable GetPacientes()
        {
            DataTable table = ds.ObtenerTabla("Paciente", consultaPaciente);
            return table;
        }

        public int AgregarHorario(Horario horario, string legajoMedico)
        {
            string consulta = @"INSERT INTO Horario
                                (Legajo_Medico_Horario, Id_Dia_Horario, Hora_Inicio_Horario, Hora_Salida_Horario)
                                VALUES (@Legajo, @IdDia, @HoraInicio, @HoraSalida)";

            SqlParameter[] parametros = new SqlParameter[]
            {
                new SqlParameter("@Legajo", legajoMedico),
                new SqlParameter("@IdDia", horario.getDia()),
                new SqlParameter("@HoraInicio", horario.getHorarioIngreso()),
                new SqlParameter("@HoraSalida", horario.getHorarioSalida())
            };
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Parameters.AddRange(parametros);

                return ds.EjecutarProcedimientoAlmacenado(cmd, "SP_InsertarHorario");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        

        public int AgregarMedico(Medico medico, Usuarios user)
        {
            SqlParameter[] parametros = new SqlParameter[]
            {
                new SqlParameter("User_Name", user.getNombre()),
                new SqlParameter("User_Pass", user.getContrasenia()),
                new SqlParameter("User_Rol", user.getRol()),
                new SqlParameter("@Legajo",  medico.getLegajo()),
                new SqlParameter("@IdLocalidad", medico.getIdLocalidad()),
                new SqlParameter("@IdProvincia", medico.getIdProvincia()),
                new SqlParameter("@Nombre", medico.getNombre()),
                new SqlParameter("@Apellido", medico.getApellido()),
                new SqlParameter("@Sexo", medico.getSexo()),
                new SqlParameter("@Nacionalidad", medico.getNacionalidad()),
                new SqlParameter("@FechaNac", medico.getFechaNacimiento()),
                new SqlParameter("@Direccion", medico.getDireccion()),
                new SqlParameter("@Correo", medico.getCorreoElectronico()),
                new SqlParameter("@Telefono", medico.getTelefono()),
                new SqlParameter("@Especialidad", medico.getIdEspecialidad()),
                new SqlParameter("@DNI", medico.getDNI())
            };

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Parameters.AddRange(parametros);

                return ds.EjecutarProcedimientoAlmacenado(cmd, "SP_InsertarMedic");
            }
            catch (Exception ex)
            {
                return -1;
            }
        }

        public DataTable getTableLocalidadesPorProvincia(int idProvincia)
        {
            string consulta = @"
                    SELECT l.Id_Localidad, l.Descripcion_Localidad
                    From Localidad l
                    WHERE l.Id_Provincia_Localidad = @IdProvincia";
            SqlCommand comando = new SqlCommand(consulta);
            comando.Parameters.AddWithValue("@IdProvincia", idProvincia);
            return ds.obtenerTablaConComando(comando, "Localidad");
        }

        public bool ExisteUsuario(string nombre)
        {
            string consulta = @"
                    SELECT 1 FROM Usuario WHERE Nombre_Usuario = @NombreUsuario";
            SqlParameter[] parametros = new SqlParameter[]
            {
                new SqlParameter("@NombreUsuario",nombre)
            };

            return ds.existe(consulta, parametros);
        }

    }

   
}

//CREATE PROCEDURE SP_BajaLogicaMedico
//    @Legajo CHAR(5)
//AS
//BEGIN
//    UPDATE Medico
//    SET Activo = 0
//    WHERE Legajo_Medico = @Legajo;
//END

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

//use MiraeClinica
//go

//CREATE PROCEDURE SP_InsertarMedico
//    @Legajo char(5),
//    @IdLocalidad INT,
//    @IdProvincia INT,
//    @Nombre VARCHAR(50),
//    @Apellido VARCHAR(50),
//    @Sexo CHAR(1),
//    @Nacionalidad VARCHAR(50),
//    @FechaNac DATE,
//    @Direccion VARCHAR(100),
//    @Correo VARCHAR(100),
//    @Telefono VARCHAR(20),
//    @IdEspecialidad INT
//AS
//BEGIN
//    INSERT INTO Medico (
//        Legajo_Medico,
//        Id_Localidad_Medico,
//        Id_Provincia_Medico,
//        Nombre_Medico,
//        Apellido_Medico,
//        Sexo_Medico,
//        Nacionalidad_Medico,
//        FechaNac_Medico,
//        Direccion_Medico,
//        CorreoElectronico_Medico,
//        Telefono_Medico,
//        Id_Especialidad_Medico)
//    VALUES (
//        @Legajo,
//        @IdLocalidad,
//        @IdProvincia,
//        @Nombre,
//        @Apellido,
//        @Sexo,
//        @Nacionalidad,
//        @FechaNac,
//        @Direccion,
//        @Correo,
//        @Telefono,
//        @IdEspecialidad)
//END
//CREATE PROCEDURE SP_InsertarHorario

//@Legajo CHAR(5), @IdDia CHAR(1), @HoraInicio INT, @HoraSalida INT

//AS

//BEGIN

//	INSERT INTO Horario (Legajo_Medico_Horario, Id_Dia_Horario, Hora_Inicio_Horario, Hora_Salida_Horario)
//        VALUES(@Legajo, @IdDia, @HoraInicio, @HoraSalida)
//END
//CREATE PROCEDURE SP_InsertarMedico

//@Legajo CHAR(5), @IdLocalidad INT, @IdProvincia INT, @Nombre NVARCHAR(50), @Apellido NVARCHAR(50), @Sexo CHAR(1), 
//@Nacionalidad NVARCHAR(30), @FechaNac DATE, @Direccion NVARCHAR(70), @Correo NVARCHAR(50), @Telefono NVARCHAR(30), @Especialidad INT, @DNI NVARCHAR(30),
//@User_Name NVARCHAR(50), @User_Pass NVARCHAR(255), @User_Rol NVARCHAR(20)

//AS

//BEGIN

	 
//    	INSERT INTO Usuario (Nombre_Usuario, Contrasena_Usuario, Rol_Usuario)
//    	VALUES(@User_Name, @User_Pass, @User_Rol);

//-- aca declaramos que la nueva id es @IdUsuario
//    	DECLARE @IdUsuario INT = SCOPE_IDENTITY();

//INSERT INTO Medico (Legajo_Medico, Id_Localidad_Medico, Id_Provincia_Medico, Nombre_Medico, Apellido_Medico, Sexo_Medico, Nacionalidad_Medico, FechaNac_Medico,
//Direccion_Medico, CorreoElectronico_Medico, Telefono_Medico, Id_Especialidad_Medico, DNI_Medico, Id_Usuario_Medico)
	
//	VALUES(@Legajo, @IdLocalidad, @IdProvincia, @Nombre, @Apellido, @Sexo, @Nacionalidad, @FechaNac, @Direccion, @Correo, @Telefono, @Especialidad, @DNI, @IdUsuario);
//END