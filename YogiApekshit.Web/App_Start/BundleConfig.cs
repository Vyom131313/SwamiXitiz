using System.Web;
using System.Web.Optimization;

namespace YogiApekshit.Web
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include("~/Scripts/modernizr-*"));

            bundles.Add(new Bundle("~/bundles/Scripts")
                        .Include("~/Scripts/jquery-{version}.js")
                        .Include("~/Scripts/angular.js")
                        .Include("~/Scripts/angular-route.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include("~/Content/site.css"));

            BundleTable.EnableOptimizations = false;
        }
    }
}