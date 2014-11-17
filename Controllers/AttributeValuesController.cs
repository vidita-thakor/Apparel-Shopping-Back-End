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
    public class AttributeValuesController : Controller
    {
        private ApparelShoppingContext db = new ApparelShoppingContext();

        //
        // GET: /AttributeValues/

        public ActionResult Index(string sortOrder, string currentFilter, string searchString, int? page)
        {
            ViewBag.CurrentSort = sortOrder;
            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "Name desc" : "";
            ViewBag.AttributeSortParm = sortOrder == "Attribute" ? "Attribute desc" : "Attribute";
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
            var ParamValue = from s in db.ParamValues
                              select s;
            
            if (!String.IsNullOrEmpty(searchString))
            {
                ParamValue = ParamValue.Where(s => s.ParamValue1.Contains(searchString) || s.ProductParam.ProductParamName.Contains(searchString));
                                       
            }

            switch (sortOrder)
            {
                case "Name desc":
                    ParamValue = ParamValue.OrderByDescending(s => s.ParamValueId);
                    break;
                case "Attribute":
                    ParamValue = ParamValue.OrderBy(s => s.ProductParam.ProductParamName);
                    break;
                case "Attribute desc":
                    ParamValue = ParamValue.OrderByDescending(s => s.ProductParam.ProductParamName);
                    break;
                default:
                    ParamValue = ParamValue.OrderBy(s => s.ParamValue1);
                    break;
            }

            int pageSize = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["TotalRecordPerPage"]); ;
            int pageNumber = (page ?? 1);

            ViewData["Success"] = TempData["Message"];
            return View(ParamValue.ToPagedList(pageNumber, pageSize));
           // return View(paramvalues.ToList());
        }

        //
        // GET: /AttributeValues/Details/5

        public ActionResult Details(int id = 0)
        {
            ParamValue paramvalue = db.ParamValues.Find(id);
            if (paramvalue == null)
            {
                return HttpNotFound();
            }
            return View(paramvalue);
        }

        //
        // GET: /AttributeValues/Create

        public ActionResult Create()
        {
            ViewBag.ProductParamId = new SelectList(db.ProductParams, "ProductParamId", "ProductParamName");
            return View();
        }

        //
        // POST: /AttributeValues/Create

        [HttpPost]
        public ActionResult Create(ParamValue paramvalue)
        {
            if (ModelState.IsValid)
            {
                db.ParamValues.Add(paramvalue);
                db.SaveChanges();
                TempData["Message"] = "Record Created Successfully";
                return RedirectToAction("Index");
            }

            ViewBag.ProductParamId = new SelectList(db.ProductParams, "ProductParamId", "ProductParamName", paramvalue.ProductParamId);
            return View(paramvalue);
        }

        //
        // GET: /AttributeValues/Edit/5

        public ActionResult Edit(int id = 0)
        {
            ParamValue paramvalue = db.ParamValues.Find(id);
            if (paramvalue == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductParamId = new SelectList(db.ProductParams, "ProductParamId", "ProductParamName", paramvalue.ProductParamId);
            return View(paramvalue);
        }

        //
        // POST: /AttributeValues/Edit/5

        [HttpPost]
        public ActionResult Edit(ParamValue paramvalue)
        {
            if (ModelState.IsValid)
            {
                db.Entry(paramvalue).State = EntityState.Modified;
                db.SaveChanges();
                TempData["Message"] = "Record Updated Successfully";
                return RedirectToAction("Index");
            }
            ViewBag.ProductParamId = new SelectList(db.ProductParams, "ProductParamId", "ProductParamName", paramvalue.ProductParamId);
            return View(paramvalue);
        }

        //
        // GET: /AttributeValues/Delete/5

        public ActionResult Delete(int id = 0)
        {
            ParamValue paramvalue = db.ParamValues.Find(id);
            if (paramvalue == null)
            {
                return HttpNotFound();
            }
            return View(paramvalue);
        }

        //
        // POST: /AttributeValues/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            ParamValue paramvalue = db.ParamValues.Find(id);
            db.ParamValues.Remove(paramvalue);
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