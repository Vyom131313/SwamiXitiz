using Data.Core.IRepository;
using Mvc.Core.ThirdParty;
using SwamiXitiz.Data.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace YogiApekshit.Controllers
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

        public ActionResult GridGetItems(GridParams g, string parent, bool? restore)
        {
            var data = repo.GetAll();
            var model = new GridModelBuilder<QueOneSentence>(data.AsQueryable(), g)
            {
                Key = "Id",
                Map = MapEntityToGridModel,
                GetItem = () => repo.Get(Convert.ToInt32(g.Key))
            }.Build();

            return Json(model);
        }

        protected object MapEntityToGridModel(QueOneSentence o)
        {
            return new
            {
                o.Id,
                o.Que_Eng,
                o.Ans_Eng,
                ChapterNumber = o.BookChapter.ChapterNumber,
                o.Exams
            };
        }
    }
}