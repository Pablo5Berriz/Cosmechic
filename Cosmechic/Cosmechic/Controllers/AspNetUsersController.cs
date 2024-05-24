using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Cosmechic.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using System.Security.Claims;
using Cosmechic.ViewModels;

namespace Cosmechic.Controllers
{
    [Authorize]
    public class AspNetUsersController : Controller
    {
        private readonly CosmechicsContext _context;
        private readonly UserManager<IdentityUser> _userManager;

        public AspNetUsersController(CosmechicsContext context, UserManager<IdentityUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        // GET: AspNetUsers
        public async Task<IActionResult> Index()
        {
            if (!User.IsInRole("Admin"))
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                var currentUser = await _context.AspNetUsers.FindAsync(userId);

                return View(new List<AspNetUser> { currentUser });
            }

            var users = await _context.AspNetUsers.ToListAsync();
            return View(users);
        }

        // GET: AspNetUsers/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.AspNetUsers == null)
            {
                return NotFound();
            }

            var aspNetUser = await _context.AspNetUsers
                .FirstOrDefaultAsync(m => m.Id == id);
            if (aspNetUser == null)
            {
                return NotFound();
            }

            return View(aspNetUser);
        }

        // GET: AspNetUsers/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: AspNetUsers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,UserName,Email, PhoneNumber, StreetAddress,City,State,PostalCode")] AspNetUser aspNetUser)
        {
            if (ModelState.IsValid)
            {
                _context.Add(aspNetUser);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(aspNetUser);
        }

        // GET: AspNetUsers/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            var currentUser = await _userManager.GetUserAsync(User);

            if (!User.IsInRole("Admin") && currentUser.Id != id)
            {
                return Forbid();
            }

            if (id == null || _context.AspNetUsers == null)
            {
                return NotFound();
            }

            var aspNetUser = await _context.AspNetUsers.FindAsync(id);
            if (aspNetUser == null)
            {
                return NotFound();
            }
            return View(aspNetUser);
        }

        // POST: AspNetUsers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Id,UserName,Email, PhoneNumber, StreetAddress,City,State,PostalCode")] AspNetUser aspNetUser)
        {
            var currentUser = await _userManager.GetUserAsync(User);

            if (!User.IsInRole("Admin") && currentUser.Id != id)
            {
                return Forbid();
            }

            if (id != aspNetUser.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(aspNetUser);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AspNetUserExists(aspNetUser.Id))
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
            return View(aspNetUser);
        }

        
        // GET: AspNetUsers/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.AspNetUsers == null)
            {
                return NotFound();
            }

            var aspNetUser = await _context.AspNetUsers
                .FirstOrDefaultAsync(m => m.Id == id);
            if (aspNetUser == null)
            {
                return NotFound();
            }

            return View(aspNetUser);
        }

        // POST: AspNetUsers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.AspNetUsers == null)
            {
                return Problem("Entity set 'CosmechicsContext.AspNetUsers'  is null.");
            }
            var aspNetUser = await _context.AspNetUsers.FindAsync(id);
            if (aspNetUser != null)
            {
                _context.AspNetUsers.Remove(aspNetUser);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool AspNetUserExists(string id)
        {
          return (_context.AspNetUsers?.Any(e => e.Id == id)).GetValueOrDefault();
        }

        // GET: Utilisateurs/Dashboard
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Dashboard()
        {
            var dashboardViewModel = new DashboardViewModel
            {
                TotalSales = await CalculateTotalSales(),
                TopSellingProducts = await GetTopSellingProducts(),
                PopularCategories = await GetPopularCategories(),
                TotalRevenue = await TotalRevenue(),
                TotalOrders = await TotalOrders(),
                TotalClients = await TotalClients()
            };

            return View(dashboardViewModel);
        }


        private async Task<decimal> CalculateTotalSales()
        {
			var totalSales = await _context.OrderDetails.SumAsync(od => od.Price * od.Count);
			return (decimal)totalSales;
		}

		private async Task<List<ProductSalesInfo>> GetTopSellingProducts()
		{
			var topSellingProducts = await _context.OrderDetails
											.Include(od => od.Produit)
											.GroupBy(od => od.ProduitId)
											.Select(g => new ProductSalesInfo
											{
												ProductName = g.First().Produit.Nom,
												QuantitySold = g.Sum(od => od.Count),
												TotalRevenue = (decimal)g.Sum(od => od.Price * od.Count)
											})
											.OrderByDescending(p => p.QuantitySold)
											.Take(5)
											.ToListAsync();

			return topSellingProducts;
		}

		private async Task<List<CategoryPopularityInfo>> GetPopularCategories()
		{
			var popularCategories = await _context.OrderDetails
											.GroupBy(od => od.Produit.CategorieId)
											.Select(g => new
											{
												CategoryId = g.Key,
												NumberOfSales = g.Sum(od => od.Count)
											})
											.OrderByDescending(c => c.NumberOfSales)
											.Take(5)
											.ToListAsync();

			var categoryInfoList = new List<CategoryPopularityInfo>();

			foreach (var item in popularCategories)
			{
				var categoryName = await _context.Categories
												.Where(c => c.CategorieId == item.CategoryId)
												.Select(c => c.Nom)
												.FirstOrDefaultAsync();

				if (categoryName != null)
				{
					categoryInfoList.Add(new CategoryPopularityInfo
					{
						CategoryName = categoryName,
						NumberOfSales = item.NumberOfSales
					});
				}
			}

			return categoryInfoList;
		}

        private async Task<decimal> TotalRevenue()
        {
            var totalRevenue = await _context.OrderDetails.SumAsync(od => od.Price * od.Count);
            return (decimal)totalRevenue;
        }

        private async Task<int> TotalOrders()
        {
            var totalOrders = await _context.OrderDetails.CountAsync();
            return totalOrders;
        }

        private async Task<int> TotalClients()
        {
            var totalClients = await _context.AspNetUsers.CountAsync();
            return totalClients;
        }

        public IActionResult Diagrammes()
        {
            var revenueData = GetRevenueData();
            var salesDistributionData = GetSalesDistributionData();

            ViewBag.RevenueData = revenueData;
            ViewBag.SalesDistributionData = salesDistributionData;

            return View();
        }

        private List<int> GetRevenueData()
        {
            return new List<int> { 0, 6500, 5000, 9000, 10000, 20000, 12000, 10000, 16000, 21000, 18000, 23762 };
        }

        private List<int> GetSalesDistributionData()
        {
            return new List<int> { 30, 20, 15, 10, 25 };
        }
    }
}
    

