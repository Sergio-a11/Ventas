using System;
using System.Collections.Generic;
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
                lblPresent.Text = Session["usuariologueado"].ToString();
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
    }
}