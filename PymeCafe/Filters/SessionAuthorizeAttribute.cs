using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace PymeCafe.Filters
{
    public class SessionAuthorizeAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            var userId = context.HttpContext.Session.GetInt32("UserId"); // Verificar si el ID del usuario está en la sesión
            if (userId == null || userId == -1)
            {
                context.Result = new RedirectToActionResult("Login", "Acceso", null);
            }
        }
    }
}
