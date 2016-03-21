using System.Web.Mvc;
using YogiApekshit.Models;

namespace YogiApekshit.Controllers
{
    public class BaseController : Controller
    {
        //
        // GET: /Base/

        public BaseController()
        {
            System.Web.HttpContext.Current.Session["Menus"] = MenuBuilder.BuildMenu();
        }
    }
}
