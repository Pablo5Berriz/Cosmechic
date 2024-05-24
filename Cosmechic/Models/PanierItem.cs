using System;
using System.Collections.Generic;

namespace Cosmechic.Models;

public partial class PanierItem
{
    public int PanierItemId { get; set; }

    public int PanierId { get; set; }

    public int ProduitId { get; set; }

    public int Quantite { get; set; }

    public double PrixUnitaire { get; set; }

    public string Image { get; set; } = null!;

    public virtual Panier Panier { get; set; } = null!;

    public virtual Produit Produit { get; set; } = null!;
}
