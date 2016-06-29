using CRUD_Angular.Models;
using Data.Core.IRepository;
using SwamiXitiz.Data.Models;
using System.Collections.Generic;
using System.Web.Mvc;

namespace YogiApekshit.Web.Controllers
{
    public class HomeController : BaseController
    {
        public HomeController(IRepository<BookChapter> bookChapterRepo, IRepository<Book> bookRepo)
            : base(bookChapterRepo, bookRepo)
        {

        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CRUD()
        {
            return PartialView();
        }

        public ActionResult logout()
        {
            return PartialView();
        }

        public JsonResult save(Employee data)
        {
            repository save = new repository();
            save.save(data);
            return null;
        }

        public JsonResult getList()
        {
            var emp = new List<Employee>();
            repository getdata = new repository();
            emp = getdata.getList();
            return Json(emp, JsonRequestBehavior.AllowGet);
        }

        public JsonResult delete(Employee emp)
        {
            repository del = new repository();
            del.delete(emp.id);
            return null;
        }

        public JsonResult update(Employee emp)
        {
            repository up = new repository();
            up.update(emp);
            return null;
        }
    }
}