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
                return RedirectToAction("Login", "Acceso");
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
                return RedirectToAction("Login", "Acceso");
            }

            var usuario = await _context.Usuarios.FindAsync(userId);
            if (usuario == null)
            {
                return NotFound();
            }

            return View(usuario); // Aquí se carga la vista correctamente
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UpdatePerfil(Usuario updatedUser)
        {
            var userId = GetLoggedUserId(); // Se obtiene el ID de la sesión, no de la vista
            if (userId == -1)
            {
                return RedirectToAction("Login", "Acceso");
            }

            try
            {
                using (var connection = _context.Database.GetDbConnection())
                {
                    await connection.OpenAsync();
                    using (var command = connection.CreateCommand())
                    {
                        command.CommandText = "sp_ActualizarUsuario";
                        command.CommandType = System.Data.CommandType.StoredProcedure;

                        command.Parameters.Add(CreateSqlParameter("@UsuarioID", userId));
                        command.Parameters.Add(CreateSqlParameter("@Nombre", updatedUser.Nombre));
                        command.Parameters.Add(CreateSqlParameter("@Apellido", updatedUser.Apellido));
                        command.Parameters.Add(CreateSqlParameter("@CorreoElectronico", updatedUser.CorreoElectronico)); // Ajuste en el nombre del campo

                        await command.ExecuteNonQueryAsync();
                    }
                }


                TempData["Mensaje"] = "Perfil actualizado correctamente.";
                return RedirectToAction(nameof(Perfil));
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "Error al actualizar el perfil.");
                Console.WriteLine($"Error: {ex.Message}");
                return View("EditPerfil", updatedUser);
            }
        }

        // Método auxiliar para crear parámetros SQL seguros
        private static System.Data.Common.DbParameter CreateSqlParameter(string name, object value)
        {
            var parameter = new Microsoft.Data.SqlClient.SqlParameter
            {
                ParameterName = name,
                Value = value ?? DBNull.Value
            };
            return parameter;
        }


        // Acción para mostrar los pedidos del usuario
        public async Task<IActionResult> Pedidos()
        {
            var userId = GetLoggedUserId();
            if (userId == -1)
            {
                return RedirectToAction("Login", "Acceso");
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
                return RedirectToAction("Login", "Acceso");
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
                return RedirectToAction("Login", "Acceso");
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
                return RedirectToAction("Login", "Acceso");
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
