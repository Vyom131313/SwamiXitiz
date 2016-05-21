using SwamiXitiz.Data.Models;
using System.Web.Mvc;
using SwamiXitiz.Data;
using Data.Core.IService;
using Data.Core.Security;
using Data.Core.IRepository;
using System.Linq;
using Repository.Core;

namespace YogiApekshit.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index(IRepository<Book> bookRepo)
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            //var x = bookRepo.GetAll().ToList();

            return View();
        }

        public ActionResult Faq()
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
