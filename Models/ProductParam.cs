using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Administrator.Models
{
    public partial class ProductParam
    {
        public ProductParam()
        {
            this.ParamValues = new List<ParamValue>();
        }

        public int ProductParamId { get; set; }
        [Required]
        [Display(Name = "Name")]
        public string ProductParamName { get; set; }
        [Display(Name = "Short Description")]
        public string ProductParamDescription { get; set; }
        public virtual ICollection<ParamValue> ParamValues { get; set; }
    }
}
