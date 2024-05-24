namespace Cosmechic.Models;

public partial class Produit
{
    public int ProduitId { get; set; }

    public string Nom { get; set; } = null!;

    public int CategorieId { get; set; }

    public string? Description { get; set; }

    public decimal Prix { get; set; }

    public decimal Stock { get; set; }

    public bool Disponible { get; set; }

    public string? Image { get; set; } = null!;

    public virtual ICollection<Avi> Avis { get; set; } = new List<Avi>();

    public virtual Category? Categorie { get; set; } = null!;

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}
