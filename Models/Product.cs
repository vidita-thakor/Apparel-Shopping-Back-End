using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Administrator.Models
{
    public partial class Product
    {
        public Product()
        {
            this.Inventories = new List<Inventory>();
            this.ProductImages = new List<ProductImage>();
        }

        public int ProductId { get; set; }
        [Required]
        [Display(Name = "Category")]
        public int CategoryId { get; set; }
        [Required]
        [Display(Name = "Name")]
        public string ProductName { get; set; }
        [AllowHtml]
        [Display(Name = "Short Description")]
        public string ProductShortDescription { get; set; }
        [AllowHtml]
        [Display(Name = "Long Description")]
        public string ProductLongDescription { get; set; }
        [Display(Name = "Url")]
        public string ProductUrl { get; set; }
        [Required]
        [Display(Name = "Price")]
        [Range(0.01, 100.00,ErrorMessage = "Price must be between 0.01 and 100.00")]
        public decimal ProductPrice { get; set; }
        [AllowHtml]
        [Display(Name = "Delivery Information")]
        public string ProductDeliveryTxt { get; set; }
        [AllowHtml]
        [Display(Name = "Return Information")]
        public string ProductReturnsTxt { get; set; }
        [AllowHtml]
        [Display(Name = "Info & Care Information")]
        public string ProductInfoCareTxt { get; set; }
        [Required]
        [Display(Name = "Created")]
        public System.DateTime ProductCreated { get; set; }
        public byte[] ProductUpdated { get; set; }
        public virtual Category Category { get; set; }
        public virtual ICollection<Inventory> Inventories { get; set; }
        public virtual ICollection<ProductImage> ProductImages { get; set; }
    }
}
