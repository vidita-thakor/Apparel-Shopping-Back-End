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
    public class ProductController : Controller
    {
        private ApparelShoppingContext db = new ApparelShoppingContext();

        //
        // GET: /Product/

        public ActionResult Index(string sortOrder, string currentFilter, string searchString, int? page)
        {
            
            ViewBag.CurrentSort = sortOrder;
            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "Name desc" : "";
            ViewBag.CategorySortParm = sortOrder == "Category" ? "Category desc" : "Category";
            ViewBag.PriceSortParm = sortOrder == "Price" ? "Price desc" : "Price";
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

            var products = db.Products.Include(p => p.Category);
            if (!String.IsNullOrEmpty(searchString))
            {
                products = products.Where(s => s.ProductName.Contains(searchString) ||
                                               s.Category.CategoryName.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "Name desc":
                    products = products.OrderByDescending(s => s.ProductName);
                    break;
                case "Category":
                    products = products.OrderBy(s => s.Category.CategoryName);
                    break;
                case "Category desc":
                    products = products.OrderByDescending(s => s.Category.CategoryName);
                    break;
                case "Price":
                    products = products.OrderBy(s => s.ProductPrice);
                    break;
                case "Price desc":
                    products = products.OrderByDescending(s => s.ProductPrice);
                    break;
                case "Date":
                    products = products.OrderBy(s => s.ProductCreated);
                    break;
                case "Date desc":
                    products = products.OrderByDescending(s => s.ProductCreated);
                    break;
                default:
                    products = products.OrderBy(s => s.ProductName);
                    break;
            }
            int pageSize = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["TotalRecordPerPage"]);
            int pageNumber = (page ?? 1);
            ViewData["Success"] = TempData["Message"];
            return View(products.ToPagedList(pageNumber, pageSize));
        }

        //
        // GET: /Product/Details/5

        public ActionResult Details(int id = 0)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        //
        // GET: /Product/Create

        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName");
            return View();
        }

        //
        // POST: /Product/Create

        [HttpPost]
        public ActionResult Create(Product product)
        {
            if (ModelState.IsValid)
            {
                db.Products.Add(product);
                db.SaveChanges();
                TempData["Message"] = "Record Created Successfully";
                return RedirectToAction("Index");
            }

            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", product.CategoryId);
            return View(product);
        }

        //
        // GET: /Product/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", product.CategoryId);
            return View(product);
        }

        //
        // POST: /Product/Edit/5

        [HttpPost]
        public ActionResult Edit(Product product)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(product).State = EntityState.Modified;
                    db.SaveChanges();
                    TempData["Message"] = "Record Updated Successfully";
                    return RedirectToAction("Index");
                }
            }
            catch (DbUpdateConcurrencyException ex)
            {
                var entry = ex.Entries.Single();
                var databaseValues = (Product)entry.GetDatabaseValues().ToObject();
                var clientValues = (Product)entry.Entity;
                product.ProductUpdated = databaseValues.ProductUpdated;
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", product.CategoryId);
            return View(product);
        }

        //
        // GET: /Product/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        //
        // POST: /Product/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
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