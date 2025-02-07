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
    public class ValoracionesdeproductoController : Controller
    {
        private readonly MyContext _context;

        public ValoracionesdeproductoController(MyContext context)
        {
            _context = context;
        }

        // GET: Valoracionesdeproducto
        public async Task<IActionResult> Index()
        {
            var myContext = _context.Valoracionesdeproductos.Include(v => v.Producto).Include(v => v.User);
            return View(await myContext.ToListAsync());
        }

        // GET: Valoracionesdeproducto/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var valoracionesdeproducto = await _context.Valoracionesdeproductos
                .Include(v => v.Producto)
                .Include(v => v.User)
                .FirstOrDefaultAsync(m => m.ValoracionId == id);
            if (valoracionesdeproducto == null)
            {
                return NotFound();
            }

            return View(valoracionesdeproducto);
        }

        // GET: Valoracionesdeproducto/Create
        public IActionResult Create()
        {
            ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "ProductoId");
            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId");
            return View();
        }

        // POST: Valoracionesdeproducto/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ValoracionId,ProductoId,UserId,Comentario,Calificacion")] Valoracionesdeproducto valoracionesdeproducto)
        {
            if (ModelState.IsValid)
            {
                _context.Add(valoracionesdeproducto);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "ProductoId", valoracionesdeproducto.ProductoId);
            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId", valoracionesdeproducto.UserId);
            return View(valoracionesdeproducto);
        }

        // GET: Valoracionesdeproducto/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var valoracionesdeproducto = await _context.Valoracionesdeproductos.FindAsync(id);
            if (valoracionesdeproducto == null)
            {
                return NotFound();
            }
            ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "ProductoId", valoracionesdeproducto.ProductoId);
            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId", valoracionesdeproducto.UserId);
            return View(valoracionesdeproducto);
        }

        // POST: Valoracionesdeproducto/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ValoracionId,ProductoId,UserId,Comentario,Calificacion")] Valoracionesdeproducto valoracionesdeproducto)
        {
            if (id != valoracionesdeproducto.ValoracionId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(valoracionesdeproducto);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ValoracionesdeproductoExists(valoracionesdeproducto.ValoracionId))
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
            ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "ProductoId", valoracionesdeproducto.ProductoId);
            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId", valoracionesdeproducto.UserId);
            return View(valoracionesdeproducto);
        }

        // GET: Valoracionesdeproducto/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var valoracionesdeproducto = await _context.Valoracionesdeproductos
                .Include(v => v.Producto)
                .Include(v => v.User)
                .FirstOrDefaultAsync(m => m.ValoracionId == id);
            if (valoracionesdeproducto == null)
            {
                return NotFound();
            }

            return View(valoracionesdeproducto);
        }

        // POST: Valoracionesdeproducto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var valoracionesdeproducto = await _context.Valoracionesdeproductos.FindAsync(id);
            if (valoracionesdeproducto != null)
            {
                _context.Valoracionesdeproductos.Remove(valoracionesdeproducto);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ValoracionesdeproductoExists(int id)
        {
            return _context.Valoracionesdeproductos.Any(e => e.ValoracionId == id);
        }
    }
}
