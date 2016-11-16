using SwamiXitiz.Data.Models;
using SwamiXitiz.Data.ModelsPartial;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace WebApiService.Controllers
{
    public class QAController : ApiController
    {
        public QAController()
        {

        }

        public IEnumerable<QA_WWW_VM> GetWWW(int bookId, int chapterNumber = 0)
        {
            return QA_WhoWhomWhen(new QA_Filter_Parameters { BookId = bookId, Category = "Who_Whom_When", ChapterNumber = chapterNumber });
        }

        public IEnumerable<QA_VM> QA_List(QA_Filter_Parameters filter)
        {
            Constants.Que_Categories category = (Constants.Que_Categories)Enum.Parse(typeof(Constants.Que_Categories), filter.Category);

            switch (category)
            {
                case Constants.Que_Categories.One_Sentence:
                    return QA_OneSentence(filter);
                case Constants.Que_Categories.Correct_Option:
                    return QA_CorrectOption(filter);
                case Constants.Que_Categories.Correct_Sentence:
                    return QA_CorrectSentence(filter);
                case Constants.Que_Categories.Correct_Sequence:
                    return QA_CorrectSequence(filter);
                case Constants.Que_Categories.Fill_In_Blank:
                    return QA_FillInBlank(filter);
                case Constants.Que_Categories.Kirtan:
                    return QA_Kirtan(filter);
                case Constants.Que_Categories.Reason:
                    return QA_Reason(filter);
                case Constants.Que_Categories.Shlok:
                    return QA_Shlok(filter);
                case Constants.Que_Categories.Short_Note:
                    return QA_ShortNote(filter);
                case Constants.Que_Categories.Swamini_Vaato:
                    return QA_SwaminiVat(filter);
                default:
                    return null;
            }
        }

        // GET= api/QA
        public IEnumerable<user> Get()
        {
            return new List<user>
            {
                new user
                {
                    id = 10,
                    firstName = "Paresh",
                    lastName = "Sutariya",
                      username= "paresh.sutariya",
                      email= "paresh.sutariya@synechron.com",
                      age= "34"
                },

            new user
            {
                id= 1,
                firstName= "Mark",
                lastName= "Otto",
                username= "@mdo",
                email= "mdo@gmail.com",
                age= "28"
            },
          new user
          {
                    id= 2,
              firstName= "Jacob",
              lastName= "Thornton",
              username= "@fat",
              email= "fat@yandex.ru",
              age= "45"
          },
         new user
         {
                    id= 3,
              firstName= "Larry",
              lastName= "Bird",
              username= "@twitter",
              email= "twitter@outlook.com",
              age= "18"
          },
         new user
         {
                    id= 4,
              firstName= "John",
              lastName= "Snow",
              username= "@snow",
              email= "snow@gmail.com",
              age= "20"
          },
         new user
         {
                    id= 5,
              firstName= "Jack",
              lastName= "Sparrow",
              username= "@jack",
              email= "jack@yandex.ru",
              age= "30"
          },
      };
            //return new string[] { "value1", "value2" };
        }

        #region Private Methods
        private List<QA_VM> QA_CorrectSentence(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueCorrectSentences.Where(obj => obj.BookId == filter.BookId &&
                  (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                    .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                    .Select(c => new QA_VM
                    {
                        Sr = seq++,
                        Que = c.Title_Eng,
                        Ans = c.Correct_Eng,
                        Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                        Exams = c.Exams,
                    }).ToList();
            }
        }

        private List<QA_VM> QA_CorrectSequence(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueCorrectSequences.Where(obj => obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QA_VM
                {
                    Sr = seq++,
                    Que = c.Title_Eng,
                    Ans = c.Correct_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                }).ToList();
            }
        }

        private List<QA_VM> QA_CorrectOption(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueCorrectOptions.Where(obj => obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QA_VM
                {
                    Sr = seq++,
                    Que = c.Title_Eng,
                    Ans = c.Correct_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                }).ToList();
            }
        }

        private List<QA_VM> QA_FillInBlank(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueFillInBlanks.Where(obj => obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QA_VM
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Ans = c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                }).ToList();
            }
        }

        private List<QA_VM> QA_Kirtan(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueKirtans.Where(obj => obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QA_VM
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Ans = c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                }).ToList();
            }
        }

        private List<QA_VM> QA_OneSentence(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueOneSentences.Where(obj => obj.BookId == filter.BookId &&
                   (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                    .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                    .Select(c => new QA_VM
                    {
                        Sr = seq++,
                        Que = c.Que_Eng,
                        Ans = c.Ans_Eng,
                        Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                        Exams = c.Exams,
                    }).ToList();
            }
        }

        private List<QA_VM> QA_Reason(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueReasons.Where(obj => obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QA_VM
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Ans = c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                }).ToList();
            }
        }

        private List<QA_VM> QA_Shlok(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueShloks.Where(obj => obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QA_VM
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Ans = c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                }).ToList();
            }
        }

        private List<QA_VM> QA_ShortNote(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueShortNotes.Where(obj => obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QA_VM
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Ans = c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                }).ToList();
            }
        }

        private List<QA_VM> QA_SwaminiVat(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueSwaminiVats.Where(obj => obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QA_VM
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Ans = c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                }).ToList();
            }
        }

        private List<QA_WWW_VM> QA_WhoWhomWhen(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueWhoWhomWhens.Where(obj => obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QA_WWW_VM
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Who = c.Who_Eng,
                    Whom = c.Whom_Eng,
                    When = c.WhenSpeaking_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                }).ToList();
            }
        }
        #endregion
    }

    public class user
    {
        public int id { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string username { get; set; }
        public string email { get; set; }
        public string age { get; set; }
    }

    public class QA_Filter_Parameters
    {
        public int BookId { get; set; }
        public int ChapterNumber { get; set; }
        public string Category { get; set; }
    }

    public class QA_VM
    {
        public int Id { get; set; }
        public int Sr { get; set; }
        public string Que { get; set; }
        public string Ans { get; set; }
        public string Chapter { get; set; }
        public string Exams { get; set; }
    }

    public class QA_WWW_VM
    {
        public int Id { get; set; }
        public int Sr { get; set; }
        public string Que { get; set; }
        public string Who { get; set; }
        public string Whom { get; set; }
        public string When { get; set; }
        public string Chapter { get; set; }
        public string Exams { get; set; }
    }
}