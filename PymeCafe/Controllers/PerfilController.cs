using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PymeCafe.Models;

namespace PymeCafe.Controllers
{
    public class PerfilController : Controller
    {
        private readonly MyContext _context;

        // Constructor para la inyección de dependencia
        public PerfilController(MyContext context)
        {
            _context = context;
        }

        // Método para obtener el ID del usuario logueado
        private int GetLoggedUserId()
        {
            return HttpContext.Session.GetInt32("UserId") ?? -1;
        }

        // Acción para mostrar el perfil del usuario logueado
        public async Task<IActionResult> Perfil()
        {
            var userId = GetLoggedUserId();
            if (userId == -1)
            {
                return RedirectToAction("Login", "Cuenta");
            }

            var usuario = await _context.Usuarios.FindAsync(userId);
            if (usuario == null)
            {
                return NotFound();
            }

            return View(usuario);
        }

        // Acción para mostrar los puntos de lealtad del usuario logueado
        public async Task<IActionResult> PuntosLealtad()
        {
            var userId = GetLoggedUserId();
            if (userId == -1)
            {
                return RedirectToAction("Login", "Cuenta");
            }

            var puntosLealtad = await _context.PuntosLealtad
                .Where(p => p.UserId == userId)
                .ToListAsync();

            return View(puntosLealtad);
        }

        // Acción para mostrar las recomendaciones del usuario logueado
        public async Task<IActionResult> Recomendaciones()
        {
            var userId = GetLoggedUserId();
            if (userId == -1)
            {
                return RedirectToAction("Login", "Cuenta");
            }

            var recomendaciones = await _context.Recomendaciones
                .Where(r => r.UserId == userId)
                .ToListAsync();

            return View(recomendaciones);
        }

        // Acción para mostrar las valoraciones de productos del usuario logueado
        public async Task<IActionResult> ValoracionesProducto()
        {
            var userId = GetLoggedUserId();
            if (userId == -1)
            {
                return RedirectToAction("Login", "Cuenta");
            }

            var valoraciones = await _context.ValoracionesProducto
                .Where(v => v.UserId == userId)
                .ToListAsync();

            return View(valoraciones);
        }

        // Acción para mostrar los pedidos del usuario logueado
        public async Task<IActionResult> Pedidos()
        {
            var userId = GetLoggedUserId();
            if (userId == -1)
            {
                return RedirectToAction("Login", "Cuenta");
            }

            var pedidos = await _context.Pedidos
                .Where(p => p.UserId == userId)
                .ToListAsync();

            return View(pedidos);
        }
    }
}
