using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PymeCafe.Models;

namespace PymeCafe.Controllers
{
    public class DetallespedidoController : Controller
    {
        private readonly MyContext _context;

        public DetallespedidoController(MyContext context)
        {
            _context = context;
        }

        // GET: Detallespedido
        public async Task<IActionResult> Index()
        {
            var myContext = _context.Detallespedidos.Include(d => d.Pedido).Include(d => d.Producto);
            return View(await myContext.ToListAsync());
        }

        // GET: Detallespedido/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var detallespedido = await _context.Detallespedidos
                .Include(d => d.Pedido)
                .Include(d => d.Producto)
                .FirstOrDefaultAsync(m => m.DetalleId == id);
            if (detallespedido == null)
            {
                return NotFound();
            }

            return View(detallespedido);
        }

        // GET: Detallespedido/Create
        public IActionResult Create()
        {
            ViewData["PedidoId"] = new SelectList(_context.Pedidos, "PedidoId", "PedidoId");
            ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "ProductoId");
            return View();
        }

        // POST: Detallespedido/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("DetalleId,PedidoId,ProductoId,Cantidad,PrecioUnitario")] Detallespedido detallespedido)
        {
            if (ModelState.IsValid)
            {
                _context.Add(detallespedido);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["PedidoId"] = new SelectList(_context.Pedidos, "PedidoId", "PedidoId", detallespedido.PedidoId);
            ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "ProductoId", detallespedido.ProductoId);
            return View(detallespedido);
        }

        // GET: Detallespedido/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var detallespedido = await _context.Detallespedidos.FindAsync(id);
            if (detallespedido == null)
            {
                return NotFound();
            }
            ViewData["PedidoId"] = new SelectList(_context.Pedidos, "PedidoId", "PedidoId", detallespedido.PedidoId);
            ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "ProductoId", detallespedido.ProductoId);
            return View(detallespedido);
        }

        // POST: Detallespedido/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("DetalleId,PedidoId,ProductoId,Cantidad,PrecioUnitario")] Detallespedido detallespedido)
        {
            if (id != detallespedido.DetalleId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(detallespedido);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!DetallespedidoExists(detallespedido.DetalleId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["PedidoId"] = new SelectList(_context.Pedidos, "PedidoId", "PedidoId", detallespedido.PedidoId);
            ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "ProductoId", detallespedido.ProductoId);
            return View(detallespedido);
        }

        // GET: Detallespedido/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var detallespedido = await _context.Detallespedidos
                .Include(d => d.Pedido)
                .Include(d => d.Producto)
                .FirstOrDefaultAsync(m => m.DetalleId == id);
            if (detallespedido == null)
            {
                return NotFound();
            }

            return View(detallespedido);
        }

        // POST: Detallespedido/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var detallespedido = await _context.Detallespedidos.FindAsync(id);
            if (detallespedido != null)
            {
                _context.Detallespedidos.Remove(detallespedido);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool DetallespedidoExists(int id)
        {
            return _context.Detallespedidos.Any(e => e.DetalleId == id);
        }
    }
}
