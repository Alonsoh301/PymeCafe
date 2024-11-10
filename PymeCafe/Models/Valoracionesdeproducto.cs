using System;
using System.Collections.Generic;

namespace PymeCafe.Models;

public partial class Valoracionesdeproducto
{
    public int ValoracionId { get; set; }

    public int? ProductoId { get; set; }

    public int? UserId { get; set; }

    public string? Comentario { get; set; }

    public int? Calificacion { get; set; }

    public virtual Producto? Producto { get; set; }

    public virtual Usuario? User { get; set; }
}
