using Microsoft.AspNetCore.Mvc;
using PymeCafe.Models;
using System.Data.SqlClient;
using System.Data;

using System.Data.SqlTypes;
namespace PymeCafe.Controllers
{
    public class AccesoController : Controller
    {
        private readonly string cadena;

        public AccesoController(IConfiguration configuration) =>
            // Obtiene la cadena de conexión del appsettings.json
            cadena = configuration.GetConnectionString("cn");

        public IActionResult Login()
        {
            return View();
        }
        public IActionResult Registrar()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Registrar(Usuario oUsuario)
        {
            string resultado;

            using (SqlConnection cn = new(cadena))
            {
                SqlCommand cmd = new("RegistrarUsuario", cn)
                {
                    CommandType = CommandType.StoredProcedure
                };

                // Agregar los parámetros
                cmd.Parameters.AddWithValue("Nombre", oUsuario.Nombre);
                cmd.Parameters.AddWithValue("Apellido", oUsuario.Apellido);
                cmd.Parameters.AddWithValue("CorreoElectronico", oUsuario.CorreoElectronico);
                cmd.Parameters.AddWithValue("Contraseña", oUsuario.Contraseña);

                // salida
                SqlParameter outputParam = new("Resultado", SqlDbType.VarChar, 100)
                {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(outputParam);

                cn.Open(); // Abrir la conexión
                cmd.ExecuteNonQuery(); // Ejecutar el procedimiento almacenado

                // Obtener parámetro de salida
                resultado = cmd.Parameters["Resultado"].Value.ToString();
            }

            // Enviar el resultado a la vista
            ViewData["Resultado"] = resultado;

            // Verificar el resultado
            if (resultado == "Usuario registrado exitosamente.") 
            {
                return RedirectToAction("Login", "Accesso"); 
            }
            else
            {
                
                ModelState.AddModelError(string.Empty, resultado); 
                return View(oUsuario); 
            }
        }
        [HttpPost]
        public IActionResult Login(Usuario oUsuario)
        {
            string resultado;
            int userId;
            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("VerificarLogin", cn)
                {
                    CommandType = CommandType.StoredProcedure
                };

                // Parámetros de entrada
                cmd.Parameters.AddWithValue("CorreoElectronico", oUsuario.CorreoElectronico);
                cmd.Parameters.AddWithValue("Contraseña", oUsuario.Contraseña);

                // Parámetro de salida para el resultado (si el login fue exitoso o no)
                SqlParameter outputResultado = new SqlParameter("Resultado", SqlDbType.VarChar, 250)
                {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(outputResultado);

                // Parámetro de salida para el UserID
                SqlParameter outputUserId = new SqlParameter("UserID", SqlDbType.Int)
                {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(outputUserId);

                cn.Open();
                cmd.ExecuteNonQuery();

                resultado = cmd.Parameters["Resultado"].Value.ToString();
                userId = Convert.ToInt32(cmd.Parameters["UserID"].Value); // Obtener el UserID si el login es exitoso
            }

            // Enviar el resultado a la vista
            ViewData["Resultado"] = resultado;

            // Verificar el resultado
            if (resultado == "Inicio de sesión exitoso")
            {
                // Crear sesión guardando el UserID y el correo electrónico
                HttpContext.Session.SetInt32("UserId", userId); // Guardar el ID del usuario
                HttpContext.Session.SetString("CorreoElectronico", oUsuario.CorreoElectronico); // Guardar el correo electrónico

                // Redirigir a la página de inicio u otro lugar
                return RedirectToAction("Index", "Home");
            }
            else
            {
                // Si las credenciales son incorrectas, mostrar el mensaje de error
                ModelState.AddModelError(string.Empty, errorMessage: resultado);
                return View(); // Devolver la vista de login
            }
        }


    }
}
