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
    public class PageController : Controller
    {
        private ApparelShoppingContext db = new ApparelShoppingContext();

        //
        // GET: /Page/
        
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

            var Pages = from s in db.Pages
                        select s;

            if (!String.IsNullOrEmpty(searchString))
            {
                Pages = Pages.Where(s => s.PageTitle.Contains(searchString)
                                       || s.PageDescription.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "Name desc":
                    Pages = Pages.OrderByDescending(s => s.PageTitle);
                    break;
                case "Date":
                    Pages = Pages.OrderBy(s => s.PageCreated);
                    break;
                case "Date desc":
                    Pages = Pages.OrderByDescending(s => s.PageCreated);
                    break;
                default:
                    Pages = Pages.OrderBy(s => s.PageTitle);
                    break;
            }

            int pageSize = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["TotalRecordPerPage"]);
            int pageNumber = (page ?? 1);

            ViewData["Success"] = TempData["Message"];
            return View(Pages.ToPagedList(pageNumber, pageSize));

            //return View(db.Pages.ToList());
        }

        //
        // GET: /Page/Details/5
       
        public ActionResult Details(int id = 0)
        {
            Page page = db.Pages.Find(id);
            if (page == null)
            {
                return HttpNotFound();
            }
            return View(page);
        }

        //
        // GET: /Page/Create
        [Authorize]
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Page/Create
        
        [HttpPost]
        public ActionResult Create(Page page)
        {
            if (ModelState.IsValid)
            {
                db.Pages.Add(page);
                db.SaveChanges();
                TempData["Message"] = "Record Created Successfully";
                return RedirectToAction("Index");
            }

            return View(page);
        }

        //
        // GET: /Page/Edit/5
        
        public ActionResult Edit(int id = 0)
        {
            Page page = db.Pages.Find(id);
            if (page == null)
            {
                return HttpNotFound();
            }
            return View(page);
        }

        //
        // POST: /Page/Edit/5
        
        [HttpPost]
        public ActionResult Edit(Page page)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(page).State = EntityState.Modified;
                    db.SaveChanges();
                    TempData["Message"] = "Record Updated Successfully";
                    return RedirectToAction("Index");
                }
            }
            catch (DbUpdateConcurrencyException ex)
            {
                var entry = ex.Entries.Single();
                var databaseValues = (Page)entry.GetDatabaseValues().ToObject();
                var clientValues = (Page)entry.Entity;
                page.PageUpdated = databaseValues.PageUpdated;
            }
           
            return View(page);
        }

        //
        // GET: /Page/Delete/5
        
        public ActionResult Delete(int id = 0)
        {
            Page page = db.Pages.Find(id);
            if (page == null)
            {
                return HttpNotFound();
            }
            return View(page);
        }

        //
        // POST: /Page/Delete/5
       
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Page page = db.Pages.Find(id);
            db.Pages.Remove(page);
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