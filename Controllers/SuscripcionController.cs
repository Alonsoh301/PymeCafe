using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PymeCafe.Models;

namespace Pymecafe.Controllers
{
    [Route("Suscripcion")]
    public class SuscripcionController : Controller
    {
        private readonly MyContext _context;

        public SuscripcionController(MyContext context)
        {
            _context = context;
        }

        [HttpPost("Guardar")]
        public async Task<IActionResult> Guardar([FromBody] EmailDto model)
        {
            if (!string.IsNullOrEmpty(model.Email))
            {
                _context.Suscripcion.Add(new Suscripcion { Email = model.Email });
                await _context.SaveChangesAsync();
                return Ok();
            }
            return BadRequest();
        }

        public class EmailDto
        {
            public string Email { get; set; }
        }
    }
}
