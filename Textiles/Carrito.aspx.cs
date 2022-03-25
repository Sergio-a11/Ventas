using Microsoft.ReportingServices.Diagnostics.Internal;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Textiles
{
    public partial class Carrito : System.Web.UI.Page
    {
        public static ArrayList listaIDs = new ArrayList(); 
        public static ArrayList listaCompras = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
              listaIDs.Clear();
              listaIDs = (ArrayList)Session["ListaCompras"];

              SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Universidad\\Textiles\\Textiles\\bd\\textiles.mdf;Integrated Security=True;Connect Timeout=30;Integrated Security=True;Connect Timeout=30");
              foreach (string id in listaIDs)
              {
                  String query = "SELECT * FROM producto WHERE Id=" + id;
                  SqlCommand command = new SqlCommand(query);
                  command.Connection = con;
                  con.Open();
                  SqlDataReader reader = command.ExecuteReader();
                  while (reader.Read())
                  {
                      int identificacion = reader.GetInt32(0);
                      String nombre = reader.GetString(1);
                      String talla = reader.GetString(2);
                      decimal precio = reader.GetDecimal(3);
                      String observaciones = reader.GetString(4);
                      ClaseProducto pr = new ClaseProducto(identificacion,nombre,talla,precio,observaciones);
                      listaCompras.Add(pr);                      
                  }
                con.Close();
                command.Dispose();
            }

            if (listaCompras != null)
            {
                String tabla = "<table border=1 bordercolor=blue>";
                tabla += "<tr>";
                tabla += "<th>ID</th>";
                tabla += "<th>Producto</th>";
                tabla += "<th>Talla</th>";
                tabla += "<th>Precio</th>";
                tabla += "<th>Observaciones</th>";
                tabla += "</tr>";
                foreach (ClaseProducto l in listaCompras)
                {
                    tabla += "<tr>";
                    tabla += "<td>" + l.Identificacion + "</td>";
                    tabla += "<td>" + l.Nombre + "</td>";
                    tabla += "<td>" + l.Talla + "</td>";
                    tabla += "<td>" + l.Precio + "</td>";
                    tabla += "<td>" + l.Observaciones + "</td>";
                    tabla += "</tr>";
                }

                

                
                tabla += "</table>";
                lblLista.Text = tabla;

            }
            
        }

        
    }
}