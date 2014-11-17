using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Administrator.Models
{
    public partial class ProductImage
    {
        public int ImageId { get; set; }
        [Required]
        [Display(Name = "Product")]
        public int ProductId { get; set; }
        [Required]
        [Display(Name = "Title")]
        public string ImageTitle { get; set; }
        [Display(Name = "Alt Text")]
        public string ImageAltText { get; set; }
        [Display(Name = "Upload Image")]
        public string ImageName { get; set; }
        [Required]
        [Display(Name = "Default Image")]
        public bool ImageIsMain { get; set; }
        [Required]
        [Display(Name = "Created")]
        public System.DateTime ImageCreated { get; set; }
        public virtual Product Product { get; set; }
    }
}
