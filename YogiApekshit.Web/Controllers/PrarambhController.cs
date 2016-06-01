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
                Id = c.Id,
                Que_Eng = c.Que_Eng,
                Que_Guj = c.Que_Guj,
                Ans_Eng = c.Ans_Eng,
                Exams = c.Exams,
                Chapter = c.ChapterNumber
            });
            return Json(data, JsonRequestBehavior.AllowGet);
        }

    }
}