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
        public async Task<IActionResult> Index(string searchString, string categoryFilter)
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

            // Filter by category
            if (!string.IsNullOrEmpty(categoryFilter))
            {
                productos = productos.Where(p => p.Categoria.NombreCategoria == categoryFilter);
            }

            return View(await productos.ToListAsync());
        }

        // This action can handle adding items to the cart
        public IActionResult AgregarAlCarrito(int id)
        {
            // Here, you'll handle adding the selected product to the session or a cart system
            return RedirectToAction("Index");
        }

        // This action handles viewing the cart
        public IActionResult Carrito()
        {
            // Logic to display items in the cart
            return View();
        }
        public IActionResult Checkout()
        {
            // Logic to display items in the cart
            return View();
        }
        // Action to handle clearing the cart
        public IActionResult LimpiarCarrito()
        {
            // Logic to clear the cart
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
