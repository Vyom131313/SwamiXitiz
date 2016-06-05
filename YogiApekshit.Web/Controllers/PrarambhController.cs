using Data.Core.IRepository;
using SwamiXitiz.Data.Models;
using SwamiXitiz.Data.ModelsPartial;
using System.Linq;
using System.Web.Mvc;
using YogiApekshit.Web.Models;

namespace YogiApekshit.Web.Controllers
{
    public class PrarambhController : BaseController
    {
        #region Constructors
        private readonly IRepository<QueWhoWhomWhen> repoQueWhoWhomWhen;
        private readonly IRepository<QueOneSentence> repoQueOneSentence;
        private readonly IRepository<QueCorrectSentence> repoQueCorrectSentence;
        private readonly IRepository<QueShortNote> repoQueShortNote;

        public PrarambhController(IRepository<QueWhoWhomWhen> repoQueWhoWhomWhen,
            IRepository<QueShortNote> repoQueShortNote,
            IRepository<QueOneSentence> repoQueOneSentence,
            IRepository<QueCorrectSentence> repoQueCorrectSentence)
        {
            this.repoQueWhoWhomWhen = repoQueWhoWhomWhen;
            this.repoQueOneSentence = repoQueOneSentence;
            this.repoQueCorrectSentence = repoQueCorrectSentence;
            this.repoQueShortNote = repoQueShortNote;
        }
        #endregion

        public ActionResult QuestionCategory(string category)
        {
            return View(category);
        }

        public JsonResult QA_List(string category)
        {
            switch (category)
            {
                case "WhoWhomWhen":
                    return QA_WhoWhomWhen_List();
                case "OneSentence":
                    return QA_OneSentence_List();
                case "CorrectSentence":
                    return QA_CorrectSentence_List();
                case "ShortNote":
                    return QA_ShortNote_List();
                default:
                    return null;
            }
        }

        public JsonResult QA_WhoWhomWhen_List()
        {
            var seq = 1;
            var data = repoQueWhoWhomWhen.GetAll().Where(obj => obj.BookId == Constants.Books.Ghanshaym_Charitra)
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Who = c.Who_Eng,
                    Whom = c.Whom_Eng,
                    When = c.WhenSpeaking_Eng,
                    Chapter = c.ChapterNumber,
                    Exams = c.Exams,
                });
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        public JsonResult QA_OneSentence_List()
        {
            var seq = 1;
            var data = repoQueOneSentence.GetAll().Where(obj => obj.BookId == Constants.Books.Ghanshaym_Charitra)
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Ans = c.Ans_Eng,
                    Chapter = c.ChapterNumber,
                    Exams = c.Exams,
                });
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        public JsonResult QA_CorrectSentence_List()
        {
            var seq = 1;
            var data = repoQueCorrectSentence.GetAll().Where(obj => obj.BookId == Constants.Books.Ghanshaym_Charitra)
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new
                {
                    Sr = seq++,
                    Title = c.Title_Eng,
                    Correct = c.Correct_Eng,
                    Chapter = c.ChapterNumber,
                    Exams = c.Exams,
                });
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        public JsonResult QA_ShortNote_List()
        {
            var seq = 1;
            var data = repoQueShortNote.GetAll().Where(obj => obj.BookId == Constants.Books.Ghanshaym_Charitra)
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new
                {
                    Sr = seq++,
                    Que = c.Que_Eng,
                    Ans = c.Ans_Eng,
                    Chapter = c.ChapterNumber,
                    Exams = c.Exams,
                });
            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}