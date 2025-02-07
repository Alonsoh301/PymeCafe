using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PymeCafe.Models;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace PymeCafe.Controllers
{
    public class VentaController : Controller
    {
        private readonly MyContext _context;
        private readonly string cadena;

        public VentaController(MyContext context, IConfiguration configuration)
        {
            cadena = configuration.GetConnectionString("cn");
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> VerificarUsuario(string CorreoElectronico, string Contraseña)
        {
            string resultado;
            int userId;

            // Llama al procedimiento almacenado para verificar la existencia del usuario
            using (SqlConnection cn = new(cadena)) {
                SqlCommand cmd = new("VerificarLogin", cn) {
                    CommandType = CommandType.StoredProcedure
                };

                // Parámetros de entrada
                cmd.Parameters.AddWithValue("CorreoElectronico", CorreoElectronico);
                cmd.Parameters.AddWithValue("Contraseña", Contraseña);

                // Parámetro de salida para el resultado (si el login fue exitoso o no)
                SqlParameter outputResultado = new SqlParameter("Resultado", SqlDbType.VarChar, 250) {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(outputResultado);

                // Parámetro de salida para el UserID
                SqlParameter outputUserId = new SqlParameter("UserID", SqlDbType.Int) {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(outputUserId);

                cn.Open();
                cmd.ExecuteNonQuery();

                resultado = cmd.Parameters["Resultado"].Value.ToString();
                userId = Convert.ToInt32(cmd.Parameters["UserID"].Value);
            }

            if (resultado != "Inicio de sesión exitoso") {
                // Si no existe, redirige a la página de registro
                return RedirectToAction("RegistroUsuario", "Admin");
            }

            // Si existe, redirige a la tienda con el userId para agregar productos al carrito
            return RedirectToAction("Index", "Tienda", new { userId });
        }

        [HttpGet]
        public IActionResult CrearVenta(int userId)
        {
            // Aquí se puede configurar la vista de venta, pasando el userId si es necesario
            ViewData["UserId"] = userId;
            return View();
        }
    }
}
