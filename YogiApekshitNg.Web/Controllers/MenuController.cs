using SwamiXitiz.Data.Models;
using SwamiXitiz.Data.ModelsPartial;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
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

        public bool IsActive { get; set; }
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

    //[Route("api/Menu")]
    public class MenuController : ApiController
    {
        public MenuController()
        {
        }

        public IEnumerable<MenuItem> Get(string lang)
        {
            return BuildMenu(lang);
        }

        public IEnumerable<MenuItem> BuildMenu(string lang)
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
                    var mnuBook = new MenuItem { Id = menuCounter++, Name = lang=="Guj" ? book.Name_Guj : book.Name_Eng, IConClass = "fa fa-pencil", IConUrl = string.Format("/Images/{0}/{1}-mnu.png", book.Code_Eng, book.Code_Eng), BookId = book.Id, ChapterNumber = 0, MenuItems = new List<MenuItem>() };
                    //mnuBook.MenuItems.Add(new MenuItem { Id = menuCounter++, Name = "--- All Chapters ---", ControllerName = "QA", ActionName = "QA_By_Book_Category_Chapter", BookId = book.Id, ChapterNumber = 0, RouteValues = new { bookId = book.Id, chapterNumber = 0 } });
                    foreach (var chapter in book.BookChapters)
                    {
                        mnuBook.MenuItems.Add(new MenuItem { Id = menuCounter++, Name = string.Format("{0}. {1}", chapter.ChapterNumber, lang == "Guj" ? chapter.Name_Guj : chapter.Name_Eng), ControllerName = "QA", ActionName = "QA_By_Book_Category_Chapter", BookId = book.Id, ChapterNumber = chapter.ChapterNumber.Value, Category="All", RouteValues = new { bookId = book.Id, chapterNumber = chapter.ChapterNumber } });
                    }

                    mnuPrarambh.MenuItems.Add(mnuBook);
                }

                var categories = Enum.GetValues(typeof(Constants.Que_Categories));
                foreach (var categoryEnum in categories)
                {
                    string categoryDesc = GetEnumDescription((Constants.Que_Categories)categoryEnum, lang);

                    if (categoryDesc == "All")
                        continue;

                    var menucategory = new MenuItem { Id = menuCounter++, Name = categoryDesc.Replace("_", " "), MenuItems = new List<MenuItem>() };
                    foreach (var book in prarambhBooks)
                    {
                        menucategory.MenuItems.Add(new MenuItem { Id = menuCounter++,
                            Name = lang == "Guj" ? book.Name_Guj : book.Name_Eng,
                            IConClass = string.Format("/Images/{0}/{1}-mnu.png", book.Code_Eng, book.Code_Eng),
                            IConUrl = string.Format("/Images/{0}/{1}-eng.jpg", book.Code_Eng, book.Code_Eng),
                            BookId = book.Id,
                            ChapterNumber = 0,
                            Category = categoryEnum.ToString()
                        });
                    }

                    mnuPrarambh.MenuItems.Add(menucategory);
                }
            }
            menuItems.AddRange(mnuPrarambh.MenuItems);
            #endregion

            return menuItems;
        }

        public string GetEnumDescription(Enum value, string lang)
        {
            if(lang=="Eng")
            {
                return value.ToString();
            }

            FieldInfo fi = value.GetType().GetField(value.ToString());

            DescriptionAttribute[] attributes =
                (DescriptionAttribute[])fi.GetCustomAttributes(
                typeof(DescriptionAttribute),
                false);

            if (attributes != null &&
                attributes.Length > 0)
                return attributes[0].Description;
            else
                return value.ToString();
        }
    }
}