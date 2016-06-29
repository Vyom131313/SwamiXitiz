using Data.Core.IRepository;
using SwamiXitiz.Data.Models;
using SwamiXitiz.Data.ModelsPartial;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Linq;
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

            foreach (var book in bookRepo.GetAll().Where(c => c.ExamLevelId == Constants.ExamLevels.Prarambh))
            {
                var mnuBook = new MenuItem { Name = book.Name_Eng, IConClass = "fa fa-pencil" };
                mnuBook.MenuItems = new List<MenuItem>();

                foreach (var chapter in book.BookChapters)
                {
                    mnuBook.MenuItems.Add(new MenuItem { Name = string.Format("{0}. {1}", chapter.ChapterNumber, chapter.Name_Eng), IConClass = "fa fa-pencil" });
                }

                mnuPrarambh.MenuItems.Add(mnuBook);
            }

            root.MenuItems.Add(mnuPrarambh);

            #region Q/A by Categories
            root.MenuItems.Add(new MenuItem
            {
                Name = "Q/A by Categories",
                IConClass = "fa fa-pencil",
                MenuItems = new List<MenuItem> 
                {
                    new MenuItem { Name = "Who Whom When", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.WhoWhomWhen } },
                    new MenuItem { Name = "Ans in One Sentence", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.OneSentence }  },
                    new MenuItem { Name = "Incorrect Sentence", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.CorrectSentence }  },
                    new MenuItem { Name = "Short Notes", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.ShortNote}  },
                    new MenuItem { Name = "Correct Sequence", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.CorrectSequence }  },
                    new MenuItem { Name = "Fill In Blanks", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.FillInBlank }  },
                    new MenuItem { Name = "Select Correct Options", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.CorrectOption }  },
                    new MenuItem { Name = "Give Reasons", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Reason }  },
                    new MenuItem { Name = "Shloks", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Shlok }  },
                    new MenuItem { Name = "Kirtan", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Kirtan }  },
                    new MenuItem { Name = "Swamini Vato", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.SwaminiVat }  },
                }
            });
            #endregion

            //new MenuItem { Name = "Pravesh-1", IConClass = "fa fa-pencil",
            //    MenuItems = new List<MenuItem>
            //    {
            //        new MenuItem { Name = "Que-1", ControllerName="Pravesh_1", ActionName="Que_1" },
            //        new MenuItem { Name = "Que-2", ControllerName="Pravesh_1", ActionName="Que_2" },
            //        new MenuItem { Name = "Que-4", ControllerName="Pravesh_1", ActionName="Que_4" },
            //        new MenuItem { Name = "Que-7", ControllerName="Pravesh_1", ActionName="Que_7" },
            //        new MenuItem { Name = "Que-8", ControllerName="Pravesh_1", ActionName="Que_8" },
            //        new MenuItem { Name = "Que-9", ControllerName="Pravesh_1", ActionName="Que_9" },
            //        new MenuItem { Name = "Que-12", ControllerName="Pravesh_1", ActionName="Que_12" }
            //    }
            //}, 

            System.Web.HttpContext.Current.Session["Menus"] = root;
            return System.Web.HttpContext.Current.Session["Menus"] as MenuItem;
        }
    }
}
