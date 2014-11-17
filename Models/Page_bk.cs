using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;

namespace Administrator.Models
{
    public partial class Page
    {
        public int PageId { get; set; }

        [Required]
        [Display(Name = "Title")]
        public string PageTitle { get; set; }

        [Display(Name = "Description")]
        public string PageDescription { get; set; }

        [Display(Name = "Created")]
        public System.DateTime PageCreated { get; set; }

        public byte[] PageUpdated { get; set; }
    }
}