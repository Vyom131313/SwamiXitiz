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
        public string Name { get; set; }
        public string AreaName { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public string IConClass { get; set; }
        public string IConUrl { get; set; }
        public object RouteValues { get; set; }

        public bool IsActive { get; set; }
        public List<MenuItem> MenuItems = new List<MenuItem>();
        public List<NonMenuItem> NonMenuItems = new List<NonMenuItem>();

        public MenuItem()
        {
            Name = string.Empty;
            AreaName = string.Empty;
            ControllerName = string.Empty;
            ActionName = string.Empty;

            IConClass = "fa fa-caret-right";
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

        public List<BreadCrumb> GetBreadCrumbByControllerAndAction(string controller, string action, string area = "")
        {
            var breadCrumbs = new List<BreadCrumb>();
            if (this.ControllerName.Equals(controller) && this.ActionName.Equals(action) && this.AreaName.Equals(area))
            {
                breadCrumbs.Add(this.BreadCrumb);
            }
            else if (this.NonMenuItems.Where(obj => obj.ControllerName.Equals(controller) && obj.ActionName.Equals(action) && obj.AreaName.Equals(area)).Count() > 0)
            {
                var nonMenuItem = this.NonMenuItems.Where(obj => obj.ControllerName.Equals(controller) && obj.ActionName.Equals(action) && obj.AreaName.Equals(area)).FirstOrDefault();
                breadCrumbs.Add(this.BreadCrumb);
                breadCrumbs.Add(nonMenuItem.BreadCrumb);
            }
            else
            {
                foreach (var child in this.MenuItems)
                {
                    breadCrumbs = child.GetBreadCrumbByControllerAndAction(controller, action, area);
                    if (breadCrumbs.Count > 0)
                    {
                        breadCrumbs.Insert(0, this.BreadCrumb);
                        break;
                    }
                }
            }

            return breadCrumbs;
        }
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

    public class MenuController : ApiController
    {
        public MenuController()
        {
        }

        public MenuItem Get()
        {
            return BuildMenu();
        }

        public MenuItem BuildMenu()
        {
            var root = new MenuItem { Name = "Home", ControllerName = "Home", ActionName = "Index", MenuItems = new List<MenuItem>() };
            root.MenuItems.Add(new MenuItem { Name = "Dashboard", ControllerName = "Home", ActionName = "Index", IConClass = "fa fa-dashboard" });

            #region Prarambh
            var mnuPrarambh = new MenuItem { Name = "Prarambh", IConClass = "fa fa-pencil", MenuItems = new List<MenuItem>() };
            using (var dbContext = new YogiApekshitContext())
            {
                var prarambhBooks = dbContext.Books.Where(c => c.ExamLevelId == Constants.ExamLevels.Prarambh).ToList();
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
            }

            root.MenuItems.Add(mnuPrarambh);
            #endregion

            //#region Pravesh
            //var mnuPravesh = new MenuItem { Name = "Pravesh", IConClass = "fa fa-pencil", MenuItems = new List<MenuItem>() };
            //var praveshBooks = dbContext.Books.Where(c => c.ExamLevelId == Constants.ExamLevels.Pravesh);
            //foreach (var book in praveshBooks)
            //{
            //    var mnuBook = new MenuItem { Name = book.Name_Eng, IConClass = "fa fa-pencil", IConUrl = string.Format("/Images/{0}/{1}-eng.jpg", book.Code_Eng, book.Code_Eng) };
            //    mnuBook.MenuItems = new List<MenuItem>();
            //    mnuBook.MenuItems.Add(new MenuItem { Name = "--- All Chapters ---", ControllerName = "QA", ActionName = "QA_By_Book_Category_Chapter", RouteValues = new { bookId = book.Id, chapterNumber = 0 } });

            //    foreach (var chapter in book.BookChapters)
            //    {
            //        mnuBook.MenuItems.Add(new MenuItem { Name = string.Format("{0}. {1}", chapter.ChapterNumber, chapter.Name_Eng), ControllerName = "QA", ActionName = "QA_By_Book_Category_Chapter", RouteValues = new { bookId = book.Id, chapterNumber = chapter.ChapterNumber } });
            //    }

            //    mnuPravesh.MenuItems.Add(mnuBook);
            //}

            //root.MenuItems.Add(mnuPravesh);
            //#endregion

            //#region Q/A by Categories

            //var mnuCategories = new MenuItem { Name = "Q/A by Categories", IConClass = "fa fa-pencil", MenuItems = new List<MenuItem>() };

            //var categories = Enum.GetNames(typeof(Constants.Que_Categories));
            //foreach (var category in categories)
            //{
            //    var categoryMenu = new MenuItem { Name = category.Replace("_", " "), MenuItems = new List<MenuItem>() };

            //    foreach (var book in prarambhBooks)
            //    {
            //        var mnuBook = new MenuItem
            //        {
            //            Name = book.Name_Eng,
            //            IConClass = "fa fa-pencil",
            //            IConUrl = string.Format("/Images/{0}/{1}-eng.jpg", book.Code_Eng, book.Code_Eng),
            //            ControllerName = "QA",
            //            ActionName = "QA_By_Book_Category_Chapter",
            //            RouteValues = new { bookId = book.Id, category = category }
            //        };

            //        categoryMenu.MenuItems.Add(mnuBook);
            //    }

            //    mnuCategories.MenuItems.Add(categoryMenu);
            //}

            //root.MenuItems.Add(mnuCategories);

            ///*
            //root.MenuItems.Add(new MenuItem
            //{
            //    Name = "Q/A by Categories",
            //    IConClass = "fa fa-pencil",
            //    MenuItems = new List<MenuItem> 
            //    {
            //        new MenuItem { Name = "Who Whom When", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Who_Whom_When } },
            //        new MenuItem { Name = "Ans in One Sentence", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.One_Sentence }  },
            //        new MenuItem { Name = "Incorrect Sentence", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Correct_Sentence }  },
            //        new MenuItem { Name = "Short Notes", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Short_Note}  },
            //        new MenuItem { Name = "Correct Sequence", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Correct_Sequence }  },
            //        new MenuItem { Name = "Fill In Blanks", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Fill_In_Blank }  },
            //        new MenuItem { Name = "Select Correct Options", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Correct_Option }  },
            //        new MenuItem { Name = "Give Reasons", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Reason }  },
            //        new MenuItem { Name = "Shloks", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Shlok }  },
            //        new MenuItem { Name = "Kirtan", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Kirtan }  },
            //        new MenuItem { Name = "Swamini Vato", ControllerName="Prarambh", ActionName="QuestionCategory", RouteValues=new { category=Constants.Que_Categories.Swamini_Vaato }  },
            //    }
            //});*/
            //#endregion

            //System.Web.HttpContext.Current.Session["Menus"] = root;
            //return System.Web.HttpContext.Current.Session["Menus"] as MenuItem;

            return root;
        }
    }

    public class MenuBuilder
    {
        public static List<BreadCrumb> BuildBreadCrumb(string controller, string action, string area = "")
        {
            var menus = BuildMenu();
            return menus != null
                ? menus.GetBreadCrumbByControllerAndAction(controller, action, area)
                : new List<BreadCrumb>();
        }

        public static MenuItem BuildMenu()
        {
            if (System.Web.HttpContext.Current.Session["Menus"] != null)
            {
                return System.Web.HttpContext.Current.Session["Menus"] as MenuItem;
            }

            return System.Web.HttpContext.Current.Session["Menus"] as MenuItem;
        }
    }
}