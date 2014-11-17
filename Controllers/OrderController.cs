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
    public class OrderController : Controller
    {
        private ApparelShoppingContext db = new ApparelShoppingContext();

        //
        // GET: /Order/

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

            var orders = from s in db.Orders
                        select s;
           // var orders = db.Orders.Include(o => o.Customer);
            if (!String.IsNullOrEmpty(searchString))
            {
                orders = orders.Where(s => s.Customer.CustomerFirstName.Contains(searchString) || s.Customer.CustomerLastName.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "Name desc":
                    orders = orders.OrderByDescending(s => s.OrderTransactionId);
                    break;
                case "Date":
                    orders = orders.OrderBy(s => s.OrderDate);
                    break;
                case "Date desc":
                    orders = orders.OrderByDescending(s => s.OrderDate);
                    break;
                case "Customer Id":
                    orders = orders.OrderBy(s => s.CustomerId);
                    break;
                case "Customer Id desc":
                    orders = orders.OrderByDescending(s => s.CustomerId);
                    break;
                case "Total":
                    orders = orders.OrderBy(s => s.OrderTotal);
                    break;
                case "Total desc":
                    orders = orders.OrderByDescending(s => s.OrderTotal);
                    break;
                case "Status":
                    orders = orders.OrderBy(s => s.OrderStatus);
                    break;
                case "Status desc":
                    orders = orders.OrderByDescending(s => s.OrderStatus);
                    break;
                default:
                    orders = orders.OrderBy(s => s.OrderTransactionId);
                    break;
            }

            int pageSize = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["TotalRecordPerPage"]); ;
            int pageNumber = (page ?? 1);

            ViewData["Success"] = TempData["Message"];
            return View(orders.ToPagedList(pageNumber, pageSize));
            
            //return View(orders.ToList());
        }

        //
        // GET: /Order/Details/5

        public ActionResult Details(int id = 0)
        {
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        //
        // GET: /Order/Create

        public ActionResult Create()
        {
            ViewBag.CustomerId = new SelectList(db.Customers, "CustomerId", "CustomerFirstName");
            return View();
        }

        //
        // POST: /Order/Create

        [HttpPost]
        public ActionResult Create(Order order)
        {
            if (ModelState.IsValid)
            {
                db.Orders.Add(order);
                db.SaveChanges();
                TempData["Message"] = "Record Created Successfully";
                return RedirectToAction("Index");
            }

            ViewBag.CustomerId = new SelectList(db.Customers, "CustomerId", "CustomerFirstName", order.CustomerId);
            return View(order);
        }

        //
        // GET: /Order/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            ViewBag.CustomerId = new SelectList(db.Customers, "CustomerId", "CustomerFirstName", order.CustomerId);
            return View(order);
        }

        //
        // POST: /Order/Edit/5

        [HttpPost]
        public ActionResult Edit(Order order)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(order).State = EntityState.Modified;
                    db.SaveChanges();
                    TempData["Message"] = "Record Updated Successfully";
                    return RedirectToAction("Index");
                }
            }
            catch (DbUpdateConcurrencyException ex)
            {
                var entry = ex.Entries.Single();
                var databaseValues = (Order)entry.GetDatabaseValues().ToObject();
                var clientValues = (Order)entry.Entity;
                order.OrderUpdated = databaseValues.OrderUpdated;
                order.CustomerId = databaseValues.Customer.CustomerId;
                order.OrderDate = databaseValues.OrderDate;
                order.OrderSubtotal = databaseValues.OrderSubtotal;
                order.OrderShippingCharges = databaseValues.OrderShippingCharges;
                order.OrderTaxes = databaseValues.OrderTaxes;
                order.OrderTotal = databaseValues.OrderTotal;
                order.OrderCreated = databaseValues.OrderCreated;
                order.OrderShippedDate = databaseValues.OrderShippedDate;
                order.OrderPaymentStatus = databaseValues.OrderPaymentStatus;
                order.OrderStatus = databaseValues.OrderStatus;
                order.OrderShippingCharges = databaseValues.OrderShippingCharges;
            }
            ViewBag.CustomerId = new SelectList(db.Customers, "CustomerId", "CustomerFirstName", order.CustomerId);
            return View(order);
        }

        //
        // GET: /Order/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        //
        // POST: /Order/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Order order = db.Orders.Find(id);
            db.Orders.Remove(order);
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