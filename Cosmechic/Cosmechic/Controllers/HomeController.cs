using Cosmechic.Models;
using Cosmechic.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace Cosmechic.Controllers
{
	public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly CosmechicsContext _context;

        public HomeController(ILogger<HomeController> logger, CosmechicsContext context)
        {
            _logger = logger;
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var viewModel = new HomeIndexViewModel();

            var categoriesPopulaires = await _context.Categories
                .Include(c => c.Produits)
                .OrderByDescending(c => c.Produits.Count())
                .Take(4)
                .ToListAsync();

            viewModel.CategoriesPopulaires = categoriesPopulaires.Select(c => new HomeCategorie
            {
                CategorieId = c.CategorieId,
                Nom = c.Nom,
                Image = c.Image
            }).ToList();

            viewModel.ProduitsPopulaires = await _context.Produits
                .OrderByDescending(p => p.Nom)
                .Take(4)
                .Select(p => new HomeProduit
                {
                    ProduitId = p.ProduitId,
                    Nom = p.Nom,
                    Description = p.Description,
                    Image = p.Image,
                    Prix = p.Prix
                })
                .ToListAsync();

            viewModel.TousLesProduits = await _context.Produits
        .OrderByDescending(p => p.Nom)
        .Select(p => new HomeProduit
        {
            ProduitId = p.ProduitId,
            Nom = p.Nom,
            Description = p.Description,
            Image = p.Image,
            Prix = p.Prix
        })
        .ToListAsync();


            return View(viewModel);
        }

        public IActionResult About()
        {
            return View();
        }

        public IActionResult Contact()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult Terms()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

		[HttpPost]
		[Authorize]
		public IActionResult AjouterAuPanier(int produitId)
		{
			if (User.Identity.IsAuthenticated)
			{
				return Ok();
			}
			else
			{
				return Unauthorized();
			}
		}

	}
}
