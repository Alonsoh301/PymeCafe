using System;
using System.Collections.Generic;

namespace PymeCafe.Models;

public partial class Pedido
{
    public int PedidoId { get; set; }

    public int? UserId { get; set; }

    public DateOnly? FechaPedido { get; set; }

    public string? EstadoPedido { get; set; }

    public string? Comentarios { get; set; }

    public virtual ICollection<Detallespedido> Detallespedidos { get; set; } = new List<Detallespedido>();

    public virtual Usuario? User { get; set; }
}
