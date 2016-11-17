using Data.Core.IRepository;
using SwamiXitiz.Data.Models;
using SwamiXitiz.Data.ModelsPartial;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace WebApiService.Controllers
{
    public class BreadCrumb
    {
        public string Title { get; set; }
        public string AreaName { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
    }

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
        public bool IsActive { get; set; }
        public List<MenuItem> MenuItems = new List<MenuItem>();
        //public List<NonMenuItem> NonMenuItems = new List<NonMenuItem>();

        public MenuItem()
        {
            Name = string.Empty;
            AreaName = string.Empty;
            ControllerName = string.Empty;
            ActionName = string.Empty;

            IConClass = "fa fa-caret-right";
        }

        //public BreadCrumb BreadCrumb
        //{
        //    get
        //    {
        //        return new BreadCrumb
        //        {
        //            Title = this.Name,
        //            ControllerName = this.ControllerName,
        //            ActionName = this.ActionName,
        //            AreaName = this.AreaName
        //        };
        //    }
        //}

        //public List<BreadCrumb> GetBreadCrumbByControllerAndAction(string controller, string action, string area = "")
        //{
        //    var breadCrumbs = new List<BreadCrumb>();
        //    if (this.ControllerName.Equals(controller) && this.ActionName.Equals(action) && this.AreaName.Equals(area))
        //    {
        //        breadCrumbs.Add(this.BreadCrumb);
        //    }
        //    else if (this.NonMenuItems.Where(obj => obj.ControllerName.Equals(controller) && obj.ActionName.Equals(action) && obj.AreaName.Equals(area)).Count() > 0)
        //    {
        //        var nonMenuItem = this.NonMenuItems.Where(obj => obj.ControllerName.Equals(controller) && obj.ActionName.Equals(action) && obj.AreaName.Equals(area)).FirstOrDefault();
        //        breadCrumbs.Add(this.BreadCrumb);
        //        breadCrumbs.Add(nonMenuItem.BreadCrumb);
        //    }
        //    else
        //    {
        //        foreach (var child in this.MenuItems)
        //        {
        //            breadCrumbs = child.GetBreadCrumbByControllerAndAction(controller, action, area);
        //            if (breadCrumbs.Count > 0)
        //            {
        //                breadCrumbs.Insert(0, this.BreadCrumb);
        //                break;
        //            }
        //        }
        //    }

        //    return breadCrumbs;
        //}
    }

    public class NonMenuItem
    {
        public string Name { get; set; }
        public string AreaName { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }

        public NonMenuItem()
        {
            Name = string.Empty;
            AreaName = string.Empty;
            ControllerName = string.Empty;
            ActionName = string.Empty;
        }

        public BreadCrumb BreadCrumb
        {
            get
            {
                return new BreadCrumb
                {
                    Title = this.Name,
                    ControllerName = this.ControllerName,
                    ActionName = this.ActionName,
                    AreaName = this.AreaName
                };
            }
        }
    }

    //[Route("api/Menu")]
    public class MenuController : ApiController
    {
        public MenuController()
        {
        }

        public IEnumerable<MenuItem> Get()
        {
            return BuildMenu();
        }

        public IEnumerable<MenuItem> BuildMenu()
        {
            var menuCounter = 0;

            var menuItems = new List<MenuItem>();

            var mnuPrarambh = new MenuItem { Id = menuCounter++, Name = "Prarambh", IConClass = "fa fa-pencil", MenuItems = new List<MenuItem>() };

            #region Prarambh
            using (var dbContext = new YogiApekshitContext())
            {
                var prarambhBooks = dbContext.Books.Where(c => c.ExamLevelId == Constants.ExamLevels.Prarambh).ToList();
                foreach (var book in prarambhBooks)
                {
                    var mnuBook = new MenuItem { Id = menuCounter++, Name = book.Name_Eng, IConClass = "fa fa-pencil", IConUrl = string.Format("/Images/{0}/{1}-eng.jpg", book.Code_Eng, book.Code_Eng), BookId = book.Id, ChapterNumber = 0, MenuItems = new List<MenuItem>() };
                    mnuBook.MenuItems.Add(new MenuItem { Id = menuCounter++, Name = "--- All Chapters ---", ControllerName = "QA", ActionName = "QA_By_Book_Category_Chapter", BookId = book.Id, ChapterNumber = 0, RouteValues = new { bookId = book.Id, chapterNumber = 0 } });
                    foreach (var chapter in book.BookChapters)
                    {
                        mnuBook.MenuItems.Add(new MenuItem { Id = menuCounter++, Name = string.Format("{0}. {1}", chapter.ChapterNumber, chapter.Name_Eng), ControllerName = "QA", ActionName = "QA_By_Book_Category_Chapter", BookId = book.Id, ChapterNumber = chapter.ChapterNumber.Value, RouteValues = new { bookId = book.Id, chapterNumber = chapter.ChapterNumber } });
                    }

                    mnuPrarambh.MenuItems.Add(mnuBook);
                }

                var categories = Enum.GetNames(typeof(Constants.Que_Categories));
                foreach (var category in categories)
                {
                    var menucategory = new MenuItem { Id = menuCounter++, Name = category.Replace("_", " "), MenuItems = new List<MenuItem>() };
                    foreach (var book in prarambhBooks)
                    {
                        menucategory.MenuItems.Add(new MenuItem { Id = menuCounter++, Name = book.Name_Eng, IConClass = "fa fa-pencil", IConUrl = string.Format("/Images/{0}/{1}-eng.jpg", book.Code_Eng, book.Code_Eng), BookId = book.Id, ChapterNumber = 0, MenuItems = new List<MenuItem>() });
                    }

                    mnuPrarambh.MenuItems.Add(menucategory);
                }
            }
            menuItems.AddRange(mnuPrarambh.MenuItems);
            #endregion

            return menuItems;
        }
    }
}