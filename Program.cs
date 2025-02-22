using Microsoft.EntityFrameworkCore;
using PymeCafe.Models;
using PymeCafe.Services; // Aseg�rate de agregar esta l�nea para que reconozca ISesionUsuarioService y SesionUsuarioService

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// Habilitar sesiones
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30); // Tiempo de espera de la sesi�n
    options.Cookie.HttpOnly = true; // Evitar acceso al cookie desde JavaScript
    options.Cookie.IsEssential = true; // La sesi�n es esencial para la aplicaci�n
});

// Configurar el DbContext para usar SQL Server
builder.Services.AddDbContext<MyContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("cn")));

// Registrar el servicio de sesi�n y el HttpContextAccessor
builder.Services.AddScoped<ISesionUsuarioService, SesionUsuarioService>();
builder.Services.AddHttpContextAccessor();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts(); // Agregar HSTS en producci�n
}

app.UseHttpsRedirection(); // Redirigir HTTP a HTTPS
app.UseStaticFiles(); // Habilitar archivos est�ticos

app.UseRouting(); // Habilitar el enrutamiento

// Middleware de sesiones debe estar antes de UseAuthorization
app.UseSession(); // Usar sesiones

// Middleware de autenticaci�n (si decides implementarlo en el futuro)
// app.UseAuthentication(); 

// app.UseAuthorization(); (si decides usar autenticaci�n)

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run(); // Ejecutar la aplicaci�n
