using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Textiles
{
    public class ClaseProducto
    {
        int identificacion,cantidad;
        String nombre;
        String talla;
        decimal precio;
        String observaciones;

        public ClaseProducto()
        {
            
        }

        public ClaseProducto(int identificacion, string nombre, string talla, decimal precio, string observaciones, int cantidad)
        {
            this.Identificacion = identificacion;
            this.Nombre = nombre;
            this.Talla = talla;
            this.Precio = precio;
            this.Observaciones = observaciones;
            this.cantidad = cantidad;
        }

        public int Identificacion { get => identificacion; set => identificacion = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Talla { get => talla; set => talla = value; }
        public decimal Precio { get => precio; set => precio = value; }
        public string Observaciones { get => observaciones; set => observaciones = value; }
        public int Cantidad { get => cantidad; set => cantidad = value; }
    }
}