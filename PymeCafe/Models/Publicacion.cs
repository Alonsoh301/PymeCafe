namespace PymeCafe.Models
{
    public class Publicacion
    {
        public int PublicacionID { get; set; }

        public string Titulo { get; set; } // No nullable, debe tener un valor
        public string Descripcion { get; set; } // No nullable, debe tener un valor

        public DateTime FechaPublicacion { get; set; } // No nullable

        public string Imagen { get; set; } // Nullable, ya que no todas las publicaciones pueden tener imagen
        public string ImagenRuta { get; set; } // Nullable, si no se requiere la ruta de la imagen

        // Relación con la entidad Usuario (con el campo Usuario.UserId)
        public int? UsuarioID { get; set; } // Nullable, porque no todas las publicaciones pueden tener un usuario asociado
        public Usuario Usuario { get; set; } // Propiedad de navegación

        // Otros campos adicionales si es necesario...
    }

}
