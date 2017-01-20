using SwamiXitiz.Data.Models;
using SwamiXitiz.Data.ModelsPartial;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Runtime.Caching;
using System.Web;
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

    public static class DS
    {
        public static IEnumerable<MenuItem> GetMenu(string lang)
        {
            var menuCounter = 0;

            var cacheKey = string.Format("Menu_{0}", lang);

            var menuItems = new List<MenuItem>();

            if (HttpContext.Current.Cache[cacheKey] != null && HttpContext.Current.Cache[cacheKey] is List<MenuItem>)
            //if (MemCache.Contains(cacheKey) && MemCache.Get(cacheKey) != null)
            {
                menuItems = HttpContext.Current.Cache[cacheKey] as List<MenuItem>;
                //menuItems = MemCache.Get(cacheKey) as List<MenuItem>;
                return menuItems;
            }

            var mnuPrarambh = new MenuItem { Id = menuCounter++, Name = "Prarambh", IConClass = "fa fa-pencil", MenuItems = new List<MenuItem>() };

            #region Prarambh

            using (var dbContext = new YogiApekshitContext())
            {
                var prarambhBooks = dbContext.Books.Where(c => c.ExamLevelId == Constants.ExamLevels.Prarambh).ToList();
                foreach (var book in prarambhBooks)
                {
                    var mnuBook = new MenuItem { Id = menuCounter++, Name = lang == "Guj" ? book.Name_Guj : book.Name_Eng, IConClass = "fa fa-pencil", IConUrl = string.Format("/Images/{0}/{1}.png", book.Code_Eng, book.Code_Eng), BookId = book.Id, ChapterNumber = 0, MenuItems = new List<MenuItem>() };
                    //mnuBook.MenuItems.Add(new MenuItem { Id = menuCounter++, Name = "--- All Chapters ---", ControllerName = "QA", ActionName = "QA_By_Book_Category_Chapter", BookId = book.Id, ChapterNumber = 0, RouteValues = new { bookId = book.Id, chapterNumber = 0 } });
                    foreach (var chapter in book.BookChapters)
                    {
                        mnuBook.MenuItems.Add(new MenuItem { Id = menuCounter++, Name = string.Format("{0}. {1}", chapter.ChapterNumber, lang == "Guj" ? chapter.Name_Guj : chapter.Name_Eng), ControllerName = "QA", ActionName = "QA_By_Book_Category_Chapter", BookId = book.Id, ChapterNumber = chapter.ChapterNumber.Value, Category = "All", IConUrl = string.Format("/Images/{0}/{1}.png", book.Code_Eng, book.Code_Eng), RouteValues = new { bookId = book.Id, chapterNumber = chapter.ChapterNumber } });
                    }

                    mnuPrarambh.MenuItems.Add(mnuBook);
                }

                // Divider
                mnuPrarambh.MenuItems.Add(new MenuItem { IsDivider = true });

                var categories = Enum.GetValues(typeof(Constants.Que_Categories));
                foreach (var categoryEnum in categories)
                {
                    string categoryDesc = GetEnumDescription((Constants.Que_Categories)categoryEnum, lang);

                    if (categoryDesc == "All")
                        continue;

                    var menucategory = new MenuItem { Id = menuCounter++, Name = categoryDesc.Replace("_", " "), MenuItems = new List<MenuItem>() };
                    foreach (var book in prarambhBooks)
                    {
                        menucategory.MenuItems.Add(new MenuItem
                        {
                            Id = menuCounter++,
                            Name = lang == "Guj" ? book.Name_Guj : book.Name_Eng,
                            IConClass = string.Format("/Images/{0}/{1}-mnu.png", book.Code_Eng, book.Code_Eng),
                            IConUrl = string.Format("/Images/{0}/{1}.png", book.Code_Eng, book.Code_Eng),
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

            HttpContext.Current.Cache.Insert(cacheKey,
                                   menuItems,
                                   null,
                                   System.Web.Caching.Cache.NoAbsoluteExpiration,
                                   TimeSpan.FromDays(10));//Data will be cached for 10 days;

            return menuItems;
        }

        public static QA_VM GetQA(string lang, string category, int bookId, int chapterNumber = 0)
        {
            var cacheKey = string.Format("QAList_{0}_{1}_{2}_{3}", lang, category, bookId, chapterNumber);
            var data = new QA_VM();

            if (HttpContext.Current.Cache[cacheKey] != null && HttpContext.Current.Cache[cacheKey] is QA_VM)
            {
                data = HttpContext.Current.Cache[cacheKey] as QA_VM;
            }
            else
            {
                data = QA_List(new QA_Filter_Parameters { Lang = lang, BookId = bookId, Category = category, ChapterNumber = chapterNumber });

                data.QARecords.ToList().ForEach(c =>
                {
                    if (!string.IsNullOrEmpty(c.Exams))
                    {
                        var exams = string.Empty;
                        c.Exams.Split(new char[] { '|' }).ToList().ForEach(e =>
                        {
                            //exams += "<span class='examIcon' title='" + e + "' >&nbsp;&nbsp;</span>";
                            exams += "<i class='examIcon glyphicon glyphicon-calendar'></i>" + e;
                        });

                        c.Que = string.Format("{0} {1}", c.Que, exams);
                    }
                });

                HttpContext.Current.Cache.Insert(cacheKey,
                                    data,
                                    null,
                                    System.Web.Caching.Cache.NoAbsoluteExpiration,
                                    TimeSpan.FromDays(10));//Data will be cached for 10 day;
            }

            return data;
        }

        #region Private Methods
        private static string GetEnumDescription(Enum value, string lang)
        {
            if (lang == "Eng")
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

        private static QA_VM QA_List(QA_Filter_Parameters filter)
        {
            var qa_vm = new QA_VM();
            var qaRecords = new List<QARecord>();

            using (var context = new YogiApekshitContext())
            {
                if (filter.BookId > 0)
                {
                    var book = context.Books.Where(c => c.Id == filter.BookId).FirstOrDefault();
                    qa_vm.BookTitle = book != null
                                        ? filter.Lang == "Guj" ? book.Name_Guj : book.Name_Eng
                                        : string.Empty;
                }

                if (filter.ChapterNumber > 0)
                {
                    var chapter = context.BookChapters.Where(c => c.Id == filter.ChapterNumber).FirstOrDefault();
                    qa_vm.ChapterTitle = chapter != null
                                        ? filter.Lang == "Guj" ? chapter.Name_Guj : chapter.Name_Eng
                                        : string.Empty;
                }
            }

            var category = (Constants.Que_Categories)Enum.Parse(typeof(Constants.Que_Categories), filter.Category);
            switch (category)
            {
                case Constants.Que_Categories.One_Sentence:
                    qa_vm.Color = "#16a085";
                    qaRecords = QA_OneSentence(filter); break;
                case Constants.Que_Categories.Correct_Option:
                    qa_vm.Color = "#e05d6f";
                    qaRecords = QA_CorrectOption(filter); break;
                case Constants.Que_Categories.Correct_Sentence:
                    qa_vm.Color = "#418bca";
                    qaRecords = QA_CorrectSentence(filter); break;
                case Constants.Que_Categories.Correct_Sequence:
                    qa_vm.Color = "#56b1bf";
                    qaRecords = QA_CorrectSequence(filter); break;
                case Constants.Que_Categories.Fill_In_Blank:
                    qa_vm.Color = "#5cb85c";
                    qaRecords = QA_FillInBlank(filter); break;
                case Constants.Que_Categories.Kirtan:
                    qa_vm.Color = "#f0ad4e";
                    qaRecords = QA_Kirtan(filter); break;
                case Constants.Que_Categories.Reason:
                    qa_vm.Color = "#d9534f";
                    qaRecords = QA_Reason(filter); break;
                case Constants.Que_Categories.Short_Note:
                    qa_vm.Color = "#afae8b";
                    qaRecords = QA_ShortNote(filter); break;
                case Constants.Que_Categories.Swamini_Vaato:
                    qa_vm.Color = "#116f7d";
                    qaRecords = QA_SwaminiVat(filter); break;
                case Constants.Que_Categories.Who_Whom_When:
                    qa_vm.Color = "#d0aa90";
                    qaRecords = QA_WhoWhomWhen(filter); break;
                default:
                    qaRecords = new List<QARecord>(); break;
            }

            qa_vm.QARecords = qaRecords;
            return qa_vm;
        }

        private static List<QARecord> QA_CorrectSentence(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueCorrectSentences.Where(obj =>
                    (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Correct_Guj)
                                    : !string.IsNullOrEmpty(obj.Title_Eng)
                                    ) &&
                    obj.BookId == filter.BookId &&
                  (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                    .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                    .Select(c => new QARecord
                    {
                        Sr = seq++,
                        //Que = c.Title_Eng,
                        //Ans = c.Correct_Eng,
                        //Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                        Que = filter.Lang == "Guj" ? c.Title_Guj : c.Title_Eng,
                        Ans = filter.Lang == "Guj" ? c.Correct_Guj : c.Correct_Eng,
                        Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),

                        Exams = c.Exams,
                    }).ToList();
            }
        }

        private static List<QARecord> QA_CorrectSequence(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueCorrectSequences.Where(obj =>
                (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Correct_Guj)
                                    : !string.IsNullOrEmpty(obj.Title_Eng)
                                    ) &&
                obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QARecord
                {
                    Sr = seq++,
                    //Que = c.Title_Eng,
                    //Ans = c.Correct_Eng,
                    //Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Que = filter.Lang == "Guj" ? c.Title_Guj : c.Title_Eng,
                    Ans = filter.Lang == "Guj" ? c.Correct_Guj : c.Correct_Eng,
                    Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),

                    Exams = c.Exams,
                }).ToList();
            }
        }

        private static List<QARecord> QA_CorrectOption(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueCorrectOptions.Where(obj =>
                (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Correct_Guj)
                                    : !string.IsNullOrEmpty(obj.Title_Eng)
                                    ) &&
                obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QARecord
                {
                    Sr = seq++,
                    Que = filter.Lang == "Guj" ? c.Title_Guj : c.Title_Eng,
                    Ans = filter.Lang == "Guj" ? c.Correct_Guj : c.Correct_Eng,
                    Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),

                    Exams = c.Exams,
                }).ToList();
            }
        }

        private static List<QARecord> QA_FillInBlank(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueFillInBlanks.Where(obj =>
                (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Que_Guj)
                                    : !string.IsNullOrEmpty(obj.Que_Eng)
                                    ) &&
                obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QARecord
                {
                    Sr = seq++,
                    //Que = c.Que_Eng,
                    //Ans = c.Ans_Eng,
                    //Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Que = filter.Lang == "Guj" ? c.Que_Guj : c.Que_Eng,
                    Ans = filter.Lang == "Guj" ? c.Ans_Guj : c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),

                    Exams = c.Exams,
                }).ToList();
            }
        }

        private static List<QARecord> QA_Kirtan(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueKirtans.Where(obj =>
                (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Que_Guj)
                                    : !string.IsNullOrEmpty(obj.Que_Eng)
                                    ) &&
                obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QARecord
                {
                    Sr = seq++,
                    //Que = c.Que_Eng,
                    //Ans = c.Ans_Eng,
                    //Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Que = filter.Lang == "Guj" ? c.Que_Guj : c.Que_Eng,
                    Ans = filter.Lang == "Guj" ? c.Ans_Guj : c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),

                    Exams = c.Exams,
                }).ToList();
            }
        }

        private static List<QARecord> QA_OneSentence(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueOneSentences.Where(obj =>

                    (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Que_Guj)
                                    : !string.IsNullOrEmpty(obj.Que_Eng)
                                    ) &&
                    obj.BookId == filter.BookId &&
                   (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                    .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                    .Select(c => new QARecord
                    {
                        Sr = seq++,
                        Que = filter.Lang == "Guj" ? c.Que_Guj : c.Que_Eng,
                        Ans = filter.Lang == "Guj" ? c.Ans_Guj : c.Ans_Eng,
                        Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),
                        Exams = c.Exams,
                    }).ToList();
            }
        }

        private static List<QARecord> QA_Reason(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueReasons.Where(obj =>
                (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Que_Guj)
                                    : !string.IsNullOrEmpty(obj.Que_Eng)
                                    ) &&
                obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QARecord
                {
                    Sr = seq++,
                    Que = filter.Lang == "Guj" ? c.Que_Guj : c.Que_Eng,
                    Ans = filter.Lang == "Guj" ? c.Ans_Guj : c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                }).ToList();
            }
        }

        private static List<QARecord> QA_ShortNote(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueShortNotes.Where(obj =>
                (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Que_Guj)
                                    : !string.IsNullOrEmpty(obj.Que_Eng)
                                    ) &&
                obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QARecord
                {
                    Sr = seq++,
                    Que = filter.Lang == "Guj" ? c.Que_Guj : c.Que_Eng,
                    Ans = filter.Lang == "Guj" ? c.Ans_Guj : c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                }).ToList();
            }
        }

        private static List<QARecord> QA_SwaminiVat(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueSwaminiVats.Where(obj =>
                (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Que_Guj)
                                    : !string.IsNullOrEmpty(obj.Que_Eng)
                                    ) &&
                obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QARecord
                {
                    Sr = seq++,
                    Que = filter.Lang == "Guj" ? c.Que_Guj : c.Que_Eng,
                    Ans = filter.Lang == "Guj" ? c.Ans_Guj : c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                }).ToList();
            }
        }

        private static List<QARecord> QA_WhoWhomWhen(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                var data = context.QueWhoWhomWhens.Where(obj =>
                            (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Que_Guj)
                                    : !string.IsNullOrEmpty(obj.Que_Eng)
                                    ) &&
                            obj.BookId == filter.BookId &&
                            (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                            .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                            .Select(c => new QARecord
                            {
                                Sr = seq++,
                                Que = filter.Lang == "Guj" ? c.Que_Guj : c.Que_Eng,
                                Who = filter.Lang == "Guj"
                                        ? "કોણ: " + c.Who_Guj
                                        : "Who: " + c.Who_Eng,

                                Whom = filter.Lang == "Guj"
                                        ? "કોને: " + c.Whom_Guj
                                        : "Whom: " + c.Whom_Eng,
                                When = filter.Lang == "Guj"
                                        ? "ક્યારે: " + c.WhenSpeaking_Guj
                                        : "When: " + c.WhenSpeaking_Eng,

                                Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),
                                Exams = c.Exams,
                            }).ToList();

                data.ForEach(c =>
                {
                    c.Ans = c.Who + "<br/>" + c.Whom + "<br/>" + c.When + "<br/>";
                });

                return data;
            }
        }
        #endregion
    }
}