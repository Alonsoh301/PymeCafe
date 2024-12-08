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
    public class PublicacionController : Controller
    {
        private readonly MyContext _context;

        public PublicacionController(MyContext context)
        {
            _context = context;
        }

        // GET: Publicacions
        public async Task<IActionResult> Index()
        {
            var myContext = _context.Publicacion.Include(p => p.Usuario);
            return View(await myContext.ToListAsync());
        }

        // GET: Publicacions/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var publicacion = await _context.Publicacion
                .Include(p => p.Usuario)
                .FirstOrDefaultAsync(m => m.PublicacionID == id);
            if (publicacion == null)
            {
                return NotFound();
            }

            return View(publicacion);
        }

        // GET: Publicacions/Create
        public IActionResult Create()
        {
            ViewData["UsuarioID"] = new SelectList(_context.Usuarios, "UserId", "UserId");
            return View();
        }

        // POST: Publicacions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PublicacionID,Titulo,Descripcion,FechaPublicacion,Imagen,ImagenRuta,UsuarioID")] Publicacion publicacion)
        {
            if (ModelState.IsValid)
            {
                _context.Add(publicacion);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["UsuarioID"] = new SelectList(_context.Usuarios, "UserId", "UserId", publicacion.UsuarioID);
            return View(publicacion);
        }

        // GET: Publicacions/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var publicacion = await _context.Publicacion.FindAsync(id);
            if (publicacion == null)
            {
                return NotFound();
            }
            ViewData["UsuarioID"] = new SelectList(_context.Usuarios, "UserId", "UserId", publicacion.UsuarioID);
            return View(publicacion);
        }

        // POST: Publicacions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("PublicacionID,Titulo,Descripcion,FechaPublicacion,Imagen,ImagenRuta,UsuarioID")] Publicacion publicacion)
        {
            if (id != publicacion.PublicacionID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(publicacion);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PublicacionExists(publicacion.PublicacionID))
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
            ViewData["UsuarioID"] = new SelectList(_context.Usuarios, "UserId", "UserId", publicacion.UsuarioID);
            return View(publicacion);
        }

        // GET: Publicacions/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var publicacion = await _context.Publicacion
                .Include(p => p.Usuario)
                .FirstOrDefaultAsync(m => m.PublicacionID == id);
            if (publicacion == null)
            {
                return NotFound();
            }

            return View(publicacion);
        }

        // POST: Publicacions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var publicacion = await _context.Publicacion.FindAsync(id);
            if (publicacion != null)
            {
                _context.Publicacion.Remove(publicacion);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PublicacionExists(int id)
        {
            return _context.Publicacion.Any(e => e.PublicacionID == id);
        }
    }
}
