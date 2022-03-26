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
            if (Session["ListaCompras"]!=null) { 
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
                    reader.Close();
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
            else
            {
                lblLista.Text = "Aun no hay productos";
            }

        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\Universidad\\Textiles\\Textiles\\bd\\textiles.mdf;Integrated Security=True;Connect Timeout=30;Integrated Security=True;Connect Timeout=30");
            String query = "SELECT * FROM clientes WHERE nombre_completo='"+txtNombre.Text+"' AND direccion='"+txtDireccion.Text+"' AND telefono='"+txtTelefono.Text+"' AND correo='"+txtCorreo.Text+"'";
            SqlCommand command = new SqlCommand(query);
            command.Connection = con;
            con.Open();
            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                String insertar = "INSERT INTO venta (fecha, cantidad, id_cliente, id_producto, observaciones) VALUES ";
                
                int i = 1;
                foreach(ClaseProducto p in listaCompras)
                {
                    insertar += "(@fecha" + i + ", @cantidad" + i + ", @id_cliente" + i + ", @id_producto" + i + ", @observaciones" + i + ")";
                    if (i != listaCompras.Count)
                    {
                        insertar += ", ";
                    }
                    i++;
                    
                }
                SqlCommand commandInsert = new SqlCommand(insertar);
                i = 1;
                foreach (ClaseProducto p in listaCompras)
                {
                    commandInsert.Parameters.AddWithValue("@fecha" + i, DateTime.Now);
                    commandInsert.Parameters.AddWithValue("@cantidad" + i, p.Cantidad);
                    commandInsert.Parameters.AddWithValue("@id_cliente" + i, reader.GetInt32(0));
                    commandInsert.Parameters.AddWithValue("@id_producto" + i, p.Identificacion);
                    commandInsert.Parameters.AddWithValue("@observaciones" + i, p.Observaciones);
                    i++;

                }
                reader.Close();
                
                commandInsert.Connection = con;
                commandInsert.ExecuteReader();
                commandInsert.Dispose();

            }
            else
            {
                String insertar = "INSERT INTO clientes (nombre_completo, direccion, telefono, correo) VALUES(@nombre_completo, @direccion, @telefono, @correo)";
                SqlCommand commandInsert = new SqlCommand(insertar);

                commandInsert.Parameters.AddWithValue("@nombre_completo",txtNombre.Text);
                commandInsert.Parameters.AddWithValue("@direccion", txtDireccion.Text);
                commandInsert.Parameters.AddWithValue("@telefono", txtTelefono.Text);
                commandInsert.Parameters.AddWithValue("@correo", txtCorreo.Text);

                reader.Close();

                commandInsert.Connection = con;
                commandInsert.ExecuteReader();
                commandInsert.Dispose();

                insertar = "SELECT * FROM clientes WHERE nombre_completo=" + txtNombre.Text + " AND direccion=" + txtDireccion.Text + " AND telefono=" + txtTelefono.Text + " AND correo=" + txtCorreo.Text;
                commandInsert = new SqlCommand(insertar);
                commandInsert.Connection = con;
                SqlDataReader reader1 = commandInsert.ExecuteReader();
                String insertarExistente = "INSERT INTO venta (fecha, cantidad, id_cliente, id_producto, observaciones) VALUES ";

                int i = 1;
                foreach (ClaseProducto p in listaCompras)
                {
                    insertarExistente += "(@fecha" + i + ", @cantidad" + i + ", @id_cliente" + i + ", @id_producto" + i + ", @observaciones" + i + ")";
                    if (i != listaCompras.Count)
                    {
                        insertarExistente += ", ";
                    }
                    i++;

                }
                SqlCommand commandInsertExistente = new SqlCommand(insertar);
                i = 1;
                foreach (ClaseProducto p in listaCompras)
                {
                    commandInsertExistente.Parameters.AddWithValue("@fecha" + i, DateTime.Now);
                    commandInsertExistente.Parameters.AddWithValue("@cantidad" + i, p.Cantidad);
                    commandInsertExistente.Parameters.AddWithValue("@id_cliente" + i, reader.GetInt32(0));
                    commandInsertExistente.Parameters.AddWithValue("@id_producto" + i, p.Identificacion);
                    commandInsertExistente.Parameters.AddWithValue("@observaciones" + i, p.Observaciones);
                    i++;
                    Console.WriteLine(insertar);

                }

            }

            con.Close();
            reader.Close();
            command.Dispose();
            listaIDs.Clear();
            listaCompras.Clear();
        }
        
    }
}