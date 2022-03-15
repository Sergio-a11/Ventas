using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Textiles
{
    public class ConectarBD
    {
        public static String cadena = "Data Source = (LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\S5\\ProgramacionWEB\\Proys\\final\\Textiles\\App_Data\\textiles.mdf;Integrated Security = True; Connect Timeout = 30";
            SqlConnection con = new SqlConnection(cadena);

        public ConectarBD()
        {

        }
        /*
        private static SqlConnection objConexion;
        private static String error;
        public static SqlConnection GetConexion()
        {
            if (objConexion != null)
                return objConexion;
            objConexion = new SqlConnection();
            objConexion.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\S5\\ProgramacionWEB\\Proys\\final\\Textiles\\App_Data\\textiles.mdf;Integrated Security=True;Connect Timeout=30";
            try
            {
                objConexion.Open();
                return objConexion;
            }
            catch (Exception e)
            {
                error = e.Message;
                return null;
            }
        }
        public static void CerrarConexion()
        {
            if (objConexion != null)
                objConexion.Close();
        }*/
    }
}