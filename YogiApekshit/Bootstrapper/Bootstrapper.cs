using Data.Core;
using Mvc.Core.Helpers;
using Repository.Core;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace YogiApekshit
{
    public class Bootstrapper
    {
        public static void Bootstrap()
        {
            AreaRegistration.RegisterAllAreas();
            RouteConfigurator.RegisterRoutes(RouteTable.Routes);
            
            ControllerBuilder.Current.SetControllerFactory(new WindsorControllerFactory(IoC.Container));
            WindsorConfigurator.Configure();
            IConweyConfigurator.Configure();

            //Globals.PicturesPath = HttpContext.Current.Server.MapPath("~/pictures");
            new Worker().Start();
        }
    }
}