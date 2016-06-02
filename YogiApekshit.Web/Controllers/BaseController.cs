using System.Web.Mvc;
using YogiApekshit.Web.Models;

namespace YogiApekshit.Web.Controllers
{
    public class BaseController : Controller
    {
        //
        // GET: /Base/

        public BaseController()
        {
            if (System.Web.HttpContext.Current.Session["Menus"] == null)
                System.Web.HttpContext.Current.Session["Menus"] = MenuBuilder.BuildMenu();
        }
    }
}
