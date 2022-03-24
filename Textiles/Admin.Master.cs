using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Textiles
{
    public partial class Admin : System.Web.UI.MasterPage
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
            Response.Redirect("index.aspx");
        }
    }
}