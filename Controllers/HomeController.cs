using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PymeCafe.Filters;
using PymeCafe.Models; // Asegúrate de que este espacio de nombres esté incluido
using System.Diagnostics;

namespace PymeCafe.Controllers
{
    [SessionAuthorize]
    public class HomeController : Controller
    {
        private readonly MyContext _context;  // Aquí se agrega el contexto de la base de datos
        private readonly ILogger<HomeController> _logger;

        // Modificamos el constructor para incluir la inyección del contexto
        public HomeController(MyContext context, ILogger<HomeController> logger)
        {
            _context = context; // Se asigna el contexto a la variable de instancia
            _logger = logger;
        }

        // Acción Index que ahora usa el contexto
        public async Task<IActionResult> Index()
        {
            // Mostrar mensaje de éxito si existe
            ViewBag.SuccessMessage = TempData["SuccessMessage"];

            return View();
        }
        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult Logout()
        {
            // Eliminar todas las variables de sesión
            HttpContext.Session.Clear();

            // Establecer un mensaje de éxito
            TempData["SuccessMessage"] = "Has cerrado sesión correctamente.";

            // Redirigir al usuario al login
            return RedirectToAction("Login", "Acceso");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
