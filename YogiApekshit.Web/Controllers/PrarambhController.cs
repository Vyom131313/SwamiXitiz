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

        public PrarambhController(IRepository<QueWhoWhomWhen> repoQueWhoWhomWhen,
            IRepository<QueOneSentence> repoQueOneSentence)
        {
            this.repoQueWhoWhomWhen = repoQueWhoWhomWhen;
            this.repoQueOneSentence = repoQueOneSentence;
        }
        #endregion

        public ActionResult Que_1()
        {
            return View();
        }

        public ActionResult Que_2()
        {
            return View();
        }

        public JsonResult Que_1_List()
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

        public JsonResult Que_2_List()
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
    }
}