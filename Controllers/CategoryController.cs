using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Administrator.Models;
using System.Diagnostics;
using PagedList;
using System.Data.Entity.Infrastructure;

namespace Administrator.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class CategoryController : Controller
    {
        private ApparelShoppingContext db = new ApparelShoppingContext();

        //
        // GET: /Category/

        public ActionResult Index(string sortOrder, string currentFilter, string searchString, int? page)
        {
            ViewBag.CurrentSort = sortOrder;
            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "Name desc" : "";
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

            var Categories = from s in db.Categories
                        select s;

            if (!String.IsNullOrEmpty(searchString))
            {
                Categories = Categories.Where(s => s.CategoryName.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "Name desc":
                    Categories = Categories.OrderByDescending(s => s.CategoryName);
                    break;
                case "Date":
                    Categories = Categories.OrderBy(s => s.CategoryCreated);
                    break;
                case "Date desc":
                    Categories = Categories.OrderByDescending(s => s.CategoryCreated);
                    break;
                default:
                    Categories = Categories.OrderBy(s => s.CategoryName);
                    break;
            }

            int pageSize = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["TotalRecordPerPage"]);
            int pageNumber = (page ?? 1);
            ViewData["Success"] = TempData["Message"];
            return View(Categories.ToPagedList(pageNumber, pageSize));
        }

        //
        // GET: /Category/Details/5
        
        public ActionResult Details(int id = 0)
        {
            Category category = db.Categories.Find(id);
            ViewBag.ParentCategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", category.ParentCategoryId);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        //
        // GET: /Category/Create
        
        public ActionResult Create()
        {

            //ViewBag.ParentCategoryId = new SelectList(db.Categories.ToList(), "CategoryId", "CategoryName");
            var query = db.Categories.Select(c => new { c.CategoryId, c.CategoryName });
            ViewBag.ParentCategoryId = new SelectList(query.AsEnumerable(), "CategoryId", "CategoryName",0);
            return View();
        }

        //
        // POST: /Category/Create
       
        [HttpPost]
        public ActionResult Create(Category category)
        {
            if (ModelState.IsValid)
            {
                db.Categories.Add(category);
                db.SaveChanges();
                TempData["Message"] = "Record Created Successfully";
                return RedirectToAction("Index");
                //try
                //{
                //    db.SaveChanges();
                //}
                    
                //catch (DbEntityValidationException dbEx)
                //{
                //    foreach (var validationErrors in dbEx.EntityValidationErrors)
                //    {
                //        foreach (var validationError in validationErrors.ValidationErrors)
                //        {
                //            var str = validationError.PropertyName + "--->" + validationError.ErrorMessage;
                //            //str= validationError.PropertyName+"--->"+validationError.ErrorMessage;
                //            Trace.Write(str);
                //            //.TraceInformation("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                //        }
                //    }
                //}
                //return RedirectToAction("Index");
            }

           // ViewBag.ParentCategoryId = new SelectList(db.Categories, "CategoryId", "ParentCategoryId", category.ParentCategoryId);
            return View(category);
        }

        //
        // GET: /Category/Edit/5
        
        public ActionResult Edit(int id = 0)
        {
            Category category = db.Categories.Find(id);
            ViewBag.ParentCategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", category.ParentCategoryId);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        //
        // POST: /Category/Edit/5
        
        [HttpPost]
        public ActionResult Edit(Category category)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(category).State = EntityState.Modified;
                    db.SaveChanges();
                    TempData["Message"] = "Record Updated Successfully";
                    return RedirectToAction("Index");
                }
            }
            catch (DbUpdateConcurrencyException ex)
            {
                var entry = ex.Entries.Single();
                var databaseValues = (Category)entry.GetDatabaseValues().ToObject();
                var clientValues = (Category)entry.Entity;
                category.CategoryUpdated = databaseValues.CategoryUpdated;
            }
          
            return View(category);
        }

        //
        // GET: /Category/Delete/5
       
        public ActionResult Delete(int id = 0)
        {
            Category category = db.Categories.Find(id);
            ViewBag.ParentCategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", category.ParentCategoryId);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        //
        // POST: /Category/Delete/5
        
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Category category = db.Categories.Find(id);
            db.Categories.Remove(category);
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