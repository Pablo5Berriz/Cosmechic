using System;
using System.Collections.Generic;

namespace Cosmechic.Models;

public partial class Paiement
{
    public int PaiementId { get; set; }

    public int CommandeId { get; set; }

    public string AspNetUserId { get; set; } = null!;

    public int TransactionId { get; set; }

    public double Montant { get; set; }

    public DateTime DatePaiement { get; set; }

    public string ModePaiement { get; set; } = null!;

    public string StatutPaiement { get; set; } = null!;

    public string DetailsCarte { get; set; } = null!;

    public virtual AspNetUser AspNetUser { get; set; } = null!;

    public virtual ICollection<Avi> Avis { get; set; } = new List<Avi>();

    public virtual Commade Commande { get; set; } = null!;
}
