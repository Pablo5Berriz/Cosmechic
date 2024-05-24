using System;
using System.Collections.Generic;

namespace Cosmechic.Models;

public partial class Commade
{
    public int CommandeId { get; set; }

    public string AspNetUserId { get; set; } = null!;

    public DateTime DateCommande { get; set; }

    public string AdresseLivraison { get; set; } = null!;

    public string StatutCommande { get; set; } = null!;

    public double FraisLivraison { get; set; }

    public double Taxes { get; set; }

    public double Total { get; set; }

    public virtual AspNetUser AspNetUser { get; set; } = null!;

    public virtual ICollection<Paiement> Paiements { get; set; } = new List<Paiement>();
}
