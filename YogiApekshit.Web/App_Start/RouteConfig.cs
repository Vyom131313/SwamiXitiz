using System.Web.Mvc;
using System.Web.Routing;

namespace YogiApekshit.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("elmah.axd");
            routes.IgnoreRoute("favicon.ico");
            routes.IgnoreRoute("robots.txt");
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(name: "routeOne", url: "routesDemo/One", defaults: new { controller = "RoutesDemo", action = "One" });
            routes.MapRoute(name: "routeTwo", url: "routesDemo/Two/{donuts}", defaults: new { controller = "RoutesDemo", action = "Two", donuts = UrlParameter.Optional });
            routes.MapRoute(name: "routeThree", url: "routesDemo/Three", defaults: new { controller = "RoutesDemo", action = "Three" });
            routes.MapRoute(name: "register", url: "Account/Register", defaults: new { controller = "Account", action = "Register" });
            routes.MapRoute(name: "routeFour", url: "routesDemo/Four", defaults: new { controller = "RoutesDemo", action = "Four" });
            
            routes.MapRoute(name: "Default", url: "{controller}/{action}/{id}", defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional });
            //routes.MapRoute(name: "Default", url: "{*url}", defaults: new { controller = "Home", action = "Index" });
        }
    }
}