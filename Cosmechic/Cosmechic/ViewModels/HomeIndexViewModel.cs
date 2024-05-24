namespace Cosmechic.ViewModels
{
    public class HomeIndexViewModel
    {
        public IEnumerable<HomeCategorie> CategoriesPopulaires { get; set; }
        public IEnumerable<HomeProduit> ProduitsPopulaires { get; set; }
        public List<HomeProduit> TousLesProduits { get; set; }
    }

    public class HomeCategorie
    {
        public int CategorieId { get; set; }
        public string? Nom { get; set; }
        public string? Image { get; set; }
    }

    public class HomeProduit
    {
        public int ProduitId { get; set; }
        public string? Nom { get; set; }
        public string? Description { get; set; }
        public string? Image { get; set; }
        public decimal Prix { get; set; }
    }
}
