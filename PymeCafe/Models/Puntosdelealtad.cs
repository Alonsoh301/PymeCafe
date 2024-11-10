using System;
using System.Collections.Generic;

namespace PymeCafe.Models;

public partial class Puntosdelealtad
{
    public int PuntosId { get; set; }

    public int? UserId { get; set; }

    public int? PuntosAcumulados { get; set; }

    public virtual Usuario? User { get; set; }
}
