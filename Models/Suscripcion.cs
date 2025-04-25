
using System;
using System.ComponentModel.DataAnnotations;

namespace PymeCafe.Models
{
    public class Suscripcion
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        public DateTime FechaRegistro { get; set; } = DateTime.Now;
    }
}
