using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Net;

namespace Datos
{
    public  class DaoClinica
    {
        AccesoDatos ds = new AccesoDatos();
        
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
                            M.Id_Especialidad_Medico AS idEspecialidad,
                            M.Id_Localidad_Medico AS idLocalidad,
                            M.Id_Provincia_Medico AS idProvincia,
                            E.Descripcion_Especialidad AS Especialidad,
                            L.Descripcion_Localidad AS Localidad,
                            P.Descripcion_Provincia AS Provincia
                        FROM 
                            Medico M
                            INNER JOIN Especialidad E ON M.Id_Especialidad_Medico = E.Id_Especialidad
                            INNER JOIN Localidad L ON M.Id_Localidad_Medico = L.Id_Localidad
                            INNER JOIN Provincia P ON M.Id_Provincia_Medico = P.Id_Provincia
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
                            M.Id_Especialidad_Medico AS idEspecialidad,
                            M.Id_Localidad_Medico AS idLocalidad,
                            M.Id_Provincia_Medico AS idProvincia,
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

        public DataTable GetHorariosPorLegajoMod(string legajo)
        {
            string consulta = @"
                                SELECT 
                                M.Legajo_Medico AS Legajo,
                                M.Nombre_Medico + ' ' + M.Apellido_Medico AS Medico,
                                D.Descripcion_Dia AS Dia, 
                                H.Hora_Inicio_Horario AS EntradaSolo,
                                H.Hora_Salida_Horario AS SalidaSolo,
                                CONCAT(H.Hora_Inicio_Horario, ':00') AS Entrada, 
                                CONCAT(H.Hora_Salida_Horario, ':00') AS Salida
                            FROM Horario H
                            INNER JOIN Dia D ON H.Id_Dia_Horario = D.Id_Dia
                            INNER JOIN Medico M ON H.Legajo_Medico_Horario = M.Legajo_Medico
                            WHERE M.Legajo_Medico = @Legajo
                        ";

            SqlCommand comando = new SqlCommand(consulta);
            comando.Parameters.AddWithValue("@Legajo", legajo);

            return ds.obtenerTablaConComando(comando, "Horario");
        }

        public DataTable GetHorariosPorLegajo(string legajo)
        {
            string consulta = @"
                                SELECT 
                                M.Legajo_Medico AS Legajo,
                                M.Nombre_Medico + ' ' + M.Apellido_Medico AS Medico,
                                D.Descripcion_Dia AS Dia, 
                                CONCAT(H.Hora_Inicio_Horario, ':00') AS HoraInicio, 
                                CONCAT(H.Hora_Salida_Horario, ':00') AS HoraSalida
                            FROM Horario H
                            INNER JOIN Dia D ON H.Id_Dia_Horario = D.Id_Dia
                            INNER JOIN Medico M ON H.Legajo_Medico_Horario = M.Legajo_Medico
                            WHERE M.Legajo_Medico = @Legajo
                        ";

            SqlCommand comando = new SqlCommand(consulta);
            comando.Parameters.AddWithValue("@Legajo", legajo);

            return ds.obtenerTablaConComando(comando, "Horario");
        }

        public DataTable GetTodosLosHorarios()
        {
            string consulta = @"SELECT 
                                M.Legajo_Medico AS Legajo,
                                M.Nombre_Medico + ' ' + M.Apellido_Medico AS Medico,
                                D.Descripcion_Dia AS Dia,
                                CONCAT(H.Hora_Inicio_Horario, ':00') AS HoraInicio,
                                CONCAT(H.Hora_Salida_Horario, ':00') AS HoraSalida
                            FROM Horario H
                            INNER JOIN Dia D ON H.Id_Dia_Horario = D.Id_Dia
                            INNER JOIN Medico M ON H.Legajo_Medico_Horario = M.Legajo_Medico
                            ORDER BY M.Legajo_Medico, D.Id_Dia";

            return ds.ObtenerTabla("Horario", consulta);
        }


        public Usuarios LoginUsuario(string nombre, string contrasenia)
        {
            string consulta = "SELECT * FROM Usuario WHERE Nombre_Usuario = @usuario AND Contrasena_Usuario = @contrasenia AND Activo_Usuario = 1";
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
                        INNER JOIN Provincia pr ON l.Id_Provincia_Localidad = pr.Id_Provincia
                        WHERE p.DNI_Paciente = @dni;";
            SqlCommand comando = new SqlCommand(consultaPaciente);
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

        public int actualizarMedico(string legajo, int especialidad, string dni, string nombre, string apellido, char sexo, DateTime fecha, string nacionalidad, string direccion, int localidad, int provincia, string email, string telefono)
        {
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@Legajo", legajo);
            comando.Parameters.AddWithValue("@IdEspecialidad", especialidad);
            comando.Parameters.AddWithValue("@dni", dni);
            comando.Parameters.AddWithValue("@Nombre", nombre);
            comando.Parameters.AddWithValue("@Apellido", apellido);
            comando.Parameters.AddWithValue("@Sexo", sexo);
            comando.Parameters.AddWithValue("@Fecha", fecha);
            comando.Parameters.AddWithValue("@Nacionalidad", nacionalidad);
            comando.Parameters.AddWithValue("@Direccion", direccion);
            comando.Parameters.AddWithValue("@IdLocalidad", localidad);
            comando.Parameters.AddWithValue("@IdProvincia", provincia);
            comando.Parameters.AddWithValue("@Correo", email);
            comando.Parameters.AddWithValue("@Telefono", telefono);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_ActualizarMedico");
        }

        public int actualizarHorario(string legajo, int entrada, int salida)
        {
            SqlCommand comando = new SqlCommand();
            comando.Parameters.AddWithValue("@Legajo", legajo);
            comando.Parameters.AddWithValue("Entrada", entrada);
            comando.Parameters.AddWithValue("Salida", salida);
            return ds.EjecutarProcedimientoAlmacenado(comando, "SP_ActualizarHorario");
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

        public DataTable GetMedicosPorEspecialidad(int idEspecialidad)
        {
            string consulta = @"SELECT M.Legajo_Medico, 
                                       M.Nombre_Medico + ' ' + M.Apellido_Medico AS NombreCompleto
                                FROM Medico M
                                WHERE M.Id_Especialidad_Medico = @IdEspecialidad";

            SqlCommand comando = new SqlCommand(consulta);
            comando.Parameters.AddWithValue("@IdEspecialidad", idEspecialidad);

            return ds.obtenerTablaConComando(comando, "Medico");
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

        public DataTable GetTableTurnos()
        {
            string consultaTurnos = @"SELECT T.Id_Turno AS ID, 
                                    T.Legajo_Medico_Turno AS Legajo, 
                                    M.Nombre_Medico + ' ' + M.Apellido_Medico AS Medico,
                                    E.Descripcion_Especialidad AS Especialidad,
                                    T.DNI_Paciente_Turno AS DniPaciente,
                                    P.Nombre_Paciente + ' ' + Apellido_Paciente AS Paciente,
                                    D.Descripcion_Dia AS Dia,
                                    FORMAT(CONVERT(date, T.Fecha_Turno), 'dd/MM/yyyy') AS Fecha,
                                    T.Hora_Turno AS Hora,
                                    T.Estado_Turno AS Estado
                                    FROM Turno T
                                    INNER JOIN Medico M ON T.Legajo_Medico_Turno = M.Legajo_Medico
                                    INNER JOIN Especialidad E ON T.Id_Especialidad_Turno = E.Id_Especialidad
                                    INNER JOIN Paciente P ON T.DNI_Paciente_Turno = P.DNI_Paciente
                                    INNER JOIN Dia D ON T.Id_Dia_Turno = D.Id_Dia

                ";
            return ds.ObtenerTabla("Turnos", consultaTurnos);
        }

        public DataTable GetTurno(int idTurno)
        {
            string consulta = @"
                SELECT Id_Turno, Id_Especialidad_Turno, Id_Especialidad_Turno, DNI_Paciente_Turno, Id_Dia_Turno, Estado_Turno
                FROM Turno
                WHERE Id_Turno = @Id_Turno";
            SqlCommand comando = new SqlCommand(consulta);
            comando.Parameters.AddWithValue("@Id_Turno", idTurno);
            return ds.obtenerTablaConComando(comando, "Turno");

        } 

        public DataTable GetTurnosFiltro(string filtro, string valor)
        {
            string consulta = @"SELECT T.Id_Turno AS ID, 
                                    T.Legajo_Medico_Turno AS Legajo, 
                                    M.Nombre_Medico + ' ' + M.Apellido_Medico AS Medico,
                                    E.Descripcion_Especialidad AS Especialidad,
                                    T.DNI_Paciente_Turno AS DniPaciente,
                                    P.Nombre_Paciente + ' ' + Apellido_Paciente AS Paciente,
                                    D.Descripcion_Dia AS Dia,
                                    FORMAT(CONVERT(date, T.Fecha_Turno), 'dd/MM/yyyy') AS Fecha,
                                    T.Hora_Turno AS Hora,
                                    T.Estado_Turno AS Estado
                                    FROM Turno T
                                    INNER JOIN Medico M ON T.Legajo_Medico_Turno = M.Legajo_Medico
                                    INNER JOIN Especialidad E ON T.Id_Especialidad_Turno = E.Id_Especialidad
                                    INNER JOIN Paciente P ON T.DNI_Paciente_Turno = P.DNI_Paciente
                                    INNER JOIN Dia D ON T.Id_Dia_Turno = D.Id_Dia
                                    WHERE T.Estado_Turno <> 'Cancelado' AND
                                    ";
            SqlCommand comando = new SqlCommand();

            switch(filtro)
            {
                case "ID":
                    consulta += "T.Id_Turno = @valor";
                    comando.Parameters.AddWithValue("@valor", int.Parse(valor));
                    break;
                case "Paciente":
                    consulta += "T.DNI_Paciente_Turno = @valor";
                    comando.Parameters.AddWithValue("@valor", valor);
                    break;
                case "Medico":
                    consulta += "T.Legajo_Medico_Turno = @valor";
                    comando.Parameters.AddWithValue("@valor", valor);
                    break;
                case "Especialidad":
                    consulta += "T.Id_Especialidad_Turno = @valor";
                    comando.Parameters.AddWithValue("@valor", valor);
                    break;
                case "Fecha":
                    DateTime fecha = DateTime.Parse(valor);
                    consulta += "T.Fecha_Turno = @valor";
                    comando.Parameters.AddWithValue("@valor", fecha);
                    break;
                case "Estado":
                    consulta += "T.Estado_Turno = @valor";
                    comando.Parameters.AddWithValue("@valor", valor);
                    break;
                default:
                    throw new Exception("Error en el filtro, es invalido");
            }
            comando.CommandText = consulta;
            return ds.obtenerTablaConComando(comando, consulta);

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
                               pr.Descripcion_Provincia AS nombreProvincia,
                               l.Descripcion_Localidad AS nombreLocalidad
                        FROM Paciente p
                        INNER JOIN Localidad l ON p.Id_Localidad_Paciente = l.Id_Localidad
                        INNER JOIN Provincia pr ON l.Id_Provincia_Localidad = pr.Id_Provincia";
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
        public int AgregarTurno(Turno obj)
        {
 

            SqlParameter[] parametros = new SqlParameter[]
            {
                new SqlParameter("@IdEspecialidad", obj.getId_Especialidad()),
                new SqlParameter("@LegajoMedicoTurno", obj.getLegajo_Medico()),
                new SqlParameter("@DNIPaciente", obj.getDNI_Paciente()),
                new SqlParameter("@IdDia", obj.getDia()),
                new SqlParameter("@Fecha", obj.getFecha()),
                new SqlParameter("@Hora", obj.getHora())
            };
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Parameters.AddRange(parametros);

                return ds.EjecutarProcedimientoAlmacenado(cmd, "SP_InsertarTurno");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int BajaTurno(int idTurno)
        {
            SqlCommand command = new SqlCommand();
            command.Parameters.Add(new SqlParameter("@Id_Turno", idTurno));
            return ds.EjecutarProcedimientoAlmacenado(command, "SP_BajaTurno");
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

        public bool existePaciente(string dni)
        {
            string consulta = "SELECT 1 FROM Paciente WHERE DNI_Paciente = @DNI";
            SqlParameter[] parameters =
            {
                new SqlParameter("@DNI", dni)
            };
            return ds.existe(consulta, parameters);
        }

        public bool existeTurno(string id)
        {
            string consulta = "SELECT 1 FROM Turno WHERE Id_Turno = @ID";
            SqlParameter[] parameters =
            {
                new SqlParameter("@ID", id)
            };
            return ds.existe(consulta, parameters);
        }

        public bool existeMedico(string legajo)
        {
            string consulta = "SELECT 1 FROM Medico WHERE Legajo_Medico = @legajo";
            SqlParameter[] parameters =
            {
                new SqlParameter("@legajo", legajo)
            };
            return ds.existe(consulta, parameters);
        }

        public (TimeSpan, TimeSpan) obtenerHorarioMedico(string legajoMedico, string diaLetra)
        {
            TimeSpan horarioInicio = TimeSpan.Zero;
            TimeSpan horarioFinal = TimeSpan.Zero;

            string consulta = @"SELECT Hora_Inicio_Horario AS horaInicio, Hora_Salida_Horario AS horaFinal FROM Horario 
                                WHERE Legajo_Medico_Horario = @Legajo AND Id_Dia_Horario = @Dia";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Legajo", legajoMedico),
                new SqlParameter("@Dia", diaLetra)
            };

            try
            {
                SqlCommand comando = new SqlCommand(consulta);
                comando.Parameters.AddRange(parameters);
                DataTable dataTable = ds.obtenerTablaConComando(comando, "Horario");

                if(dataTable.Rows.Count > 0)
                {
                    horarioInicio = TimeSpan.FromHours(Convert.ToInt32(dataTable.Rows[0]["horaInicio"]));
                    horarioFinal = TimeSpan.FromHours(Convert.ToInt32(dataTable.Rows[0]["horaFinal"]));
                }
            }
            catch (Exception)
            {
                
                throw new Exception("error al intentar obtener el horario del medico"); ;
            }

            return (horarioInicio, horarioFinal);
        
        }

        public bool existeTurnoMedico(string legajoMedico, DateTime fecha, string hora)
        {
            string consulta = @"
                    SELECT 1 FROM Turno
                    WHERE Legajo_Medico_Turno = @Legajo
                    AND Fecha_Turno = @Fecha
                    AND ABS(DATEDIFF(MINUTE, Hora_Turno, @Hora)) < 60";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Legajo", legajoMedico),
                new SqlParameter("@Fecha", fecha),
                new SqlParameter("@Hora", hora)
            };

            return ds.existe(consulta, parameters);
        }

        public bool existeTurnoPaciente(string dniPaciente, DateTime fecha, string hora)
        {
            string consulta = @"
                    SELECT 1 FROM Turno
                    WHERE DNI_Paciente_Turno = @Dni
                    AND Fecha_Turno = @Fecha
                    AND ABS(DATEDIFF(MINUTE, Hora_Turno, @Hora)) < 60";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Dni", dniPaciente),
                new SqlParameter("@Fecha", fecha),
                new SqlParameter("@Hora", hora)
            };

            return ds.existe(consulta, parameters);
        }

        public DataTable ObtenerAusentesPresentesPorFechas(DateTime fechaInicio, DateTime fechaFin)
        {
            string consulta = @"
                SELECT Estado_Turno, COUNT(*) AS Cantidad
                FROM Turno
                WHERE Fecha_Turno BETWEEN @fechaInicio AND @fechaFin
                GROUP BY Estado_Turno";

            SqlCommand cmd = new SqlCommand(consulta);
            cmd.Parameters.AddWithValue("@fechaInicio", fechaInicio);
            cmd.Parameters.AddWithValue("@fechaFin", fechaFin);

            return ds.obtenerTablaConComando(cmd, "Turno");
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
//USE MiraeClinica
//GO

//CREATE PROCEDURE SP_ActualizarHorario
//@Legajo CHAR(5), @Entrada INT, @Salida INT
//AS
//BEGIN 
//	UPDATE Horario
//	SET Hora_Inicio_Horario = @Entrada,
//    Hora_Salida_Horario = @Salida

//	WHERE Legajo_Medico_Horario = @Legajo
//	END
//GO

/*
 * CREATE PROCEDURE SP_InsertarTurno
@IdEspecialidad INT, 
@LegajoMedicoTurno CHAR(5), 
@DNIPaciente NVARCHAR(20), 
@IdDia CHAR(1)

AS
BEGIN 
    	INSERT INTO Turno (Id_Especialidad_Turno, Legajo_Medico_Turno, DNI_Paciente_Turno, Id_Dia_Turno)
    	VALUES (@IdEspecialidad, @LegajoMedicoTurno, @DNIPaciente, @IdDia);


    	DECLARE @IdTurno INT = SCOPE_IDENTITY();

	INSERT INTO Turno (Id_Turno)
	
	VALUES(@IdTurno);
END
*/

/*CREATE PROCEDURE SP_BajaTurno
	@Id_Turno int
AS
BEGIN
UPDATE Turno
SET Estado_Turno = 'Cancelado'
WHERE Id_Turno = @Id_Turno
END
GO
*/