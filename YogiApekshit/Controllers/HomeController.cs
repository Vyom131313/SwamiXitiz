using SwamiXitiz.Data.Models;
using System.Web.Mvc;
using SwamiXitiz.Data;
using Data.Core.IService;
using Data.Core.Security;
using Data.Core.IRepository;
using System.Linq;
using Repository.Core;
using Mvc.Core.Controllers;
using YogiApekshit.Models;
using Mvc.Core.Mappers;

namespace YogiApekshit.Controllers
{
    public class HomeController : BaseController // CruderController<Book, BookInput>
    {
        IRepository<Book> bookRepo;
        public HomeController(IRepository<Book> bookRepo)
        {
            this.bookRepo = bookRepo;
        }
        //public HomeController(ICrudService<Book> service, IMapper<Book, BookInput> v, IRepository<Book> bookRepo)
        //    : base(service, v)
        //{
        //    this.bookRepo = bookRepo;
        //}

        public ActionResult Index()
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            var x = bookRepo.Get(1);

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
