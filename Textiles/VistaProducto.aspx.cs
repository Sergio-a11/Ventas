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
    public partial class VistaProducto : System.Web.UI.Page
    {
        public static ArrayList listaCompras = new ArrayList();
        public static string id;
        protected void Page_Load(object sender, EventArgs e)
        {
             id = Session["ID"].ToString();
            if (Session["ListaCompras"] != null)
            {
                listaCompras = (ArrayList)Session["ListaCompras"];
                Label1.Text = listaCompras.Count.ToString();
            }
                
        }

        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            listaCompras.Add(id);
            Session.Add("ListaCompras",listaCompras);
            Server.Transfer("index.aspx");
        }
    }
}