using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Administrator.Models
{
    public partial class Page
    {
        public int PageId { get; set; }
        [Required]
        [Display(Name = "Title")]
        public string PageTitle { get; set; }
        [AllowHtml]
        [Display(Name = "Description")]
        public string PageDescription { get; set; }
        [Required]
        [Display(Name = "Created")]
        public System.DateTime PageCreated { get; set; }
        public byte[] PageUpdated { get; set; }
    }
}
