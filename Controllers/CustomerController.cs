using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Administrator.Models;
using PagedList;
using System.Data.Entity.Infrastructure;

namespace Administrator.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class CustomerController : Controller
    {
        private ApparelShoppingContext db = new ApparelShoppingContext();

        //
        // GET: /Customer/

        public ActionResult Index(string sortOrder, string currentFilter, string searchString, int? page)
        {

            ViewBag.CurrentSort = sortOrder;
            ViewBag.UserNameSortParm = String.IsNullOrEmpty(sortOrder) ? "UserName desc" : "";
            ViewBag.FirstNameSortParm = sortOrder == "FirstName" ? "FirstName desc" : "FirstName";
            ViewBag.LastNameSortParm = sortOrder == "LastName" ? "LastName desc" : "LastName";
            ViewBag.DateSortParm = sortOrder == "Date" ? "Date desc" : "Date";

            if (Request.HttpMethod == "GET")
            {
                searchString = currentFilter;
            }
            else
            {
                page = 1;
            }
            ViewBag.CurrentFilter = searchString;

            
            var customers = db.Customers.Include(c => c.UserProfile);
            if (!String.IsNullOrEmpty(searchString))
            {
                customers = customers.Where(s => s.UserProfile.UserName.Contains(searchString) ||
                                               s.CustomerFirstName.Contains(searchString) ||
                                               s.CustomerLastName.Contains(searchString) ||
                                               s.CustomerEmail.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "UserName desc":
                    customers = customers.OrderByDescending(s => s.UserProfile.UserName);
                    break;
                case "FirstName":
                    customers = customers.OrderBy(s => s.CustomerFirstName);
                    break;
                case "FirstName desc":
                    customers = customers.OrderByDescending(s => s.CustomerFirstName);
                    break;
                case "LastName":
                    customers = customers.OrderBy(s => s.CustomerLastName);
                    break;
                case "LastName desc":
                    customers = customers.OrderByDescending(s => s.CustomerLastName);
                    break;
                case "Date":
                    customers = customers.OrderBy(s => s.CustomerCreated);
                    break;
                case "Date desc":
                    customers = customers.OrderByDescending(s => s.CustomerCreated);
                    break;
                default:
                    customers = customers.OrderBy(s => s.UserProfile.UserName);
                    break;
            }
            int pageSize = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["TotalRecordPerPage"]);
            int pageNumber = (page ?? 1);
            ViewData["Success"] = TempData["Message"];

            return View(customers.ToPagedList(pageNumber, pageSize));
        }

        //
        // GET: /Customer/Details/5

        public ActionResult Details(int id = 0)
        {
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        //
        // GET: /Customer/Create

        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(db.UserProfiles, "UserId", "UserName");
            return View();
        }

        //
        // POST: /Customer/Create

        [HttpPost]
        public ActionResult Create(Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Customers.Add(customer);
                db.SaveChanges();
                TempData["Message"] = "Record Created Successfully";
                return RedirectToAction("Index");
            }

            ViewBag.UserId = new SelectList(db.UserProfiles, "UserId", "UserName", customer.UserId);
            return View(customer);
        }

        //
        // GET: /Customer/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserId = new SelectList(db.UserProfiles, "UserId", "UserName", customer.UserId);
            return View(customer);
        }

        //
        // POST: /Customer/Edit/5

        [HttpPost]
        public ActionResult Edit(Customer customer)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(customer).State = EntityState.Modified;
                    db.SaveChanges();
                    TempData["Message"] = "Record Updated Successfully";
                    return RedirectToAction("Index");
                }
            }
            catch (DbUpdateConcurrencyException ex)
            {
                var entry = ex.Entries.Single();
                var databaseValues = (Customer)entry.GetDatabaseValues().ToObject();
                var clientValues = (Customer)entry.Entity;
                customer.CustomerUpdated = databaseValues.CustomerUpdated;
            }
            ViewBag.UserId = new SelectList(db.UserProfiles, "UserId", "UserName", customer.UserId);
            return View(customer);
        }

        //
        // GET: /Customer/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        //
        // POST: /Customer/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Customer customer = db.Customers.Find(id);
            db.Customers.Remove(customer);
            db.SaveChanges();
            TempData["Message"] = "Record Deleted Successfully";
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}