using Microsoft.AspNetCore.Http;
using PymeCafe.Models; 

namespace PymeCafe.Services
{
    public class SesionUsuarioService : ISesionUsuarioService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly MyContext _dbContext; // 👈 Usa MyContext en lugar de MiDbContext

        public SesionUsuarioService(IHttpContextAccessor httpContextAccessor, MyContext dbContext)
        {
            _httpContextAccessor = httpContextAccessor;
            _dbContext = dbContext;
        }

        public Usuario? ObtenerUsuarioActual()
        {
            var userId = _httpContextAccessor.HttpContext?.Session.GetInt32("UserId");

            if (userId == null || userId == -1)
                return null;

            return _dbContext.Usuarios.FirstOrDefault(u => u.UserId == userId);
        }
    }
}
