using System.Collections.Generic;
using System.Runtime.Caching;
using System.Web.Http;

namespace YogiApekshitNg.Web.Controllers
{
    public class MenuItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string AreaName { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public string IConClass { get; set; }
        public string IConUrl { get; set; }
        public object RouteValues { get; set; }
        public int BookId { get; set; }
        public int ChapterNumber { get; set; }
        public string Category { get; set; }

        public bool IsDivider { get; set; }
        public List<MenuItem> MenuItems = new List<MenuItem>();

        public MenuItem()
        {
            Name = string.Empty;
            AreaName = string.Empty;
            ControllerName = string.Empty;
            ActionName = string.Empty;
            IConClass = "fa fa-caret-right";
        }
    }

    public class MenuController : ApiController
    {
        MemoryCache MemCache = MemoryCache.Default;

        public IEnumerable<MenuItem> Get(string lang)
        {
            return DS.GetMenu(lang);
        }
    }
}