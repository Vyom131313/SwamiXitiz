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
        private readonly IRepository<QueOneSentence> repo;
        public PrarambhController(IRepository<QueOneSentence> repo)
        {
            this.repo = repo;
        }

        public ActionResult Que_2()
        {
            return View();
        }

        public JsonResult Que_2_List()
        {
            var seq = 1;
            var data = repo.GetAll().Where(obj => obj.BookId == Constants.Books.Ghanshaym_Charitra)
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