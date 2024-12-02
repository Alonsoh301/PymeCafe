using Microsoft.AspNetCore.Mvc;
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

        // GET: Tienda
        [HttpGet]
        public async Task<IActionResult> Index(string searchString, string categoryFilter, int userId)
        {

            // Fetch all products
            var productos = _context.Productos.Include(p => p.Categoria).AsQueryable();

            // Fetch all categories to populate the filter
            var categorias = await _context.Categoria.ToListAsync();
            ViewBag.Categorias = categorias;

            // Filter by search string
            if (!string.IsNullOrEmpty(searchString))
            {
                productos = productos.Where(p => p.NombreProducto.Contains(searchString) || p.Descripcion.Contains(searchString));
            }

            if(userId != 0 || ViewBag.UserId != null) {
                ViewBag.UserId = userId;
            }

            // Filter by category
            if (!string.IsNullOrEmpty(categoryFilter))
            {
                productos = productos.Where(p => p.Categoria.NombreCategoria == categoryFilter);
            }

            return View(await productos.ToListAsync());
        }

        // This action can handle adding items to the cart
        public async Task<IActionResult> AgregarAlCarrito(int id, string precio, int user) {
            if (HttpContext.Session.GetInt32("UserId") == null) {
                return RedirectToAction("Login", "Acceso");
            }
             
            //var conversion = precio.Replace(",", ".");
            decimal valor = decimal.Parse(precio);
            var pedido = await _context.Pedidos.FirstOrDefaultAsync(x => x.UserId == (user == 0 ? HttpContext.Session.GetInt32("UserId") : user) && x.EstadoPedido == "En proceso");
            if(pedido == null) {
                Pedido nuevo = new Pedido {
                    UserId = user == 0 ? HttpContext.Session.GetInt32("UserId") : user,
                    EstadoPedido = "En proceso",
                    FechaPedido = DateOnly.FromDateTime(DateTime.Now),
                    Comentarios = ""
                };

                _context.Pedidos.Add(nuevo);
                await _context.SaveChangesAsync();

                Detallespedido detalle = new Detallespedido { 
                    ProductoId = id,
                    PedidoId = nuevo.PedidoId,
                    Cantidad = 1,
                    PrecioUnitario = valor
                };

                _context.Detallespedidos.Add(detalle);
                await _context.SaveChangesAsync();
            } else {
                var detalles = await _context.Detallespedidos.FirstOrDefaultAsync(x => x.ProductoId == id && x.PedidoId == pedido.PedidoId);

                if (detalles == null) {
                    Detallespedido detalle = new Detallespedido {
                        ProductoId = id,
                        PedidoId = pedido.PedidoId,
                        Cantidad = 1,
                        PrecioUnitario = valor
                    };
                    _context.Detallespedidos.Add(detalle);
                    await _context.SaveChangesAsync();
                } else {
                    detalles.Cantidad = detalles.Cantidad + 1;
                    _context.Update(detalles);
                    await _context.SaveChangesAsync();
                }
            }

            return RedirectToAction("Index", "Tienda");
        }

        // This action handles viewing the cart
        public IActionResult Carrito()
        {
            var carrito = _context.Pedidos.FirstOrDefault(x => x.UserId == HttpContext.Session.GetInt32("UserId") && x.EstadoPedido == "En proceso");
            if (carrito == null) {
                return View();
            }

            var productos = _context.Detallespedidos.Where(x => x.PedidoId == carrito.PedidoId).Include(x => x.Producto).ToList();
            var total = 0;
            foreach (var product in productos) {
                total += Convert.ToInt32(product.Cantidad * product.PrecioUnitario);
            }
            ViewBag.Total = total;
            return View(productos); 
        }
        public IActionResult Checkout()
        {
            // Logic to display items in the cart
            return View();
        }
        // Action to handle clearing the cart
        public async Task<IActionResult> LimpiarCarrito()
        {
            var carrito = _context.Pedidos.FirstOrDefault(x => x.UserId == HttpContext.Session.GetInt32("UserId") && x.EstadoPedido == "En proceso");
            if (carrito != null) {
                await _context.Detallespedidos.Where(x => x.PedidoId == carrito.PedidoId).ExecuteDeleteAsync();
                await _context.SaveChangesAsync();
            }

            return RedirectToAction("Carrito");
        }
        [HttpPost]
        public ActionResult SubmitPayment(string CardNumber, string CardHolder, string ExpiryMonth, string ExpiryYear, string CVV)
        {
            // Lógica para procesar el pago
            return View();
        }

    }
}

