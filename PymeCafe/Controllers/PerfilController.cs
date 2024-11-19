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
                return NotFound();
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

        // Otras acciones relacionadas con el perfil
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
    }
}
