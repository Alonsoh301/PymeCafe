using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PymeCafe.Models;
using System.Security.Cryptography;
using System.Text;

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
            usuario.Contraseña = GetHash(usuario.Contraseña);
            _context.Add(usuario);
            await _context.SaveChangesAsync();

            HttpContext.Session.SetInt32("UserId", usuario.UserId); // Guardar el ID del usuario
            HttpContext.Session.SetString("CorreoElectronico", usuario.CorreoElectronico); 

            return RedirectToAction("VerificarUsuario", "Venta", new { CorreoElectronico = usuario.CorreoElectronico, Contraseña = usuario.Contraseña });
        }

        private string GetHash(string contra) {
            SHA256 sha256 = SHA256.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null;

            StringBuilder sb = new StringBuilder();
            stream = sha256.ComputeHash(encoding.GetBytes(contra));

            for (int i = 0; i < stream.Length; i++) {
                sb.AppendFormat("{0:x2}", stream[i]);
            }
            return sb.ToString();
        }
    }
}