namespace Cosmechic.Models;

public partial class Picture
{
    public int PicId { get; set; }

    public int CategorieId { get; set; }

    public int ProduitId { get; set; }

    public string? Description { get; set; }

    public bool IsProfile { get; set; }

    public string Path { get; set; } = null!;

    public virtual Category Categorie { get; set; } = null!;

    public virtual Produit Produit { get; set; } = null!;
}
