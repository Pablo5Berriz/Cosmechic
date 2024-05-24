using System;
using System.Collections.Generic;

namespace Cosmechic.Models;

public partial class OrderDetail
{
    public int Id { get; set; }

    public int OrderHeaderId { get; set; }

    public int ProduitId { get; set; }

    public int Count { get; set; }

    public double Price { get; set; }

    public virtual OrderHeader OrderHeader { get; set; } = null!;

    public virtual Produit Produit { get; set; } = null!;
}
