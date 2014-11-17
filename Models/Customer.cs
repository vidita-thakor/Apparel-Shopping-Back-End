using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Administrator.Models
{
    public partial class Customer
    {
        public Customer()
        {
            this.Orders = new List<Order>();
        }

        public int CustomerId { get; set; }
        [Display(Name = "User Id")]
        public int UserId { get; set; }
        [Display(Name = "First Name")]
        public string CustomerFirstName { get; set; }
        [Display(Name = "Last Name")]
        public string CustomerLastName { get; set; }
        [Display(Name = "Email")]
        public string CustomerEmail { get; set; }
        [Display(Name = "Phone")]
        public string CustomerPhone { get; set; }
        [Display(Name = "Home Phone")]
        public string CustomerHomePhone { get; set; }
        [Display(Name = "Address")]
        public string CustomerAddress { get; set; }
        [Display(Name = "City")]
        public string CustomerCity { get; set; }
        [Display(Name = "State")]
        public string CustomerState { get; set; }
        [Display(Name = "Zip")]
        public string CustomerZip { get; set; }
        [Display(Name = "Country")]
        public string CustomerCountry { get; set; }
        [Display(Name = "Shipping Address")]
        public string ShippingAddress { get; set; }
        [Display(Name = "Shipping City")]
        public string ShippingCity { get; set; }
        [Display(Name = "Shipping State")]
        public string ShippingState { get; set; }
        [Display(Name = "Shipping Zip")]
        public string ShippingZip { get; set; }
        [Display(Name = "Shipping Country")]
        public string ShippingCountry { get; set; }
        [Display(Name = "Created")]
        public System.DateTime CustomerCreated { get; set; }
        public byte[] CustomerUpdated { get; set; }
        public virtual UserProfile UserProfile { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
