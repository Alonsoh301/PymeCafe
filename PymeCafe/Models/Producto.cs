using System;
using System.Collections.Generic;

namespace PymeCafe.Models;

public partial class Producto
{
    public int ProductoId { get; set; }

    public string? NombreProducto { get; set; }

    public string? Descripcion { get; set; }

    public decimal? Precio { get; set; }

    public int? CategoriaId { get; set; }

    public virtual Categoria? Categoria { get; set; }

    public virtual ICollection<Detallespedido> Detallespedidos { get; set; } = new List<Detallespedido>();

    public virtual ICollection<Recomendacion> Recomendacions { get; set; } = new List<Recomendacion>();

    public virtual ICollection<Valoracionesdeproducto> Valoracionesdeproductos { get; set; } = new List<Valoracionesdeproducto>();
}
