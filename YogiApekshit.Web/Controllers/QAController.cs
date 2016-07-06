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
        public ActionResult QA_By_Book_Category_Chapter(int bookId, int chapterNumber = 0)
        {
            return View(new QA_Filter_Parameters { BookId = bookId, ChapterNumber = chapterNumber });
        }

        public JsonResult GridRecords(GridParams g, int bookId, string category, int chapterNumber = 0)
        {
            var data = QA_List(new QA_Filter_Parameters { BookId = bookId, Category = category, ChapterNumber = chapterNumber });

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

        public List<QA_VM> QA_List(QA_Filter_Parameters filter)
        {
            switch (filter.Category)
            {
                case "OneSentence":
                    return QA_OneSentence(filter);
                case "CorrectOption":
                    return QA_CorrectOption(filter);
                case "CorrectSentence":
                    return QA_CorrectSentence(filter);
                case "CorrectSequence":
                    return QA_CorrectSequence(filter);
                case "FillInBlank":
                    return QA_FillInBlank(filter);
                case "Kirtan":
                    return QA_Kirtan(filter);
                case "Reason":
                    return QA_Reason(filter);
                case "Shlok":
                    return QA_Shlok(filter);
                case "ShortNote":
                    return QA_ShortNote(filter);
                case "SwaminiVat":
                    return QA_SwaminiVat(filter);
                case "WhoWhomWhen":
                //return QA_WhoWhomWhen(filter);
                default:
                    return null;
            }
        }

        public JsonResult QA_List_Json(QA_Filter_Parameters filter)
        {
            switch (filter.Category)
            {
                case "OneSentence":
                    return Json(QA_OneSentence(filter), JsonRequestBehavior.AllowGet);
                case "CorrectOption":
                    return Json(QA_CorrectOption(filter), JsonRequestBehavior.AllowGet);
                case "CorrectSentence":
                    return Json(QA_CorrectSentence(filter), JsonRequestBehavior.AllowGet);
                case "CorrectSequence":
                    return Json(QA_CorrectSequence(filter), JsonRequestBehavior.AllowGet);
                case "FillInBlank":
                    return Json(QA_FillInBlank(filter), JsonRequestBehavior.AllowGet);
                case "Kirtan":
                    return Json(QA_Kirtan(filter), JsonRequestBehavior.AllowGet);
                case "Reason":
                    return Json(QA_Reason(filter), JsonRequestBehavior.AllowGet);
                case "Shlok":
                    return Json(QA_Shlok(filter), JsonRequestBehavior.AllowGet);
                case "ShortNote":
                    return Json(QA_ShortNote(filter), JsonRequestBehavior.AllowGet);
                case "SwaminiVat":
                    return Json(QA_SwaminiVat(filter), JsonRequestBehavior.AllowGet);
                case "WhoWhomWhen":
                    return Json(QA_WhoWhomWhen(filter), JsonRequestBehavior.AllowGet);
                default:
                    return null;
            }
        }
        #endregion

        #region Private Methods
        private List<QA_VM> QA_CorrectSentence(QA_Filter_Parameters filter)
        {
            var seq = 1;
            return repoQueCorrectSentence.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
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

        private List<QA_VM> QA_CorrectSequence(QA_Filter_Parameters filter)
        {
            var seq = 1;
            return repoQueCorrectSequence.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
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

        private List<QA_VM> QA_CorrectOption(QA_Filter_Parameters filter)
        {
            var seq = 1;
            return repoQueCorrectOption.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
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

        private List<QA_VM> QA_FillInBlank(QA_Filter_Parameters filter)
        {
            var seq = 1;
            return repoQueFillInBlank.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
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

        private List<QA_VM> QA_Kirtan(QA_Filter_Parameters filter)
        {
            var seq = 1;
            return repoQueKirtan.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
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

        private List<QA_VM> QA_OneSentence(QA_Filter_Parameters filter)
        {
            var seq = 1;
            return repoQueOneSentence.GetAll().Where(obj => obj.BookId == filter.BookId &&
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

        private List<QA_VM> QA_Reason(QA_Filter_Parameters filter)
        {
            var seq = 1;
            return repoQueReason.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
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

        private List<QA_VM> QA_Shlok(QA_Filter_Parameters filter)
        {
            var seq = 1;
            return repoQueShlok.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
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

        private List<QA_VM> QA_ShortNote(QA_Filter_Parameters filter)
        {
            var seq = 1;
            return repoQueShortNote.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
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

        private List<QA_VM> QA_SwaminiVat(QA_Filter_Parameters filter)
        {
            var seq = 1;
            return repoQueSwaminiVat.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
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

        private List<QA_WWW_VM> QA_WhoWhomWhen(QA_Filter_Parameters filter)
        {
            var seq = 1;
            return repoQueWhoWhomWhen.GetAll().Where(obj => Constants.Books.Prarambha_AllBooks.Contains(obj.BookId))
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
        #endregion
    }
}