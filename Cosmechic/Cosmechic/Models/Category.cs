using System;
using System.Collections.Generic;

namespace Cosmechic.Models;

public partial class Category
{
    public int CategorieId { get; set; }

    public string Nom { get; set; } = null!;

    public string? Description { get; set; }

    public string Image { get; set; } = null!;

    public bool Disponible { get; set; }

    public virtual ICollection<Produit> Produits { get; set; } = new List<Produit>();
}
