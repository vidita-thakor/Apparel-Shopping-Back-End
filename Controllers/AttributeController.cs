using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Administrator.Models;
using PagedList;

namespace Administrator.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class AttributeController : Controller
    {
        private ApparelShoppingContext db = new ApparelShoppingContext();

        //
        // GET: /Attribute/

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

            var ProductParam = from s in db.ProductParams
                        select s;

            if (!String.IsNullOrEmpty(searchString))
            {
                ProductParam = ProductParam.Where(s => s.ProductParamName.Contains(searchString)
                                       || s.ProductParamDescription.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "Name desc":
                    ProductParam = ProductParam.OrderByDescending(s => s.ProductParamName);
                    break;
                default:
                    ProductParam = ProductParam.OrderBy(s => s.ProductParamName);
                    break;
            }

            int pageSize = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["TotalRecordPerPage"]); ;
            int pageNumber = (page ?? 1);

            ViewData["Success"] = TempData["Message"];
            return View(ProductParam.ToPagedList(pageNumber, pageSize));
            
        }

        //
        // GET: /Attribute/Details/5

        public ActionResult Details(int id = 0)
        {
            ProductParam productparam = db.ProductParams.Find(id);
            if (productparam == null)
            {
                return HttpNotFound();
            }
            return View(productparam);
        }

        //
        // GET: /Attribute/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Attribute/Create

        [HttpPost]
        public ActionResult Create(ProductParam productparam)
        {
            if (ModelState.IsValid)
            {
                db.ProductParams.Add(productparam);
                db.SaveChanges();
                TempData["Message"] = "Record Created Successfully";
                return RedirectToAction("Index");
            }

            return View(productparam);
        }

        //
        // GET: /Attribute/Edit/5

        public ActionResult Edit(int id = 0)
        {
            ProductParam productparam = db.ProductParams.Find(id);
            if (productparam == null)
            {
                return HttpNotFound();
            }
            return View(productparam);
        }

        //
        // POST: /Attribute/Edit/5

        [HttpPost]
        public ActionResult Edit(ProductParam productparam)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productparam).State = EntityState.Modified;
                db.SaveChanges();
                TempData["Message"] = "Record Updated Successfully";
                return RedirectToAction("Index");
            }
            return View(productparam);
        }

        //
        // GET: /Attribute/Delete/5

        public ActionResult Delete(int id = 0)
        {
            ProductParam productparam = db.ProductParams.Find(id);
            if (productparam == null)
            {
                return HttpNotFound();
            }
            return View(productparam);
        }

        //
        // POST: /Attribute/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            ProductParam productparam = db.ProductParams.Find(id);
            db.ProductParams.Remove(productparam);
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