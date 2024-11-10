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
    public class PuntosdelealtadController : Controller
    {
        private readonly MyContext _context;

        public PuntosdelealtadController(MyContext context)
        {
            _context = context;
        }

        // GET: Puntosdelealtad
        public async Task<IActionResult> Index()
        {
            var myContext = _context.Puntosdelealtads.Include(p => p.User);
            return View(await myContext.ToListAsync());
        }

        // GET: Puntosdelealtad/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var puntosdelealtad = await _context.Puntosdelealtads
                .Include(p => p.User)
                .FirstOrDefaultAsync(m => m.PuntosId == id);
            if (puntosdelealtad == null)
            {
                return NotFound();
            }

            return View(puntosdelealtad);
        }

        // GET: Puntosdelealtad/Create
        public IActionResult Create()
        {
            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId");
            return View();
        }

        // POST: Puntosdelealtad/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PuntosId,UserId,PuntosAcumulados")] Puntosdelealtad puntosdelealtad)
        {
            if (ModelState.IsValid)
            {
                _context.Add(puntosdelealtad);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId", puntosdelealtad.UserId);
            return View(puntosdelealtad);
        }

        // GET: Puntosdelealtad/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var puntosdelealtad = await _context.Puntosdelealtads.FindAsync(id);
            if (puntosdelealtad == null)
            {
                return NotFound();
            }
            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId", puntosdelealtad.UserId);
            return View(puntosdelealtad);
        }

        // POST: Puntosdelealtad/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("PuntosId,UserId,PuntosAcumulados")] Puntosdelealtad puntosdelealtad)
        {
            if (id != puntosdelealtad.PuntosId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(puntosdelealtad);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PuntosdelealtadExists(puntosdelealtad.PuntosId))
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
            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId", puntosdelealtad.UserId);
            return View(puntosdelealtad);
        }

        // GET: Puntosdelealtad/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var puntosdelealtad = await _context.Puntosdelealtads
                .Include(p => p.User)
                .FirstOrDefaultAsync(m => m.PuntosId == id);
            if (puntosdelealtad == null)
            {
                return NotFound();
            }

            return View(puntosdelealtad);
        }

        // POST: Puntosdelealtad/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var puntosdelealtad = await _context.Puntosdelealtads.FindAsync(id);
            if (puntosdelealtad != null)
            {
                _context.Puntosdelealtads.Remove(puntosdelealtad);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PuntosdelealtadExists(int id)
        {
            return _context.Puntosdelealtads.Any(e => e.PuntosId == id);
        }
    }
}
