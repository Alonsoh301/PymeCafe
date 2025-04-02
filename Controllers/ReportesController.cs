using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using OfficeOpenXml;
using iText.Kernel.Pdf;
using iText.Kernel.Colors;
using iText.Layout;
using iText.Layout.Element;
using PymeCafe.Models; // Ajusta esto según tu proyecto

namespace PymeCafe.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReportesController : Controller
    {
        private readonly MyContext _context;

        public ReportesController(MyContext context)
        {
            _context = context;
        }
        // ✅ Método para cargar la vista de reportes
        [HttpGet("/reportes")]
        public IActionResult Reportes()
        {
            return View("Reportes");
        }
        // ✅ 1. Obtener todas las tablas disponibles
        [HttpGet("tablas")]
        public IActionResult ObtenerTablas()
        {
            var tablasPermitidas = new List<string>
            {
                "Categoria",
                "Clientes",
                "Notificacion",
                "Producto",
                "Publicacion",
                "Recomendacion",
                "Usuario",
                "Pedido",
                "Valoracionesdeproducto",
                "Puntosdelealtad"
            };

            return Ok(tablasPermitidas);
        }

        // ✅ 2. Obtener datos de una tabla específica
        [HttpGet("datos/{tabla}")]
        public IActionResult ObtenerDatos(string tabla)
        {
            var datos = ObtenerDatosDesdeDB(tabla);
            if (datos == null || datos.Count == 0)
            {
                return NotFound("No se encontraron datos para la tabla especificada.");
            }

            return Ok(datos);
        }

        // ✅ 3. Generar reporte en PDF o Excel
        [HttpGet("generar")]
        public IActionResult GenerarReporte(string tabla, string formato)
        {
            var datos = ObtenerDatosDesdeDB(tabla);
            if (datos == null || datos.Count == 0)
            {
                return BadRequest("No se encontraron datos para la tabla especificada.");
            }

            byte[] archivo;
            string contentType, fileName;

            if (formato.ToLower() == "pdf")
            {
                archivo = GenerarPDF(datos, tabla);
                contentType = "application/pdf";
                fileName = $"{tabla}_Reporte.pdf";
            }
            else if (formato.ToLower() == "excel")
            {
                archivo = GenerarExcel(datos, tabla);
                contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                fileName = $"{tabla}_Reporte.xlsx";
            }
            else
            {
                return BadRequest("Formato no soportado. Use 'pdf' o 'excel'.");
            }

            return File(archivo, contentType, fileName);
        }

        // ✅ 4. Obtener los datos desde la base de datos
        private List<Dictionary<string, object>> ObtenerDatosDesdeDB(string tabla)
        {
            switch (tabla.ToLower())
            {
                case "categoria":
                    return _context.Categoria.Select(c => new Dictionary<string, object>
                    {
                        {"ID", c.CategoriaId},
                        {"Nombre", c.NombreCategoria}
                    }).ToList();

                case "clientes":
                    return _context.Usuarios.Select(c => new Dictionary<string, object>
                    {
                        {"Nombre", c.Nombre},
                        {"Apellido", c.Apellido},
                        {"Correo", c.CorreoElectronico}
                    }).ToList();

                case "notificacion":
                    return _context.Notificacions.Select(n => new Dictionary<string, object>
                    {
                        {"ID", n.NotificacionId},
                        {"Usuario", n.UserId},
                        {"Mensaje", n.Mensaje},
                        {"Fecha", n.FechaEnvio}
                    }).ToList();

                case "producto":
                    return _context.Productos.Select(p => new Dictionary<string, object>
                    {
                        {"ID", p.ProductoId},
                        {"Nombre", p.NombreProducto},
                        {"Descripcion", p.Descripcion},
                        {"Precio", p.Precio},
                        {"Categoria", p.CategoriaId}
                    }).ToList();

                case "publicacion":
                    return _context.Publicacion.Select(p => new Dictionary<string, object>
                    {
                        {"ID", p.PublicacionID},
                        {"Titulo", p.Titulo},
                        {"Descripcion", p.Descripcion},
                        {"Fecha", p.FechaPublicacion}
                    }).ToList();

                case "recomendacion":
                    return _context.Recomendacions.Select(r => new Dictionary<string, object>
                    {
                        {"ID", r.RecomendacionId},
                        {"Usuario", r.UserId},
                        {"Producto", r.ProductoId},
                        {"Fecha", r.FechaRecomendacion}
                    }).ToList();

                case "usuario":
                    return _context.Usuarios.Select(u => new Dictionary<string, object>
                    {
                        {"ID", u.UserId},
                        {"Nombre", u.Nombre},
                        {"Correo", u.CorreoElectronico},
                        {"Tipo", u.TipoUsuario}
                    }).ToList();

                case "pedido":
                    return _context.Pedidos.Select(p => new Dictionary<string, object>
                    {
                        {"ID", p.PedidoId},
                        {"Usuario", p.UserId},
                        {"Fecha", p.FechaPedido},
                        {"Estado", p.EstadoPedido},
                        {"Direccion", p.DireccionDeEnvio}
                    }).ToList();

                case "valoracionesdeproducto":
                    return _context.Valoracionesdeproductos.Select(v => new Dictionary<string, object>
                    {
                        {"ID", v.ValoracionId},
                        {"Producto", v.ProductoId},
                        {"Usuario", v.UserId},
                        {"Comentario", v.Comentario},
                        {"Calificación", v.Calificacion}
                    }).ToList();

                case "puntosdelealtad":
                    return _context.Puntosdelealtads.Select(p => new Dictionary<string, object>
                    {
                        {"ID", p.PuntosId},
                        {"Usuario", p.UserId},
                        {"Puntos", p.PuntosAcumulados}
                    }).ToList();

                default:
                    return null;
            }
        }

        // ✅ 5. Generar reporte en PDF con iText 7
        private byte[] GenerarPDF(List<Dictionary<string, object>> datos, string titulo)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                PdfWriter writer = new PdfWriter(ms);
                PdfDocument pdf = new PdfDocument(writer);
                Document document = new Document(pdf);

                document.Add(new Paragraph($"Reporte de {titulo}").SetFontSize(14));


                document.Add(new Paragraph(" "));

                Table table = new Table(datos[0].Count);

                // Agregar encabezados
                foreach (var key in datos[0].Keys)
                {
                    table.AddCell(new Cell().SetBackgroundColor(new DeviceRgb(211, 211, 211)).Add(new Paragraph(key)));

                }

                // Agregar datos
                foreach (var fila in datos)
                {
                    foreach (var value in fila.Values)
                    {
                        table.AddCell(new Cell().Add(new Paragraph(value?.ToString() ?? "NULL")));
                    }
                }

                document.Add(table);
                document.Close();
                return ms.ToArray();
            }
        }

        // ✅ 6. Generar reporte en Excel con EPPlus
        private byte[] GenerarExcel(List<Dictionary<string, object>> datos, string titulo)
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

            using (var package = new ExcelPackage())
            {
                var worksheet = package.Workbook.Worksheets.Add(titulo);

                int colIndex = 1;
                foreach (var key in datos[0].Keys)
                {
                    worksheet.Cells[1, colIndex++].Value = key;
                }

                int rowIndex = 2;
                foreach (var fila in datos)
                {
                    colIndex = 1;
                    foreach (var value in fila.Values)
                    {
                        worksheet.Cells[rowIndex, colIndex++].Value = value?.ToString() ?? "NULL";
                    }
                    rowIndex++;
                }

                return package.GetAsByteArray();
            }
        }
    }
}
