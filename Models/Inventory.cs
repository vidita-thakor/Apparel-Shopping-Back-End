using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Administrator.Models
{
    public partial class Inventory
    {
        public Inventory()
        {
            this.OrderItems = new List<OrderItem>();
        }

        public int InventoryId { get; set; }
        [Required]
        [Display(Name = "Product")]
        public int ProductId { get; set; }
        [Required]
        [Display(Name = "Size")]
        public int ParamSizeValueId { get; set; }
        [Required]
        [Display(Name = "Color")]
        public int ParamColorValueId { get; set; }
        [Required]
        [Display(Name = "Quantity")]
        public int Quantity { get; set; }
        public virtual ParamValue ParamValue { get; set; }
        public virtual ParamValue ParamValue1 { get; set; }
        public virtual Product Product { get; set; }
        public virtual ICollection<OrderItem> OrderItems { get; set; }
    }
}
