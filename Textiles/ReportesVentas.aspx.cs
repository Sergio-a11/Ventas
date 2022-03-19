using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Textiles
{
    public partial class ReportesVentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ReportParameter parameter = new ReportParameter("IDCliente",txtFiltro.Text);
            Reporte.LocalReport.SetParameters(parameter);
            Reporte.LocalReport.Refresh();
            Reporte.DataBind();
        }
    }
}