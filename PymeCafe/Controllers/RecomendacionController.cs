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
    public class RecomendacionController : Controller
    {
        private readonly MyContext _context;

        public RecomendacionController(MyContext context)
        {
            _context = context;
        }

        // GET: Recomendacion
        public async Task<IActionResult> Index()
        {
            var myContext = _context.Recomendacions.Include(r => r.Producto).Include(r => r.User);
            return View(await myContext.ToListAsync());
        }

        // GET: Recomendacion/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var recomendacion = await _context.Recomendacions
                .Include(r => r.Producto)
                .Include(r => r.User)
                .FirstOrDefaultAsync(m => m.RecomendacionId == id);
            if (recomendacion == null)
            {
                return NotFound();
            }

            return View(recomendacion);
        }

        // GET: Recomendacion/Create
        public IActionResult Create()
        {
            ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "ProductoId");
            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId");
            return View();
        }

        // POST: Recomendacion/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("RecomendacionId,UserId,ProductoId,FechaRecomendacion")] Recomendacion recomendacion)
        {
            if (ModelState.IsValid)
            {
                _context.Add(recomendacion);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "ProductoId", recomendacion.ProductoId);
            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId", recomendacion.UserId);
            return View(recomendacion);
        }

        // GET: Recomendacion/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var recomendacion = await _context.Recomendacions.FindAsync(id);
            if (recomendacion == null)
            {
                return NotFound();
            }
            ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "ProductoId", recomendacion.ProductoId);
            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId", recomendacion.UserId);
            return View(recomendacion);
        }

        // POST: Recomendacion/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("RecomendacionId,UserId,ProductoId,FechaRecomendacion")] Recomendacion recomendacion)
        {
            if (id != recomendacion.RecomendacionId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(recomendacion);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!RecomendacionExists(recomendacion.RecomendacionId))
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
            ViewData["ProductoId"] = new SelectList(_context.Productos, "ProductoId", "ProductoId", recomendacion.ProductoId);
            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId", recomendacion.UserId);
            return View(recomendacion);
        }

        // GET: Recomendacion/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var recomendacion = await _context.Recomendacions
                .Include(r => r.Producto)
                .Include(r => r.User)
                .FirstOrDefaultAsync(m => m.RecomendacionId == id);
            if (recomendacion == null)
            {
                return NotFound();
            }

            return View(recomendacion);
        }

        // POST: Recomendacion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var recomendacion = await _context.Recomendacions.FindAsync(id);
            if (recomendacion != null)
            {
                _context.Recomendacions.Remove(recomendacion);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool RecomendacionExists(int id)
        {
            return _context.Recomendacions.Any(e => e.RecomendacionId == id);
        }
    }
}
