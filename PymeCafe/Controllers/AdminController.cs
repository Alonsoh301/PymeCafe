using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PymeCafe.Models;

namespace PymeCafe.Controllers {
    public class AdminController : Controller {
        private readonly MyContext _context;

        public AdminController(MyContext context) {
            _context = context;
        }

        public IActionResult Index() {
            return View();
        }

        [HttpGet]
        public IActionResult RegistrarUsuario() {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> RegistrarUsuario([Bind("Nombre,Apellido,CorreoElectronico,Contraseña,TipoUsuario")] Usuario usuario) {
            _context.Add(usuario);
            await _context.SaveChangesAsync();

            HttpContext.Session.SetInt32("UserId", usuario.UserId); // Guardar el ID del usuario
            HttpContext.Session.SetString("CorreoElectronico", usuario.CorreoElectronico); 

            return RedirectToAction("VerificarUsuario", "Venta", new { CorreoElectronico = usuario.CorreoElectronico, Contraseña = usuario.Contraseña });
        }
    }
}