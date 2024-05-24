using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Cosmechic.Models;
using System.Security.Claims;

namespace Cosmechic.Controllers
{
	public class AvisController : Controller
	{
		private readonly CosmechicsContext _context;

		public AvisController(CosmechicsContext context)
		{
			_context = context;
		}

		// GET: Avis
		public async Task<IActionResult> Index()
		{
			var cosmechicsContext = _context.Avis.Include(a => a.AspNetUser).Include(a => a.Produit);
			return View(await cosmechicsContext.ToListAsync());
		}

		// GET: Avis/Details/5
		public async Task<IActionResult> Details(int? id)
		{
			if (id == null)
			{
				return NotFound();
			}

			var avi = await _context.Avis
				.Include(a => a.AspNetUser)
				.Include(a => a.Produit)
				.FirstOrDefaultAsync(m => m.ReviewId == id);
			if (avi == null)
			{
				return NotFound();
			}

			return View(avi);
		}

        // GET: Avis/Create
        public async Task<IActionResult> Create()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var (userName, produitName) = await GetOrderDetails(userId);

            if (userName == null || produitName == null)
            {
                return RedirectToAction(nameof(Index));
            }

            ViewBag.UserName = userName;
            ViewBag.ProduitNom = produitName;
            return View(new Avi { DateReview = DateTime.Now.Date });
        }

        // POST: Avis/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ReviewId,AspNetUserId,ProduitId,Note,Commentaire,DateReview")] Avi avi)
        {
            if (ModelState.IsValid)
            {
                avi.AspNetUserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                _context.Add(avi);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(avi);
        }
        // GET: Avis/Edit/5
        public async Task<IActionResult> Edit(int? id)
		{
			if (id == null)
			{
				return NotFound();
			}

			var avi = await _context.Avis.FindAsync(id);
			if (avi == null)
			{
				return NotFound();
			}

			var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
			var (userName, produits) = await GetOrderDetails(userId);

			ViewBag.UserName = userName;
			ViewBag.Produits = produits;

			return View(avi);
		}

		// POST: Avis/Edit/5
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> Edit(int id, [Bind("ReviewId,AspNetUserId,ProduitId,Note,Commentaire,DateReview")] Avi avi)
		{
			if (id != avi.ReviewId)
			{
				return NotFound();
			}

			if (ModelState.IsValid)
			{
				try
				{
					_context.Update(avi);
					await _context.SaveChangesAsync();
				}
				catch (DbUpdateConcurrencyException)
				{
					if (!AviExists(avi.ReviewId))
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
			return View(avi);
		}

		// GET: Avis/Delete/5
		public async Task<IActionResult> Delete(int? id)
		{
			if (id == null)
			{
				return NotFound();
			}

			var avi = await _context.Avis
				.Include(a => a.AspNetUser)
				.Include(a => a.Produit)
				.FirstOrDefaultAsync(m => m.ReviewId == id);
			if (avi == null)
			{
				return NotFound();
			}

			return View(avi);
		}

		// POST: Avis/Delete/5
		[HttpPost, ActionName("Delete")]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> DeleteConfirmed(int id)
		{
			var avi = await _context.Avis.FindAsync(id);
			if (avi != null)
			{
				_context.Avis.Remove(avi);
				await _context.SaveChangesAsync();
			}
			return RedirectToAction(nameof(Index));
		}

		private bool AviExists(int id)
		{
			return _context.Avis.Any(e => e.ReviewId == id);
		}

        private async Task<(string, string)> GetOrderDetails(string userId)
        {
            var userName = await _context.AspNetUsers.Where(u => u.Id == userId).Select(u => u.UserName).FirstOrDefaultAsync();

            var produitName = await _context.OrderDetails
                                        .Include(od => od.Produit)
                                        .Where(od => od.OrderHeader.ApplicationUserId == userId)
                                        .Select(od => od.Produit.Nom)
                                        .FirstOrDefaultAsync();

            return (userName, produitName);
        }
    }
}
