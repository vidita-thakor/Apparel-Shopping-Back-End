using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Administrator.Models;
using System.IO;
using System.Data.SqlClient;
using PagedList;
using System.Data.Entity.Infrastructure;


namespace Administrator.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class ProductImageController : Controller
    {
        private ApparelShoppingContext db = new ApparelShoppingContext();

        //
        // GET: /ProductImage/

        public ActionResult Index(string sortOrder, string currentFilter, string searchString, int? page)
        {
            ViewBag.CurrentSort = sortOrder;
            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "Name desc" : "";
            ViewBag.ProductSortParm = sortOrder == "Product" ? "Product desc" : "Product";
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
            
            var productimages = db.ProductImages.Include(p => p.Product);
            if (!String.IsNullOrEmpty(searchString))
            {
                productimages = productimages.Where(s => s.ImageTitle.Contains(searchString) ||
                                               s.ImageName.Contains(searchString) ||
                                               s.Product.ProductName.Contains(searchString));
            }

            switch (sortOrder)
            {
                case "Name desc":
                    productimages = productimages.OrderByDescending(s => s.ImageTitle);
                    break;
                case "Product":
                    productimages = productimages.OrderBy(s => s.Product.ProductName);
                    break;
                case "Product desc":
                    productimages = productimages.OrderByDescending(s => s.Product.ProductName);
                    break;
                case "Date":
                    productimages = productimages.OrderBy(s => s.ImageCreated);
                    break;
                case "Date desc":
                    productimages = productimages.OrderByDescending(s => s.ImageCreated);
                    break;
                default:
                    productimages = productimages.OrderBy(s => s.Product.ProductName);
                    break;
            }
            int pageSize = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["TotalRecordPerPage"]);
            int pageNumber = (page ?? 1);
            ViewData["Success"] = TempData["Message"];
            //var productimages = from s in db.Products
            //select s;
            //productimages = productimages.Where(s => s.ProductId.Equals(pid));
            return View(productimages.ToPagedList(pageNumber, pageSize));

        }

        //
        // GET: /ProductImage/Details/5

        public ActionResult Details(int id = 0)
        {
            ProductImage productimage = db.ProductImages.Find(id);
            if (productimage == null)
            {
                return HttpNotFound();
            }
            return View(productimage);
        }

        //
        // GET: /ProductImage/Create

        public ActionResult Create()
        {
            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "ProductName");
            return View();
        }

        //
        // POST: /ProductImage/Create

        //[HttpPost]
        //public ActionResult Create(ProductImage productimage)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.ProductImages.Add(productimage);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    ViewBag.ProductId = new SelectList(db.Products, "ProductId", "ProductName", productimage.ProductId);
        //    return View(productimage);
        //}

        public bool HasFile(HttpPostedFileBase file)
        {
            return (file != null && file.ContentLength > 0) ? true : false;
        }

        [HttpPost]
        public ActionResult Create(ProductImage productimage)
        {
            if (ModelState.IsValid)
            {

                foreach (string upload in Request.Files)
                {
                    if (!HasFile(Request.Files[upload])) continue;
                    //string path = AppDomain.CurrentDomain.BaseDirectory + "uploads/";
                    string path = "C:/Users/Abhishek/Documents/Visual Studio 2012/Projects/DemoAppAs/DemoAppAs/uploads";
                    string filename = Path.GetFileName(Request.Files[upload].FileName);
                    Request.Files[upload].SaveAs(Path.Combine(path, filename));
                    
                    productimage.ImageName = Request.Files[upload].FileName;
                }

                
                db.ProductImages.Add(productimage);
                db.SaveChanges();
                TempData["Message"] = "Record Created Successfully";
                return RedirectToAction("Index");
            }

            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "ProductName", productimage.ProductId);
            return View(productimage);
        }



        //
        // GET: /ProductImage/Edit/5

        public ActionResult Edit(int id = 0)
        {
            ProductImage productimage = db.ProductImages.Find(id);
            if (productimage == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "ProductName", productimage.ProductId);
            return View(productimage);
        }

        //
        // POST: /ProductImage/Edit/5

        [HttpPost]
        public ActionResult Edit(ProductImage productimage, HttpPostedFileBase ImageName)
        {
            try
            {
                if (ModelState.IsValid)
                {
                        ProductImage dbproductimage = db.ProductImages.Find(productimage.ImageId);
                        dbproductimage.ProductId = productimage.ProductId;
                        dbproductimage.ImageTitle = productimage.ImageTitle;
                        dbproductimage.ImageAltText = productimage.ImageAltText;
                        dbproductimage.ImageIsMain = productimage.ImageIsMain;
                        dbproductimage.ImageCreated = productimage.ImageCreated;

                        if (ImageName != null && ImageName.ContentLength > 0)
                        {
                            //string path = AppDomain.CurrentDomain.BaseDirectory + "uploads/";
                            string path = "C:/Users/Abhishek/Documents/Visual Studio 2012/Projects/DemoAppAs/DemoAppAs/uploads";
                            string filename = Path.GetFileName(ImageName.FileName);
                            ImageName.SaveAs(Path.Combine(path, filename));
                            //productimage.ImageName = Request.Files[upload].FileName;
                            if (productimage.ImageName != null)
                            {
                                dbproductimage.ImageName = filename;
                            }

                        }


                    //db.Entry(productimage).State = EntityState.Modified;
                    db.SaveChanges();
                    TempData["Message"] = "Record Updated Successfully";
                    return RedirectToAction("Index");
                }
            }
            catch (DbUpdateConcurrencyException ex)
            {
                var entry = ex.Entries.Single();
                var databaseValues = (ProductImage)entry.GetDatabaseValues().ToObject();
                var clientValues = (ProductImage)entry.Entity;
                productimage.ImageId = databaseValues.ImageId;
                productimage.ProductId = databaseValues.ProductId;
                productimage.ImageTitle = databaseValues.ImageTitle;
                productimage.ImageName = databaseValues.ImageName;
            }
               
           
            
            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "ProductName", productimage.ProductId);
            return View(productimage);
        }

        //
        // GET: /ProductImage/Delete/5

        public ActionResult Delete(int id = 0)
        {
            ProductImage productimage = db.ProductImages.Find(id);
            if (productimage == null)
            {
                return HttpNotFound();
            }
            return View(productimage);
        }

        //
        // POST: /ProductImage/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            ProductImage productimage = db.ProductImages.Find(id);
            db.ProductImages.Remove(productimage);
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