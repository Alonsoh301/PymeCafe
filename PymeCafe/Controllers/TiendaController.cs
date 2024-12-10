﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PymeCafe.Models;
using System.Linq;
using System.Threading.Tasks;

namespace PymeCafe.Controllers
{
    public class TiendaController : Controller
    {
        private readonly MyContext _context;

        public TiendaController(MyContext context)
        {
            _context = context;
        }

        // GET: Tienda - Muestra los productos disponibles
        public async Task<IActionResult> Index(string searchString, string categoryFilter)
        {
            // Obtener las categorías para el filtro
            ViewBag.Categorias = await _context.Categoria.ToListAsync();

            // Obtener los productos y aplicar filtros
            var productos = _context.Productos.Include(p => p.Categoria).AsQueryable();

            if (!string.IsNullOrEmpty(searchString))
            {
                productos = productos.Where(p => p.NombreProducto.Contains(searchString));
            }

            if (!string.IsNullOrEmpty(categoryFilter))
            {
                productos = productos.Where(p => p.Categoria.NombreCategoria == categoryFilter);
            }

            return View(await productos.ToListAsync());
        }

        // GET: Carrito - Muestra los productos en el carrito
        [HttpGet]
        public async Task<IActionResult> Carrito()
        {
            var userId = HttpContext.Session.GetInt32("UserId");
            if (userId == null || userId == -1)
            {
                return RedirectToAction("Login", "Acceso");
            }

            var pedidoEnProceso = await _context.Pedidos
                .FirstOrDefaultAsync(p => p.UserId == userId && p.EstadoPedido == "En proceso");

            if (pedidoEnProceso == null)
            {
                return View(new List<Detallespedido>());
            }

            var carrito = await _context.Detallespedidos
                .Where(d => d.PedidoId == pedidoEnProceso.PedidoId)
                .Include(d => d.Producto)
                .ToListAsync();

            return View(carrito);
        }

        // POST: Agregar producto al carrito
        [HttpPost]
        public async Task<IActionResult> AgregarAlCarrito([FromBody] CarritoRequest request)
        {
            var userId = HttpContext.Session.GetInt32("UserId");
            if (userId == null || userId == -1)
            {
                return Unauthorized();
            }

            var pedidoEnProceso = await _context.Pedidos
                .FirstOrDefaultAsync(p => p.UserId == userId && p.EstadoPedido == "En proceso");

            if (pedidoEnProceso == null)
            {
                pedidoEnProceso = new Pedido
                {
                    UserId = userId.Value,
                    FechaPedido = DateOnly.FromDateTime(DateTime.Now),
                    EstadoPedido = "En proceso",
                    Comentarios = string.Empty
                };

                _context.Pedidos.Add(pedidoEnProceso);
                await _context.SaveChangesAsync();
            }

            var item = await _context.Detallespedidos
                .FirstOrDefaultAsync(d => d.PedidoId == pedidoEnProceso.PedidoId && d.ProductoId == request.ProductoId);

            if (item != null)
            {
                item.Cantidad += request.Cantidad;
            }
            else
            {
                var detalle = new Detallespedido
                {
                    ProductoId = request.ProductoId,
                    PedidoId = pedidoEnProceso.PedidoId,
                    Cantidad = request.Cantidad,
                    PrecioUnitario = await _context.Productos
                        .Where(p => p.ProductoId == request.ProductoId)
                        .Select(p => p.Precio)
                        .FirstOrDefaultAsync()
                };
                _context.Detallespedidos.Add(detalle);
            }

            await _context.SaveChangesAsync();

            return Ok();
        }

        // POST: Limpiar el carrito
        [HttpPost]
        public async Task<IActionResult> LimpiarCarrito()
        {
            var userId = HttpContext.Session.GetInt32("UserId");
            if (userId == null || userId == -1)
            {
                return RedirectToAction("Login", "Acceso");
            }

            var pedidoEnProceso = await _context.Pedidos
                .FirstOrDefaultAsync(p => p.UserId == userId && p.EstadoPedido == "En proceso");

            if (pedidoEnProceso != null)
            {
                _context.Detallespedidos.RemoveRange(_context.Detallespedidos.Where(d => d.PedidoId == pedidoEnProceso.PedidoId));
                _context.Pedidos.Remove(pedidoEnProceso);
                await _context.SaveChangesAsync();
            }

            return RedirectToAction("Carrito");
        }

        // GET: Checkout - Muestra la vista para el pago
        [HttpGet]
        public IActionResult Checkout()
        {
            return View();
        }

        [HttpPost]
        public IActionResult ProcesarPago()
        {
            // Redirige directamente a la vista de confirmación de pago
          
            return View(ProcesarPago);
        }

    }

    public class CarritoRequest
    {
        public int ProductoId { get; set; }
        public int Cantidad { get; set; }
    }
}
