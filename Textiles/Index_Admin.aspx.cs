using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Textiles
{
    public partial class Index_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuariologueado"] != null)
            {
                //lblPresent.Text = Session["usuariologueado"].ToString();
            }
            else
            {
                Response.Redirect("loggin.aspx");
            }
        }

        protected void btnCerrrar_Click(object sender, EventArgs e)
        {
            Session.Remove("usuariologueado");
            Response.Redirect("loggin.aspx");
        }

        protected void btnFlitro_Click(object sender, EventArgs e)
        {
            int pedido = int.Parse(txtFiltro.Text);
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\S5\\ProgramacionWEB\\Proys\\final\\Textiles\\bd\\Textiles.mdf;Integrated Security=True;Connect Timeout=30");
            String query = "SELECT nombre, cantidad FROM venta join producto  on venta.id_producto = producto.Id where venta.Id=@n";
            SqlCommand command = new SqlCommand(query);
            command.Parameters.AddWithValue("@n", pedido);
            command.Connection = con;
            con.Open();
            SqlDataReader reader = command.ExecuteReader();

            ArrayList unds = new ArrayList();
            ArrayList prod = new ArrayList();
            while (reader.Read())
            {
                prod.Add(reader.GetString(0));
                unds.Add(Convert.ToInt32(reader.GetInt32(1)));
            }
            reader.Close();
            con.Close();
            command.Dispose();
            txtFiltro.Text = prod.ToString() + unds.ToString();
            ventas.Series["Series1"].Points.DataBindXY(prod, unds);
        }
    }
}