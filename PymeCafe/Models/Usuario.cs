using System;
using System.Collections.Generic;

namespace PymeCafe.Models;

public partial class Usuario
{
    public int UserId { get; set; }

    public string? Nombre { get; set; }

    public string? Apellido { get; set; }

    public required string CorreoElectronico { get; set; }

    public required string Contraseña { get; set; }

    public string? TipoUsuario { get; set; }

    public virtual ICollection<Notificacion> Notificacions { get; set; } = new List<Notificacion>();

    public virtual ICollection<Pedido> Pedidos { get; set; } = new List<Pedido>();

    public virtual ICollection<Puntosdelealtad> Puntosdelealtads { get; set; } = new List<Puntosdelealtad>();

    public virtual ICollection<Recomendacion> Recomendacions { get; set; } = new List<Recomendacion>();

    public virtual ICollection<Valoracionesdeproducto> Valoracionesdeproductos { get; set; } = new List<Valoracionesdeproducto>();
}
