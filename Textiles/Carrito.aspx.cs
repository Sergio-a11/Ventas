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
                  SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\S5\\ProgramacionWEB\\Proys\\final\\Textiles\\bd\\Textiles.mdf;Integrated Security=True;Connect Timeout=30");
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

                String query2 = "select producto.id,ISNULL((select SUM (compra.cantidad) from compra where compra.id_producto=producto.Id)-ISNULL((select SUM (venta.cantidad) from venta where venta.id_producto=producto.Id),0),0) as CantidadTotal from producto where ISNULL((select SUM (compra.cantidad) from compra where compra.id_producto=producto.Id)-ISNULL((select SUM (venta.cantidad) from venta where venta.id_producto=producto.Id),0),0) > 0;";
                SqlCommand command2 = new SqlCommand(query2);
                command2.Connection = con;
                con.Open();
                SqlDataReader reader2 = command2.ExecuteReader();

                while (reader2.Read())
                { 
                    foreach(ClaseProducto listaC in listaCompras)
                    {
                        if(listaC.Identificacion == reader2.GetInt32(0))
                        {
                            if(listaC.Cantidad > reader2.GetInt32(1))
                            {
                                listaC.Cantidad = reader2.GetInt32(1);
                                lblCantidad.Text += "El producto con id "+ reader2.GetInt32(0) + " excede las unidades\n";
                            }
                        }
                    }
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
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\S5\\ProgramacionWEB\\Proys\\final\\Textiles\\bd\\Textiles.mdf;Integrated Security=True;Connect Timeout=300");
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
                commandInsert.ExecuteNonQuery();
                commandInsert.Dispose();

                insertar = "SELECT * FROM clientes WHERE nombre_completo='" + txtNombre.Text + "' AND direccion='" + txtDireccion.Text + "' AND telefono='" + txtTelefono.Text + "' AND correo='" + txtCorreo.Text+"'";
                SqlCommand commandInsert2 = new SqlCommand(insertar);
                reader.Close();
                commandInsert2.Connection = con;
                SqlDataReader sqlDataReader = commandInsert2.ExecuteReader();
                int id = 0;
                if (sqlDataReader.Read())
                {
                    id = sqlDataReader.GetInt32(0);
                }
                commandInsert2.Dispose();
                sqlDataReader.Close();
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
                SqlCommand commandInsertExistente = new SqlCommand(insertarExistente);
                i = 1;
                foreach (ClaseProducto p in listaCompras)
                {
                    commandInsertExistente.Parameters.AddWithValue("@fecha" + i, DateTime.Now);
                    commandInsertExistente.Parameters.AddWithValue("@cantidad" + i, p.Cantidad);
                    commandInsertExistente.Parameters.AddWithValue("@id_cliente" + i, id);
                    commandInsertExistente.Parameters.AddWithValue("@id_producto" + i, p.Identificacion);
                    commandInsertExistente.Parameters.AddWithValue("@observaciones" + i, p.Observaciones);
                    i++;
                    Console.WriteLine(insertar);

                }
                commandInsertExistente.Connection = con;
                commandInsertExistente.ExecuteReader();
                commandInsertExistente.Dispose();
            }
            con.Close();
            reader.Close();
            command.Dispose();
            listaIDs.Clear();
            listaCompras.Clear();
            Server.Transfer("index.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int index = listaIDs.IndexOf(txtEliminarProducto.Text);
            listaIDs.RemoveAt(index);
            Session.Add("ListaCompras", listaIDs);
            Server.Transfer("Carrito.aspx");
        }
    }
}