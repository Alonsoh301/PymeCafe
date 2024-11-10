using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PymeCafe.Models;

namespace PymeCafe.Controllers
{
    public class UsuarioController : Controller
    {
        private readonly MyContext _context;

        public UsuarioController(MyContext context)
        {
            _context = context;
        }

        // GET: Usuario
        public async Task<IActionResult> Index()
        {
            return View(await _context.Usuarios.ToListAsync());
        }

        // GET: Usuario/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var usuario = await _context.Usuarios
                .FirstOrDefaultAsync(m => m.UserId == id);
            if (usuario == null)
            {
                return NotFound();
            }

            return View(usuario);
        }

        // GET: Usuario/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Usuario/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("UserId,Nombre,Apellido,CorreoElectronico,Contraseña,TipoUsuario")] Usuario usuario)
        {
            if (ModelState.IsValid)
            {
                _context.Add(usuario);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(usuario);
        }

        // GET: Usuario/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var usuario = await _context.Usuarios.FindAsync(id);
            if (usuario == null)
            {
                return NotFound();
            }
            return View(usuario);
        }

        // POST: Usuario/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("UserId,Nombre,Apellido,CorreoElectronico,Contraseña,TipoUsuario")] Usuario usuario)
        {
            if (id != usuario.UserId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(usuario);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!UsuarioExists(usuario.UserId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(usuario);
        }

        // GET: Usuario/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var usuario = await _context.Usuarios
                .FirstOrDefaultAsync(m => m.UserId == id);
            if (usuario == null)
            {
                return NotFound();
            }

            return View(usuario);
        }

        // POST: Usuario/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var usuario = await _context.Usuarios.FindAsync(id);
                if (usuario != null)
                {
                    _context.Usuarios.Remove(usuario);
                    await _context.SaveChangesAsync();
                }
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                // Registrar el error para analizarlo
                Console.WriteLine("Error al eliminar usuario: " + ex.Message);
                return View("Error"); // Redirigir a una vista de error
            }
        }

        private bool UsuarioExists(int id)
        {
            return _context.Usuarios.Any(e => e.UserId == id);
        }
        public int GetLoggedUserId()
        {
            return HttpContext.Session.GetInt32("UserId") ?? -1;
        }

        public async Task<Usuario> GetUsuarioLogueadoAsync()
        {
            var userId = GetLoggedUserId();
            if (userId == -1)
                return null;

            return await _context.Usuarios.FindAsync(userId);
        }

        public async Task<IActionResult> Perfil()
        {
            var usuario = await GetUsuarioLogueadoAsync();
            if (usuario != null)
            {
                ViewData["UserId"] = usuario.UserId;
                return View(usuario);
            }
            return RedirectToAction("Login", "Cuenta");
        }

        // GET: Editar el perfil del usuario logueado
        public async Task<IActionResult> EditPerfil()
        {
            var userId = GetLoggedUserId();
            if (userId == -1)
                return RedirectToAction("Login", "Cuenta");

            var usuario = await _context.Usuarios.FindAsync(userId);
            if (usuario == null)
                return NotFound();

            return View(usuario);
        }

        // POST: Actualizar el perfil
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UpdatePerfil(Usuario updatedUser)
        {
            var userId = GetLoggedUserId();
            if (userId == -1)
                return NotFound();

            var userToUpdate = await _context.Usuarios.FindAsync(userId);
            if (userToUpdate != null)
            {
                userToUpdate.Nombre = updatedUser.Nombre;
                userToUpdate.Apellido = updatedUser.Apellido;
                userToUpdate.Contraseña = updatedUser.Contraseña;
                userToUpdate.TipoUsuario = updatedUser.TipoUsuario;

                await _context.SaveChangesAsync();
                return RedirectToAction("Perfil");
            }
            return NotFound();
        }

        // Métodos adicionales para secciones del perfil
        public async Task<IActionResult> HistorialCompra()
        {
            var userId = GetLoggedUserId();
            var historialCompra = await _context.Pedidos.Where(h => h.UserId == userId).ToListAsync();
            return View(historialCompra);
        }

        public async Task<IActionResult> PuntosLealtad()
        {
            var userId = GetLoggedUserId();
            var puntosLealtad = await _context.Puntosdelealtads.FirstOrDefaultAsync(p => p.UserId == userId);
            return View(puntosLealtad);
        }

        public async Task<IActionResult> Recomendaciones()
        {
            var userId = GetLoggedUserId();
            var recomendaciones = await _context.Recomendacions.Where(r => r.UserId == userId).ToListAsync();
            return View(recomendaciones);
        }

        public async Task<IActionResult> ValoracionesProducto()
        {
            var userId = GetLoggedUserId();
            var valoraciones = await _context.Valoracionesdeproductos.Where(v => v.UserId == userId).ToListAsync();
            return View(valoraciones);
        }

        public async Task<IActionResult> Pedidos()
        {
            var userId = GetLoggedUserId();
            var pedidos = await _context.Pedidos.Where(p => p.UserId == userId).ToListAsync();
            return View(pedidos);
        }

        public async Task<IActionResult> DetallesPedido(int pedidoId)
        {
            var userId = GetLoggedUserId();
            var detallesPedido = await _context.Detallespedidos
                .Where(d => d.PedidoId == pedidoId && d.Pedido.UserId == userId)
                .ToListAsync();
            return View(detallesPedido);
        }
    }
}
