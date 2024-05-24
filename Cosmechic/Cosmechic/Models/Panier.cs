using System;
using System.Collections.Generic;

namespace Cosmechic.Models;

public partial class Panier
{
    public int PanierId { get; set; }

    public string AspNetUserId { get; set; } = null!;

    public string StatutPanier { get; set; } = null!;

    public DateTime DateCreationPanier { get; set; }

    public DateTime DateModificationPanier { get; set; }

    public virtual AspNetUser AspNetUser { get; set; } = null!;

    public virtual ICollection<PanierItem> PanierItems { get; set; } = new List<PanierItem>();
}
