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
              listaIDs = (ArrayList)Session["ListaCompras"];
              listaCompras.Clear();
              SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Universidad\\Textiles\\Textiles\\bd\\textiles.mdf;Integrated Security=True;Connect Timeout=30;Integrated Security=True;Connect Timeout=30");
              foreach (string id in listaIDs)
              {
                  String query = "SELECT * FROM producto WHERE Id=" + id;
                  SqlCommand command = new SqlCommand(query);
                  command.Connection = con;
                  con.Open();
                  SqlDataReader reader = command.ExecuteReader();
                  bool existente = false;
                  while (reader.Read())
                  {
                      int identificacion = reader.GetInt32(0);
                      String nombre = reader.GetString(1);
                      String talla = reader.GetString(2);
                      decimal precio = reader.GetDecimal(3);
                      String observaciones = reader.GetString(4);
                      foreach (ClaseProducto p in listaCompras)
                      {
                          if (identificacion == p.Identificacion)
                          {
                              existente = true;
                              p.Cantidad = p.Cantidad + 1;
                          }
                      }
                      if (existente == false)
                      {
                          ClaseProducto pr = new ClaseProducto(identificacion, nombre, talla, precio, observaciones, 1);
                          listaCompras.Add(pr);
                      }
                    existente = false;
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
                tabla += "<th>Cantidad</th>";
                tabla += "</tr>";
                foreach (ClaseProducto l in listaCompras)
                {
                    tabla += "<tr>";
                    tabla += "<td>" + l.Identificacion + "</td>";
                    tabla += "<td>" + l.Nombre + "</td>";
                    tabla += "<td>" + l.Talla + "</td>";
                    tabla += "<td>" + l.Precio + "</td>";
                    tabla += "<td>" + l.Observaciones + "</td>";
                    tabla += "<td>" + l.Cantidad + "</td>";
                    tabla += "</tr>";
                }

                

                
                tabla += "</table>";
                lblLista.Text = tabla;

            }
            
        }

        protected void btnMuestrario_Click(object sender, EventArgs e)
        {
            Session.Add("ListaCompras", listaIDs);
            Server.Transfer("index.aspx");
        }
    }
}