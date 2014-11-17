using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Administrator.Models
{
    public partial class ParamValue
    {
        public ParamValue()
        {
            this.Inventories = new List<Inventory>();
            this.Inventories1 = new List<Inventory>();
        }

        public int ParamValueId { get; set; }
        [Required]
        [Display(Name = "Attribute")]
        public int ProductParamId { get; set; }
        [Required]
        [Display(Name = "Value")]
        public string ParamValue1 { get; set; }
        public virtual ICollection<Inventory> Inventories { get; set; }
        public virtual ICollection<Inventory> Inventories1 { get; set; }
        public virtual ProductParam ProductParam { get; set; }
    }
}
