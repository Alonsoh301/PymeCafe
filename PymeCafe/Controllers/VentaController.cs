using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PymeCafe.Models;
using System.Threading.Tasks;

namespace PymeCafe.Controllers
{
    public class VentaController : Controller
    {
        private readonly MyContext _context;

        public VentaController(MyContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> VerificarUsuario(string Nombre, string Apellido)
        {
            // Llama al procedimiento almacenado para verificar la existencia del usuario
            var usuarioExistente = await _context.Usuarios
                .FromSqlRaw("EXEC sp_VerificarUsuario @Nombre = {0}, @Apellido = {1}", Nombre, Apellido)
                .FirstOrDefaultAsync();

            if (usuarioExistente == null)
            {
                // Si no existe, redirige a la página de registro
                return RedirectToAction("Registro", "Acceso");
            }

            // Si existe, redirige a la tienda con el userId para agregar productos al carrito
            return RedirectToAction("Index", "Tienda", new { userId = usuarioExistente.UserId });
        }

        [HttpGet]
        public IActionResult CrearVenta(int userId)
        {
            // Aquí se puede configurar la vista de venta, pasando el userId si es necesario
            ViewData["UserId"] = userId;
            return View();
        }
    }
}
