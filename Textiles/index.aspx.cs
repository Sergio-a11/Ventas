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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Productos_RowCommand(object sender, GridViewCommandEventArgs e)
        {             
            if (e.CommandName == "VerMas")
            {
                GridViewRow gvr = (GridViewRow)((Button)e.CommandSource).NamingContainer;
                int filaIndex = gvr.RowIndex;

                string name = gvr.Cells[1].Text;

                Session.Add("nombre",name);
                Server.Transfer("VistaProducto.aspx");
            }
        }
    }
}