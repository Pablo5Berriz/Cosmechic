using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Cosmechic.Models;
using Cosmechic.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.Rendering;


namespace Cosmechic.Controllers
{
    public class CategoriesController : Controller
    {
        private readonly CosmechicsContext _context;
        private readonly IWebHostEnvironment _hostingEnvironment;

        public CategoriesController(CosmechicsContext context, IWebHostEnvironment hostingEnvironment)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;
        }

        // GET: Categories
        public async Task<IActionResult> Index(string sortOrder, string currentFilter, string searchString, int page = 1, int pageSize = 20)
        {
            ViewData["NameSortParm"] = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewData["CurrentFilter"] = searchString;

            var query = _context.Categories.AsQueryable();

            if (!String.IsNullOrEmpty(searchString))
            {
                query = query.Where(c => c.Nom.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "name_desc":
                    query = query.OrderByDescending(c => c.Nom);
                    break;
                default:
                    query = query.OrderBy(c => c.Nom);
                    break;
            }

            var paginatedList = await PaginatedList<Category>.CreateAsync(query.AsNoTracking(), page, pageSize);
            return View(paginatedList);
        }

        // GET: Categories/Details/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Categories == null)
            {
                return NotFound();
            }

            var category = await _context.Categories.FirstOrDefaultAsync(m => m.CategorieId == id);
            if (category == null)
            {
                return NotFound();
            }

            return View(category);
        }

        // GET: Categories/Create
        [Authorize(Roles = "Admin")]
        public IActionResult Create()
        {
            var categories = _context.Categories.ToList();
            var selectList = new SelectList(categories, "CategorieId", "Nom");
            var viewModel = new CategorieViewModel
            {
                Categories = selectList
            };

            return View(viewModel);
        }

        // POST: Categories/Create
        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Nom,Description,Disponible,Image")] CategorieViewModel categoryViewModel)
        {
            if (ModelState.IsValid)
            {
                var category = new Category();
                category.Nom = categoryViewModel.Nom;
                category.Description = categoryViewModel.Description;
                category.Disponible = categoryViewModel.Disponible;
                if (categoryViewModel.Image != null)
                {
                    string uploadsFolder = Path.Combine(_hostingEnvironment.WebRootPath, "Images Categories");
                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + categoryViewModel.Image.FileName;
                    string filePath = Path.Combine(uploadsFolder, uniqueFileName);

                    using (var fileStream = new FileStream(filePath, FileMode.Create))
                    {
                        await categoryViewModel.Image.CopyToAsync(fileStream);
                    }

                    category.Image = uniqueFileName;
                }

                _context.Add(category);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            var categories = _context.Categories.ToList();
            var selectList = new SelectList(categories, "CategorieId", "Nom");
            var viewModel = new CategorieViewModel
            {
                Categories = selectList
            };
            return View(viewModel);
        }



        // GET: Categories/Edit/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Categories == null)
            {
                return NotFound();
            }

            var category = await _context.Categories.FindAsync(id);
            if (category == null)
            {
                return NotFound();
            }

            var categoryViewModel = new CategorieViewModel();
            categoryViewModel.CategorieId = category.CategorieId;
            categoryViewModel.Nom = category.Nom;
            categoryViewModel.Description = category.Description;
            categoryViewModel.Disponible = category.Disponible;

            var categories = _context.Categories.ToList();
            var selectList = new SelectList(categories, "CategorieId", "Nom");

            categoryViewModel.Categories = selectList;
            return View(categoryViewModel);
        }

        // POST: Categories/Edit/5
        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CategorieId,Nom,Description,Image,Disponible")] CategorieViewModel categoryViewModel)
        {
            if (id != categoryViewModel.CategorieId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var category = await _context.Categories.FindAsync(id);
                    category.Nom = categoryViewModel.Nom;
                    category.Description = categoryViewModel.Description;
                    category.Disponible = categoryViewModel.Disponible;
                    if (categoryViewModel.Image != null)
                    {
                        string uploadsFolder = Path.Combine(_hostingEnvironment.WebRootPath, "Images Categories");
                        string uniqueFileName = Guid.NewGuid().ToString() + "_" + categoryViewModel.Image.FileName;
                        string filePath = Path.Combine(uploadsFolder, uniqueFileName);

                        using (var fileStream = new FileStream(filePath, FileMode.Create))
                        {
                            await categoryViewModel.Image.CopyToAsync(fileStream);
                        }

                        category.Image = uniqueFileName;
                    }

                    _context.Update(category);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CategoryExists(categoryViewModel.CategorieId))
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
            return View(categoryViewModel);
        }

        // GET: Categories/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Categories == null)
            {
                return NotFound();
            }

            var category = await _context.Categories.FirstOrDefaultAsync(m => m.CategorieId == id);
            if (category == null)
            {
                return NotFound();
            }

            return View(category);
        }

        // POST: Categories/Delete/5
        [HttpPost, ActionName("Delete")]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var category = await _context.Categories.FindAsync(id);
            if (category != null)
            {
                _context.Categories.Remove(category);
                await _context.SaveChangesAsync();
            }

            return RedirectToAction(nameof(Index));
        }

        private bool CategoryExists(int id)
        {
            return _context.Categories.Any(e => e.CategorieId == id);
        }

        public async Task<IActionResult> Customer(string sortOrder, string currentFilter, string searchString, int page = 1, int pageSize = 20)
        {
            ViewData["NameSortParm"] = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewData["CurrentFilter"] = searchString;

            var query = _context.Categories.AsQueryable();

            if (!String.IsNullOrEmpty(searchString))
            {
                query = query.Where(c => c.Nom.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "name_desc":
                    query = query.OrderByDescending(c => c.Nom);
                    break;
                default:
                    query = query.OrderBy(c => c.Nom);
                    break;
            }

            var paginatedList = await PaginatedList<Category>.CreateAsync(query.AsNoTracking(), page, pageSize);
            return View(paginatedList);
        }
    }
}
