using Data.Core.IRepository;
using Mvc.Core.ThirdParty;
using SwamiXitiz.Data.Models;
using System;
using System.Linq;
using System.Web.Mvc;

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

        public JsonResult GridGetItems()
        {
            var data = repo.GetAll().ToList().Select(c => new 
            {
                Sr = c.Id,
                Que = c.Que_Eng,
                Ans = c.Ans_Eng,
                Chapter = c.ChapterNumber,
                Exams = c.Exams,
            });
            return Json(data, JsonRequestBehavior.AllowGet);
        }

    }
}