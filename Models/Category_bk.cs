using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;

namespace Administrator.Models
{
    public partial class Category
    {
        [Key]
        public int CategoryId { get; set; }


        [Display(Name = "Parent Category")]
        public int ParentCategoryId { get; set; }

        [Required]
        [Display(Name = "Title")]
        public string CategoryName { get; set; }

        [Display(Name = "Description")]
        public string CategoryDescription { get; set; }

        [Display(Name = "Url")]
        public string CategoryUrl { get; set; }

        public byte[] CategoryUpdated { get; set; }

        [Display(Name = "Created")]
        public System.DateTime CategoryCreated { get; set; }
    }
}
