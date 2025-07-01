using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    class AccesoDatos
    {
        string rutaBDMirae = @"Data Source=localhost\SQLEXPRESS;Initial Catalog=MiraeClinica;Integrated Security=True";
    
        public AccesoDatos() { }

        private SqlConnection ObtenerConexion()
        {
            SqlConnection cn = new SqlConnection(rutaBDMirae);
            try
            {
                cn.Open();
                return cn;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        private SqlDataAdapter ObtenerAdaptador(String consultaSql, SqlConnection cn)
        {
            SqlDataAdapter adaptador;
            try
            {
                adaptador = new SqlDataAdapter(consultaSql, cn);
                return adaptador;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public SqlDataReader EjecutarConsulta(string consulta, SqlParameter[] parametros = null)
        {
            SqlConnection cn = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, cn);
            if(parametros != null)
            {
                cmd.Parameters.AddRange(parametros);
            }
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }

        public DataTable ObtenerTabla(String NombreTabla, String Sql)
        {
            DataSet ds = new DataSet();
            SqlConnection cn = ObtenerConexion();
            if (cn == null)
                throw new Exception("No se pudo establecer la conexión.");

            SqlDataAdapter adp = ObtenerAdaptador(Sql, cn);
            if (adp == null)
                throw new Exception("No se pudo obtener el adaptador de datos.");

            adp.Fill(ds, NombreTabla);
            cn.Close();
            return ds.Tables[NombreTabla];
        }

        public DataTable obtenerTablaConComando(SqlCommand comando, string nombreTabla)
        {
            DataSet ds = new DataSet();
            
            using(SqlConnection cn = ObtenerConexion())
            {
                if (cn == null) throw new Exception("No se pudo establecer la conexion");

                comando.Connection = cn;
                SqlDataAdapter adapter = new SqlDataAdapter(comando);
                adapter.Fill(ds, nombreTabla);
                cn.Close();
            }
            return ds.Tables[nombreTabla];
        }

        public int EjecutarProcedimientoAlmacenado(SqlCommand Comando, String NombreSP)
        {
            int FilasCambiadas;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand();
            cmd = Comando;
            cmd.Connection = Conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            FilasCambiadas = cmd.ExecuteNonQuery();
            Conexion.Close();
            return FilasCambiadas;
        }

        public bool existe(String consulta, SqlParameter[] parameter = null)
        {
            bool estado = false;
            using (SqlConnection connection = ObtenerConexion())
            {
                SqlCommand comando = new SqlCommand(consulta, connection);
                if(parameter != null)
                {
                    comando.Parameters.AddRange(parameter);
                }
                using (SqlDataReader datos = comando.ExecuteReader())
                {
                    if (datos.Read())
                    {
                        estado = true;
                    }

                }
            }

            return estado;
     
        }



        



    }
}
