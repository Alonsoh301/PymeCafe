using PymeCafe.Models;

namespace PymeCafe.Services
{
    public interface ISesionUsuarioService
    {
        Usuario? ObtenerUsuarioActual();
    }
}
