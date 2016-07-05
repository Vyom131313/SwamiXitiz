using Data.Core.IRepository;
using Mvc.Core.ThirdParty;
using SwamiXitiz.Data.Models;
using SwamiXitiz.Data.ModelsPartial;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using YogiApekshit.Web.Models;

namespace YogiApekshit.Web.Controllers
{
    public class QAController : BaseController
    {
        #region Constructors
        private readonly IRepository<QueWhoWhomWhen> repoQueWhoWhomWhen;
        private readonly IRepository<QueOneSentence> repoQueOneSentence;
        private readonly IRepository<QueCorrectSentence> repoQueCorrectSentence;
        private readonly IRepository<QueCorrectSequence> repoQueCorrectSequence;
        private readonly IRepository<QueShortNote> repoQueShortNote;
        private readonly IRepository<QueReason> repoQueReason;
        private readonly IRepository<QueFillInBlank> repoQueFillInBlank;
        private readonly IRepository<QueCorrectOption> repoQueCorrectOption;
        private readonly IRepository<QueSwaminiVat> repoQueSwaminiVat;
        private readonly IRepository<QueKirtan> repoQueKirtan;
        private readonly IRepository<QueShlok> repoQueShlok;

        public QAController(IRepository<QueWhoWhomWhen> repoQueWhoWhomWhen,
            IRepository<QueShortNote> repoQueShortNote,
            IRepository<QueCorrectSequence> repoQueCorrectSequence,
            IRepository<QueCorrectOption> repoQueCorrectOption,
            IRepository<QueOneSentence> repoQueOneSentence,
            IRepository<QueReason> repoReason,
            IRepository<QueSwaminiVat> repoQueSwaminiVat,
            IRepository<QueReason> repoQueReason,
            IRepository<QueKirtan> repoQueKirtan,
            IRepository<QueShlok> repoQueShlok,
            IRepository<QueFillInBlank> repoQueFillInBlank,
            IRepository<QueCorrectSentence> repoQueCorrectSentence,
            IRepository<BookChapter> bookChapterRepo,
            IRepository<Book> bookRepo)
            : base(bookChapterRepo, bookRepo)
        {
            this.repoQueCorrectOption = repoQueCorrectOption;
            this.repoQueCorrectSentence = repoQueCorrectSentence;
            this.repoQueCorrectSequence = repoQueCorrectSequence;
            this.repoQueFillInBlank = repoQueFillInBlank;
            this.repoQueKirtan = repoQueKirtan;
            this.repoQueOneSentence = repoQueOneSentence;
            this.repoQueReason = repoQueReason;
            this.repoQueShlok = repoQueShlok;
            this.repoQueShortNote = repoQueShortNote;
            this.repoQueWhoWhomWhen = repoQueWhoWhomWhen;
            this.repoQueSwaminiVat = repoQueSwaminiVat;
        }
        #endregion

        #region Public
        public ActionResult QA_By_Book_Chapter(int bookId, int chapterNumber = 0)
        {
            return View(new QA_Filter_Parameters { BookId = bookId, ChapterNumber = chapterNumber });
        }

        //public JsonResult GridRecords()
        public JsonResult GridRecords(GridParams g, int bookId, string category, int chapterNumber = 0)
        {
            // return QA_List(new QA_Filter_Parameters { BookId = bookId, Category = category, ChapterNumber = chapterNumber });

            var data = new List<QA_VM> { new QA_VM { Sr = 1, Que = "Que-1", Ans = "Ans-1", Exams = "Exams-1", Chapter = 0 } };

            var model = new GridModelBuilder<QA_VM>(data.AsQueryable(), g)
            {
                Key = "Id",
                Map = MapEntityToGridModel,
            }.Build();

            return Json(model);
        }

        protected object MapEntityToGridModel(QA_VM o)
        {
            return new
            {
                o.Sr,
                o.Que,
                o.Ans,
                o.Chapter,
                o.Exams
            };
        }

        public ActionResult QuestionCategory(string category)
        {
            return View(category);
        }

        public JsonResult QA_List(QA_Filter_Parameters filter)
        {
            switch (filter.Category)
            {
                case "OneSentence":
                    return QA_OneSentence_List(filter);
                case "CorrectOption":
                    return QA_CorrectOption_List(filter);
                case "CorrectSentence":
                    return QA_CorrectSentence_List(filter);
                case "CorrectSequence":
                    return QA_CorrectSequence_List(filter);
                case "FillInBlank":
                    return QA_FillInBlank_List(filter);
                case "Kirtan":
                    return QA_Kirtan_List(filter);
                case "Reason":
                    return QA_Reason_List(filter);
                case "Shlok":
                    return QA_Shlok_List(filter);
                case "ShortNote":
                    return QA_ShortNote_List(filter);
                case "SwaminiVat":
                    return QA_SwaminiVat_List(filter);
                case "WhoWhomWhen":
                    return QA_WhoWhomWhen_List(filter);
                default:
                    return null;
            }
        }
        #endregion

        #region Private Methods
        private JsonResult QA_CorrectSentence_List(QA_Filter_Parameters filter)
        {
            var seq = 1;
            var data = repoQueCorrectSentence.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new
                {
                    Sr = seq++,
                    Title = c.Title_Eng,
                    Correct = c.Correct_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                });
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        private JsonResult QA_CorrectSequence_List(QA_Filter_Parameters filter)
        {
            var seq = 1;
            var data = repoQueCorrectSequence.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new
                {
                    Sr = seq++,
                    Title = c.Title_Eng,
                    Correct = c.Correct_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                });
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        private JsonResult QA_CorrectOption_List(QA_Filter_Parameters filter)
        {
            var seq = 1;
            var data = repoQueCorrectOption.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new
                {
                    Sr = seq++,
                    Title = c.Title_Eng,
                    Correct = c.Correct_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                });
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        private JsonResult QA_FillInBlank_List(QA_Filter_Parameters filter)
        {
            var seq = 1;
            var data = repoQueFillInBlank.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Ans = c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                });
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        private JsonResult QA_Kirtan_List(QA_Filter_Parameters filter)
        {
            var seq = 1;
            var data = repoQueKirtan.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Ans = c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                });
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        private JsonResult QA_OneSentence_List(QA_Filter_Parameters filter)
        {
            var seq = 1;
            var data = repoQueOneSentence.GetAll().Where(obj => obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Ans = c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                });
            return Json(data.ToList(), JsonRequestBehavior.AllowGet);
        }

        private JsonResult QA_Reason_List(QA_Filter_Parameters filter)
        {
            var seq = 1;
            var data = repoQueReason.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Ans = c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                });
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        private JsonResult QA_Shlok_List(QA_Filter_Parameters filter)
        {
            var seq = 1;
            var data = repoQueShlok.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Ans = c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                });
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        private JsonResult QA_ShortNote_List(QA_Filter_Parameters filter)
        {
            var seq = 1;
            var data = repoQueShortNote.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Ans = c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                });
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        private JsonResult QA_SwaminiVat_List(QA_Filter_Parameters filter)
        {
            var seq = 1;
            var data = repoQueSwaminiVat.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Ans = c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                });
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        private JsonResult QA_WhoWhomWhen_List(QA_Filter_Parameters filter)
        {
            var seq = 1;
            var data = repoQueWhoWhomWhen.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Who = c.Who_Eng,
                    Whom = c.Whom_Eng,
                    When = c.WhenSpeaking_Eng,
                    Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                });
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        #endregion
    }
}