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
            string tipoUsuario; // Cambié a string para manejar el tipo como texto

            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("VerificarLogin", cn)
                {
                    CommandType = CommandType.StoredProcedure
                };

                // Parámetros de entrada
                cmd.Parameters.AddWithValue("CorreoElectronico", oUsuario.CorreoElectronico);
                cmd.Parameters.AddWithValue("Contraseña", oUsuario.Contraseña);

                // Parámetros de salida para el resultado, UserID y TipoUsuario
                SqlParameter outputResultado = new SqlParameter("Resultado", SqlDbType.VarChar, 250)
                {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(outputResultado);

                SqlParameter outputUserId = new SqlParameter("UserID", SqlDbType.Int)
                {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(outputUserId);

                SqlParameter outputTipoUsuario = new SqlParameter("TipoUsuario", SqlDbType.NVarChar, 50)
                {
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(outputTipoUsuario);

                cn.Open();
                cmd.ExecuteNonQuery();

                resultado = cmd.Parameters["Resultado"].Value.ToString();
                userId = Convert.ToInt32(cmd.Parameters["UserID"].Value); // Obtener el UserID
                tipoUsuario = cmd.Parameters["TipoUsuario"].Value.ToString(); // Obtener el TipoUsuario como string
            }

            // Enviar el resultado a la vista
            ViewData["Resultado"] = resultado;

            // Verificar el resultado
            if (resultado == "Inicio de sesión exitoso")
            {
                // Crear sesión guardando el UserID y el correo electrónico
                HttpContext.Session.SetInt32("UserId", userId); // Guardar el ID del usuario
                HttpContext.Session.SetString("CorreoElectronico", oUsuario.CorreoElectronico); // Guardar el correo electrónico

                // Redirigir a la página correspondiente según el tipo de usuario
                if (tipoUsuario == "Administrador") // Verifica si el tipo es "Administrador"
                {
                    return RedirectToAction("Index", "Admin"); // Cambia "Admin" por el controlador que corresponda
                }
                else // Cliente
                {
                    return RedirectToAction("Inicio", "Publicacion"); // Cliente va al Home
                }
            }
            else
            {
                // Si las credenciales son incorrectas, mostrar el mensaje de error
                ModelState.AddModelError(string.Empty, resultado);
                return View(); // Devolver la vista de login
            }
        }
    }
}
