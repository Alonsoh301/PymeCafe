using Microsoft.EntityFrameworkCore;
using PymeCafe.Models;
using PymeCafe.Services; // Asegúrate de agregar esta línea para que reconozca ISesionUsuarioService y SesionUsuarioService

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// Habilitar sesiones
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30); // Tiempo de espera de la sesión
    options.Cookie.HttpOnly = true; // Evitar acceso al cookie desde JavaScript
    options.Cookie.IsEssential = true; // La sesión es esencial para la aplicación
});

// Configurar el DbContext para usar SQL Server
builder.Services.AddDbContext<MyContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("cn")));

// Registrar el servicio de sesión y el HttpContextAccessor
builder.Services.AddScoped<ISesionUsuarioService, SesionUsuarioService>();
builder.Services.AddHttpContextAccessor();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts(); // Agregar HSTS en producción
}

app.UseHttpsRedirection(); // Redirigir HTTP a HTTPS
app.UseStaticFiles(); // Habilitar archivos estáticos

app.UseRouting(); // Habilitar el enrutamiento

// Middleware de sesiones debe estar antes de UseAuthorization
app.UseSession(); // Usar sesiones

// Middleware de autenticación (si decides implementarlo en el futuro)
// app.UseAuthentication(); 

// app.UseAuthorization(); (si decides usar autenticación)

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run(); // Ejecutar la aplicación
