using Cosmechic.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.ComponentModel.DataAnnotations;
 

namespace Cosmechic.ViewModels
{
    public class CategorieViewModel
    {
        [Required]
        [Display(Name = "Nom")]
        public string Nom { get; set; }

        [Required]
        [Display(Name = "Description")]
        public string Description { get; set; }

        [Display(Name = "Disponible")]
        public bool Disponible { get; set; }

        [DataType(DataType.Upload)]
        [Display(Name = "Image de la catégorie")]
        public IFormFile Image { get; set; }

        [Display(Name = "Catégorie")]
        public int CategorieId { get; set; }

        public SelectList? Categories { get; set; }
    }

}
