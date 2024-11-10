using System;
using System.Collections.Generic;

namespace PymeCafe.Models;

public partial class Notificacion
{
    public int NotificacionId { get; set; }

    public int? UserId { get; set; }

    public string? Mensaje { get; set; }

    public DateTime? FechaEnvio { get; set; }

    public virtual Usuario? User { get; set; }
}
