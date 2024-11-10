using Microsoft.AspNetCore.Mvc;
using PymeCafe.Filters;
using PymeCafe.Models;
using System.Diagnostics;

namespace PymeCafe.Controllers
{
    [SessionAuthorize]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
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
