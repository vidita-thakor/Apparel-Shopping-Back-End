using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Administrator.Models
{
    public partial class Category
    {
        public Category()
        {
            this.Products = new List<Product>();
        }

        public int CategoryId { get; set; }
        [Display(Name = "Parent Category")]
        public Nullable<int> ParentCategoryId { get; set; }
        [Required]
        [Display(Name = "Name")]
        public string CategoryName { get; set; }
        [AllowHtml]
        [Display(Name = "Description")]
        public string CategoryDescription { get; set; }
        [Display(Name = "Url")]
        public string CategoryUrl { get; set; }
        public byte[] CategoryUpdated { get; set; }
        [Required]
        [Display(Name = "Created")]
        public System.DateTime CategoryCreated { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
