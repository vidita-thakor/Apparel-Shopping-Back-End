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
    public class InventoryController : Controller
    {
        private ApparelShoppingContext db = new ApparelShoppingContext();

        //
        // GET: /Inventory/

        public ActionResult Index(string sortOrder, string currentFilter, string searchString, int? page)
        {
            ViewBag.CurrentSort = sortOrder;
            ViewBag.ProductSortParm = String.IsNullOrEmpty(sortOrder) ? "Product desc" : "";
            ViewBag.SizeSortParm = sortOrder == "Size" ? "Size desc" : "Size";
            ViewBag.ColorSortParm = sortOrder == "Color" ? "Color desc" : "Color";

            if (Request.HttpMethod == "GET")
            {
                searchString = currentFilter;
            }
            else
            {
                page = 1;
            }
            ViewBag.CurrentFilter = searchString;

            var inventories = db.Inventories.Include(i => i.ParamValue).Include(i => i.ParamValue1).Include(i => i.Product);

            if (!String.IsNullOrEmpty(searchString))
            {
                inventories = inventories.Where(s => s.Product.ProductName.Contains(searchString)
                                       || s.ParamValue.ParamValue1.Contains(searchString) 
                                       || s.ParamValue1.ParamValue1.Contains(searchString) );
            }

            switch (sortOrder)
            {
                case "Product desc":
                    inventories = inventories.OrderByDescending(s => s.Product.ProductName);
                    break;
                case "Size":
                    inventories = inventories.OrderBy(s => s.ParamValue1.ParamValue1);
                    break;
                case "Size desc":
                    inventories = inventories.OrderByDescending(s => s.ParamValue1.ParamValue1);
                    break;
                case "Color":
                    inventories = inventories.OrderBy(s => s.ParamValue.ParamValue1);
                    break;
                case "Color desc":
                    inventories = inventories.OrderByDescending(s => s.ParamValue.ParamValue1);
                    break;
                default:
                    inventories = inventories.OrderBy(s => s.Product.ProductName);
                    break;
            }

            int pageSize = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["TotalRecordPerPage"]); ;
            int pageNumber = (page ?? 1);

            ViewData["Success"] = TempData["Message"];
            return View(inventories.ToPagedList(pageNumber, pageSize));
           
        }

        //
        // GET: /Inventory/Details/5

        public ActionResult Details(int id = 0)
        {
            Inventory inventory = db.Inventories.Find(id);
            if (inventory == null)
            {
                return HttpNotFound();
            }
            return View(inventory);
        }

        //
        // GET: /Inventory/Create

        public ActionResult Create()
        {
            ViewBag.ParamColorValueId = new SelectList(db.ParamValues.Where(c=>c.ProductParamId.Equals(1)), "ParamValueId", "ParamValue1");
            ViewBag.ParamSizeValueId = new SelectList(db.ParamValues.Where(c => c.ProductParamId.Equals(2)), "ParamValueId", "ParamValue1");
            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "ProductName");
            return View();
        }

        //
        // POST: /Inventory/Create

        [HttpPost]
        public ActionResult Create(Inventory inventory)
        {
            if (ModelState.IsValid)
            {
                db.Inventories.Add(inventory);
                db.SaveChanges();
                TempData["Message"] = "Record Created Successfully";
                return RedirectToAction("Index");
            }

            ViewBag.ParamColorValueId = new SelectList(db.ParamValues.Where(c => c.ProductParamId.Equals(1)), "ParamValueId", "ParamValue1", inventory.ParamColorValueId);
            ViewBag.ParamSizeValueId = new SelectList(db.ParamValues.Where(c => c.ProductParamId.Equals(2)), "ParamValueId", "ParamValue1", inventory.ParamSizeValueId);
            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "ProductName", inventory.ProductId);
            return View(inventory);
        }

        //
        // GET: /Inventory/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Inventory inventory = db.Inventories.Find(id);
            if (inventory == null)
            {
                return HttpNotFound();
            }
            ViewBag.ParamColorValueId = new SelectList(db.ParamValues.Where(c => c.ProductParamId.Equals(1)), "ParamValueId", "ParamValue1", inventory.ParamColorValueId);
            ViewBag.ParamSizeValueId = new SelectList(db.ParamValues.Where(c => c.ProductParamId.Equals(2)), "ParamValueId", "ParamValue1", inventory.ParamSizeValueId);
            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "ProductName", inventory.ProductId);
            return View(inventory);
        }

        //
        // POST: /Inventory/Edit/5

        [HttpPost]
        public ActionResult Edit(Inventory inventory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(inventory).State = EntityState.Modified;
                db.SaveChanges();
                TempData["Message"] = "Record Updated Successfully";
                return RedirectToAction("Index");
            }
            ViewBag.ParamColorValueId = new SelectList(db.ParamValues.Where(c => c.ProductParamId.Equals(1)), "ParamValueId", "ParamValue1", inventory.ParamColorValueId);
            ViewBag.ParamSizeValueId = new SelectList(db.ParamValues.Where(c => c.ProductParamId.Equals(2)), "ParamValueId", "ParamValue1", inventory.ParamSizeValueId);
            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "ProductName", inventory.ProductId);
            return View(inventory);
        }

        //
        // GET: /Inventory/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Inventory inventory = db.Inventories.Find(id);
            if (inventory == null)
            {
                return HttpNotFound();
            }
            return View(inventory);
        }

        //
        // POST: /Inventory/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Inventory inventory = db.Inventories.Find(id);
            db.Inventories.Remove(inventory);
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