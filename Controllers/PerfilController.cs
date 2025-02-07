using System;
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
        public int GetLoggedUserId()
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

        // Acción para editar el perfil del usuario logueado
        public async Task<IActionResult> EditPerfil()
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

        // Acción para actualizar el perfil del usuario
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UpdatePerfil(Usuario updatedUser)
        {
            var userId = GetLoggedUserId();
            if (userId == -1)
            {
                return RedirectToAction("Login", "Cuenta");
            }

            var userToUpdate = await _context.Usuarios.FindAsync(userId);
            if (userToUpdate != null)
            {
                userToUpdate.Nombre = updatedUser.Nombre;
                userToUpdate.Apellido = updatedUser.Apellido;
                userToUpdate.Contraseña = updatedUser.Contraseña;

                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Perfil));
            }

            return NotFound();
        }

        // Acción para mostrar los pedidos del usuario
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

        // Acción para mostrar los detalles de un pedido
        public async Task<IActionResult> DetallesPedido(int pedidoId)
        {
            var userId = GetLoggedUserId();
            if (userId == -1)
            {
                return RedirectToAction("Login", "Cuenta");
            }

            var detallesPedido = await _context.Detallespedidos
                .Where(d => d.PedidoId == pedidoId && d.Pedido.UserId == userId)
                .ToListAsync();

            return View(detallesPedido);
        }

        // Acción para mostrar las recomendaciones del usuario
        public async Task<IActionResult> Recomendaciones()
        {
            var userId = GetLoggedUserId();
            if (userId == -1)
            {
                return RedirectToAction("Login", "Cuenta");
            }

            var recomendaciones = await _context.Recomendacions
                .Where(r => r.UserId == userId)
                .ToListAsync();

            return View(recomendaciones);
        }

        // Acción para mostrar los puntos de lealtad del usuario
        public async Task<IActionResult> PuntosLealtad()
        {
            var userId = HttpContext.Session.GetInt32("UserId");

            if (userId == null || userId == -1)
            {
                return RedirectToAction("Login", "Acceso");
            }

            // Obtener los puntos de lealtad del usuario
            var puntosLealtad = await _context.Puntosdelealtads
                .FirstOrDefaultAsync(p => p.UserId == userId);

            if (puntosLealtad == null)
            {
                puntosLealtad = new Puntosdelealtad
                {
                    UserId = userId.Value, // Asegurarse de que el UserId tiene un valor
                    PuntosAcumulados = 0
                };
            }

            return View(puntosLealtad);
        }

        // Acción para mostrar las valoraciones de producto del usuario
        public async Task<IActionResult> ValoracionesProducto()
        {
            var userId = GetLoggedUserId(); // Obtener el ID del usuario logueado desde la sesión

            if (userId == -1) // Si no hay usuario logueado, redirige al login
            {
                return RedirectToAction("Login", "Cuenta");
            }

            // Obtén las valoraciones del usuario logueado desde la base de datos
            var valoraciones = await _context.Valoracionesdeproductos
                .Where(v => v.UserId == userId) // Ajusta si tu campo de relación es diferente
                .ToListAsync();

            // Asegúrate de enviar una lista, incluso si está vacía, para evitar el error
            return View(valoraciones ?? new List<Valoracionesdeproducto>());
        }
    }
}
