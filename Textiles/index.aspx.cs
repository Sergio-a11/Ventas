using System;
using System.Collections;
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
    public partial class index : System.Web.UI.Page
    {
        public static ArrayList listaCompras = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ListaCompras"] != null)
            {
                listaCompras = (ArrayList) Session["ListaCompras"];
            }
        }

        protected void Productos_RowCommand(object sender, GridViewCommandEventArgs e)
        {             
            if (e.CommandName == "VerMas")
            {
                GridViewRow gvr = (GridViewRow)((Button)e.CommandSource).NamingContainer;
                int filaIndex = gvr.RowIndex;

                string name = gvr.Cells[0].Text;

                Session.Add("ID",name);
                Session.Add("ListaCompras", listaCompras);
                Server.Transfer("VistaProducto.aspx");
            }
        }
    }
}