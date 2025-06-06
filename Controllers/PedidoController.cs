﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PymeCafe.Models;

namespace PymeCafe.Controllers
{
    public class PedidoController : Controller
    {
        private readonly MyContext _context;

        public PedidoController(MyContext context)
        {
            _context = context;
        }

        // GET: Pedido
        public async Task<IActionResult> Index()
        {
            var myContext = _context.Pedidos.Include(p => p.User);
            return View(await myContext.ToListAsync());
        }

        // GET: Pedido/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var pedido = await _context.Pedidos
                .Include(p => p.User)
                .FirstOrDefaultAsync(m => m.PedidoId == id);
            if (pedido == null)
            {
                return NotFound();
            }

            return View(pedido);
        }

        // GET: Pedido/Create
        public IActionResult Create()
        {
            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId");
            return View();
        }

        // POST: Pedido/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PedidoId,UserId,FechaPedido,EstadoPedido,Comentarios,Comprobante,DireccionDeEnvio")] Pedido pedido)
        {
            if (ModelState.IsValid)
            {
                _context.Add(pedido);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId", pedido.UserId);
            return View(pedido);
        }

        // GET: Pedido/Edit/5
        [HttpGet("Pedido/Edit/{id}")]

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var pedido = await _context.Pedidos.FindAsync(id);
            if (pedido == null)
            {
                return NotFound();
            }
            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId", pedido.UserId);
            return View(pedido);
        }

        // POST: Pedido/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("Pedido/Edit/{id}")]
        [ValidateAntiForgeryToken]
        

        public async Task<IActionResult> Edit(int id, [Bind("PedidoId,UserId,FechaPedido,EstadoPedido,Comentarios,DireccionDeEnvio")] Pedido pedido, IFormFile nuevoComprobante)
        {
            if (id != pedido.PedidoId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    // Si se subió un nuevo comprobante, convertirlo a binario
                    if (nuevoComprobante != null && nuevoComprobante.Length > 0)
                    {
                        using (var memoryStream = new MemoryStream())
                        {
                            await nuevoComprobante.CopyToAsync(memoryStream);
                            pedido.Comprobante = memoryStream.ToArray();
                        }
                    }
                    else
                    {
                        // Si no se subió uno nuevo, conservar el comprobante original
                        var comprobanteExistente = await _context.Pedidos
                            .AsNoTracking()
                            .Where(p => p.PedidoId == id)
                            .Select(p => p.Comprobante)
                            .FirstOrDefaultAsync();

                        pedido.Comprobante = comprobanteExistente;
                    }

                    _context.Update(pedido);
                    await _context.SaveChangesAsync();
                    return RedirectToAction(nameof(Index));
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PedidoExists(pedido.PedidoId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
            }

            ViewData["UserId"] = new SelectList(_context.Usuarios, "UserId", "UserId", pedido.UserId);
            return View(pedido);
        }

        // GET: Pedido/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var pedido = await _context.Pedidos
                .Include(p => p.User)
                .FirstOrDefaultAsync(m => m.PedidoId == id);
            if (pedido == null)
            {
                return NotFound();
            }

            return View(pedido);
        }

        // POST: Pedido/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var pedido = await _context.Pedidos.FindAsync(id);
            if (pedido != null)
            {
                _context.Pedidos.Remove(pedido);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PedidoExists(int id)
        {
            return _context.Pedidos.Any(e => e.PedidoId == id);
        }
    }
}
