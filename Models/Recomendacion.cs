using System;
using System.Collections.Generic;

namespace PymeCafe.Models;

public partial class Recomendacion
{
    public int RecomendacionId { get; set; }

    public int? UserId { get; set; }

    public int? ProductoId { get; set; }

    public DateTime? FechaRecomendacion { get; set; }

    public virtual Producto? Producto { get; set; }

    public virtual Usuario? User { get; set; }
}
