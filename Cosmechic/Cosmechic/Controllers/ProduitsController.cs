using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Cosmechic.Models;
using Cosmechic.ViewModels;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;

namespace Cosmechic.Controllers
{
    public class ProduitsController : Controller
    {
        private readonly CosmechicsContext _context;
        private readonly IWebHostEnvironment _hostingEnvironment;

        public ProduitsController(CosmechicsContext context, IWebHostEnvironment hostingEnvironment)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;
        }

        // GET: Produits
        public async Task<IActionResult> Index(int? id = 1, int page = 1, int pageSize = 20)
        {
            var categorie = await _context.Categories.Include(c => c.Produits).FirstOrDefaultAsync(c => c.CategorieId == id);

            if (categorie == null)
            {
                return NotFound("Catégorie non trouvée.");
            }

            var produitsQuery = _context.Produits.Where(p => p.CategorieId == id);

            var paginatedProduits = await PaginatedList<Produit>.CreateAsync(produitsQuery, page, pageSize);

            ViewBag.CategorieNom = categorie.Nom;
            ViewBag.CategorieId = id;

            return View(paginatedProduits);
        }


        // GET: Produits/Details/5
        [Authorize]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || !_context.Produits.Any())
            {
                return NotFound();
            }

            var produit = await _context.Produits
                .Include(p => p.Categorie)
                .FirstOrDefaultAsync(m => m.ProduitId == id);
            if (produit == null)
            {
                return NotFound();
            }

            return View(produit);
        }

        // GET: Produits/Create
        [Authorize(Roles = "Admin")]
        public IActionResult Create(int? Id)
        {
            var categories = _context.Categories.ToList();
            ViewData["CategorieId"] = Id;
            return View();
        }

        // POST: Produits/Create
        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProduitId,Nom,CategorieId,Description,Prix,Stock,Disponible,Image")] Produit produit, IFormFile Image)
        {
            if (ModelState.IsValid)
            {
                if (Image != null)
                {
                    string uploadsFolder = Path.Combine(_hostingEnvironment.WebRootPath, "Images_Produits");
                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + Image.FileName;
                    string filePath = Path.Combine(uploadsFolder, uniqueFileName);

                    using (var fileStream = new FileStream(filePath, FileMode.Create))
                    {
                        await Image.CopyToAsync(fileStream);
                    }

                    produit.Image = uniqueFileName;
                }
                _context.Add(produit);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index", "Produits", new { id = produit.CategorieId });
            }
            else
            {
                foreach (var modelState in ViewData.ModelState.Values)
                {
                    foreach (var error in modelState.Errors)
                    {
                        ModelState.AddModelError("", error.ErrorMessage);
                    }
                }
            }
            var categories = _context.Categories.ToList();
            ViewBag.CategorieId = new SelectList(categories, "CategorieId", "Nom");

            return View(produit);
        }

        // GET: Produits/Edit/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Produits == null)
            {
                return NotFound();
            }

            var produit = await _context.Produits.FindAsync(id);
            if (produit == null)
            {
                return NotFound();
            }
            var categories = _context.Categories.ToList();
            ViewBag.CategorieId = new SelectList(categories, "CategorieId", "Nom");

            return View(produit);
        }

        // POST: Produits/Edit/5
        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProduitId,Nom,CategorieId,Description,Prix,Stock,Disponible,Image")] Produit produit, IFormFile Image)
        {
            if (id != produit.ProduitId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (Image != null)
                    {
                        string uploadsFolder = Path.Combine(_hostingEnvironment.WebRootPath, "Images_Produits");
                        string uniqueFileName = Guid.NewGuid().ToString() + "_" + Image.FileName;
                        string filePath = Path.Combine(uploadsFolder, uniqueFileName);

                        using (var fileStream = new FileStream(filePath, FileMode.Create))
                        {
                            await Image.CopyToAsync(fileStream);
                        }

                        produit.Image = uniqueFileName;
                    }
                    _context.Update(produit);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProduitExists(produit.ProduitId))
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
            var categories = _context.Categories.ToList();
            ViewBag.CategorieId = new SelectList(categories, "CategorieId", "Nom");
            return View(produit);
        }


        // GET: Produits/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || !_context.Produits.Any())
            {
                return NotFound();
            }

            var produit = await _context.Produits
                .Include(p => p.Categorie)
                .FirstOrDefaultAsync(m => m.ProduitId == id);
            if (produit == null)
            {
                return NotFound();
            }

            return View(produit);
        }

        // POST: Produits/Delete/5
        [HttpPost, ActionName("Delete")]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Produits == null)
            {
                return Problem("Entity set 'CosmechicContext.Produits'  is null.");
            }
            var produit = await _context.Produits.FindAsync(id);
            if (produit != null)
            {
                _context.Produits.Remove(produit);
                await _context.SaveChangesAsync();
            }

            return RedirectToAction(nameof(Index));
        }

        private bool ProduitExists(int id)
        {
            return _context.Produits.Any(e => e.ProduitId == id);
        }

        public async Task<IActionResult> Rechercher(string query)
        {
            if (string.IsNullOrWhiteSpace(query))
            {
                return View("Index");
            }

            var produit = await _context.Produits
                                        .FirstOrDefaultAsync(p => p.Nom.Contains(query));
            if (produit != null)
            {
                return RedirectToAction("Details", new { id = produit.ProduitId });
            }
            else
            {
                var produits = await _context.Produits
                                             .Where(p => p.Nom.Contains(query))
                                             .ToListAsync();
                return View("ResultatsRecherche", produits);
            }
        }

        public IActionResult ItemDetails(int productId)
        {
            var product = _context.Produits
                                  .Include(p => p.Categorie) 
                                  .FirstOrDefault(p => p.ProduitId == productId);

            if (product == null)
            {
                return NotFound(); 
            }

            ShoppingCart cart = new ShoppingCart
            {
                Product = product,
                Count = 1,
                ProduitId = productId
            };

            return View(cart);
        }

        [HttpPost]
        [Authorize]
        public IActionResult ItemDetails(ShoppingCart shoppingCart)
        {
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;
            shoppingCart.ApplicationUserId = userId;

            var product = _context.Produits.Find(shoppingCart.ProduitId);

            if (product == null || product.Stock < shoppingCart.Count)
            {
                TempData["error"] = "Quantité non disponible";
                return RedirectToAction(nameof(Index));
            }

            product.Stock -= shoppingCart.Count;
            _context.Update(product);
            _context.SaveChanges();

            ShoppingCart cartFromDb = _context.ShoppingCarts.Where(u => u.ApplicationUserId == userId && u.ProduitId == shoppingCart.ProduitId).FirstOrDefault();
            if (cartFromDb != null)
            {
                cartFromDb.Count += shoppingCart.Count;
                _context.ShoppingCarts.Update(cartFromDb);
            }
            else
            {
                _context.ShoppingCarts.Add(shoppingCart);
            }

            _context.SaveChanges();

            TempData["success"] = "Produit ajouté au panier avec succès";
            return RedirectToAction(nameof(Customer));
        }


        public async Task<IActionResult> Customer(int? id = 1, int page = 1, int pageSize = 20)
        {
            var categorie = await _context.Categories.Include(c => c.Produits).FirstOrDefaultAsync(c => c.CategorieId == id);

            if (categorie == null)
            {
                return NotFound("Catégorie non trouvée.");
            }

            var produitsQuery = _context.Produits.Where(p => p.CategorieId == id);

            var paginatedProduits = await PaginatedList<Produit>.CreateAsync(produitsQuery, page, pageSize);

            ViewBag.CategorieNom = categorie.Nom;
            ViewBag.CategorieId = id;

            return View(paginatedProduits);
        }
    }
}
