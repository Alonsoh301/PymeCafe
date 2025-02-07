namespace PymeCafe.Models
{
    public class Publicacion
    {
        public int PublicacionID { get; set; }
        public string Titulo { get; set; }
        public string Descripcion { get; set; }
        public DateTime FechaPublicacion { get; set; }
        public int UsuarioID { get; set; }
        public string ImagenRuta { get; set; }
    }
}
