using Data.Core.IRepository;
using SwamiXitiz.Data.Models;
using SwamiXitiz.Data.ModelsPartial;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using YogiApekshit.Web.Models;

namespace YogiApekshit.Web.Controllers
{
    public class BaseController : Controller
    {
        private readonly IRepository<BookChapter> bookChapterRepo;
        private readonly IRepository<Book> bookRepo;

        public BaseController(IRepository<BookChapter> bookChapterRepo, IRepository<Book> bookRepo)
        {
            this.bookRepo = bookRepo;
            this.bookChapterRepo = bookChapterRepo;

            if (System.Web.HttpContext.Current.Session["Menus"] == null)
                System.Web.HttpContext.Current.Session["Menus"] = BuildMenu();
        }

        public MenuItem BuildMenu()
        {
            var root = new MenuItem { Name = "Home", ControllerName = "Home", ActionName = "Index" };
            root.MenuItems = new List<MenuItem>();

            root.MenuItems.Add(new MenuItem { Name = "Dashboard", ControllerName = "Home", ActionName = "Index", IConClass = "fa fa-dashboard" });

            var mnuPrarambh = new MenuItem { Name = "Prarambh", IConClass = "fa fa-pencil" };
            mnuPrarambh.MenuItems = new List<MenuItem>();

            var prarambhBooks = bookRepo.GetAll().Where(c => c.ExamLevelId == Constants.ExamLevels.Prarambh);

            foreach (var book in prarambhBooks)
            {
                var mnuBook = new MenuItem { Name = book.Name_Eng, IConClass = "fa fa-pencil", IConUrl = string.Format("/Images/{0}/{1}-eng.jpg", book.Code_Eng, book.Code_Eng) };
                mnuBook.MenuItems = new List<MenuItem>();
                mnuBook.MenuItems.Add(new MenuItem { Name = "--- All Chapters ---", ControllerName = "QA", ActionName = "QA_By_Book_Category_Chapter", RouteValues = new { bookId = book.Id, chapterNumber = 0 } });

                foreach (var chapter in book.BookChapters)
                {
                    mnuBook.MenuItems.Add(new MenuItem { Name = string.Format("{0}. {1}", chapter.ChapterNumber, chapter.Name_Eng), ControllerName = "QA", ActionName = "QA_By_Book_Category_Chapter", RouteValues = new { bookId = book.Id, chapterNumber = chapter.ChapterNumber } });
                }

                mnuPrarambh.MenuItems.Add(mnuBook);
            }

            root.MenuItems.Add(mnuPrarambh);

            #region Q/A by Categories

            var mnuCategories = new MenuItem { Name = "Q/A by Categories", IConClass = "fa fa-pencil", MenuItems = new List<MenuItem>() };

            var categories = Enum.GetNames(typeof(Constants.Que_Categories));
            foreach (var category in categories)
            {
                var categoryMenu = new MenuItem { Name = category.Replace("_", " "), MenuItems = new List<MenuItem>() };

                foreach (var book in prarambhBooks)
                {
                    var mnuBook = new MenuItem
                    {
                        Name = book.Name_Eng,
                        IConClass = "fa fa-pencil",
                        IConUrl = string.Format("/Images/{0}/{1}-eng.jpg", book.Code_Eng, book.Code_Eng),
                        ControllerName = "QA",
                        ActionName = "QA_By_Book_Category_Chapter",
                        RouteValues = new { bookId = book.Id, category = category }
                    };

                    categoryMenu.MenuItems.Add(mnuBook);
                }

                mnuCategories.MenuItems.Add(categoryMenu);
            }

            root.MenuItems.Add(mnuCategories);

            /*
            root.MenuItems.Add(new MenuItem
            {
                Name = "Q/A by Categories",
                IConClass = "fa fa-pencil",
                MenuItems = new List<MenuItem> 
                {
                    new MenuItem { Name = "Who Whom When", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Who_Whom_When } },
                    new MenuItem { Name = "Ans in One Sentence", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.One_Sentence }  },
                    new MenuItem { Name = "Incorrect Sentence", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Correct_Sentence }  },
                    new MenuItem { Name = "Short Notes", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Short_Note}  },
                    new MenuItem { Name = "Correct Sequence", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Correct_Sequence }  },
                    new MenuItem { Name = "Fill In Blanks", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Fill_In_Blank }  },
                    new MenuItem { Name = "Select Correct Options", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Correct_Option }  },
                    new MenuItem { Name = "Give Reasons", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Reason }  },
                    new MenuItem { Name = "Shloks", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Shlok }  },
                    new MenuItem { Name = "Kirtan", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Kirtan }  },
                    new MenuItem { Name = "Swamini Vato", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Swamini_Vaato }  },
                }
            });*/
            #endregion

            System.Web.HttpContext.Current.Session["Menus"] = root;
            return System.Web.HttpContext.Current.Session["Menus"] as MenuItem;
        }
    }
}
