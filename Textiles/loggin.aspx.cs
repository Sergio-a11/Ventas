using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Textiles
{
	public partial class loggin : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			
		}

		String patron = "ArrastrarYsoltar";
        protected void btnIniciar_Click(object sender, EventArgs e)
        {
			String conectar = ConfigurationManager.ConnectionStrings["textilesConnectionString"].ConnectionString;
			SqlConnection sqlConectar = new SqlConnection(conectar);
			SqlCommand cmd = new SqlCommand("validar", sqlConectar) { CommandType = CommandType.StoredProcedure };
			cmd.Connection.Open();
			cmd.Parameters.Add("@Correo", SqlDbType.VarChar, 50).Value = txtCorreo.Text;
			cmd.Parameters.Add("@Clave", SqlDbType.VarChar, 50).Value = txtContrasena.Text;
			cmd.Parameters.Add("@Patron", SqlDbType.VarChar, 50).Value = patron;
			SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
				Session["usuariologueado"] = txtCorreo.Text;
				Response.Redirect("Index_Admin.aspx");
            }
            else
            {
				lblError.Text = "Correo o Contraseña Incorrectos";
            }
			cmd.Connection.Close();
		}
    }
}