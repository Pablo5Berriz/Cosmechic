using System;
using System.Collections.Generic;

namespace Cosmechic.Models;

public partial class Avi
{
    public int ReviewId { get; set; }

    public string AspNetUserId { get; set; } = null!;

    public int ProduitId { get; set; }

    public int PaiementId { get; set; }

    public int Note { get; set; }

    public string? Commentaire { get; set; }

    public DateTime DateReview { get; set; }

    public virtual AspNetUser AspNetUser { get; set; } = null!;

    public virtual Produit Produit { get; set; } = null!;
}
