using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Runtime.Caching;
using System.Web.Http;

namespace YogiApekshitNg.Web.Controllers
{
    public class QAController : ApiController
    {
        MemoryCache MemCache = MemoryCache.Default;

        [Route("api/QA/GetQA")]
        public HttpResponseMessage GetQA(string lang, string category, int bookId, int chapterNumber = 0)
        {
            var data = DS.GetQA(lang, category, bookId, chapterNumber);
            return Request.CreateResponse(HttpStatusCode.OK, data);
        }

        [HttpGet]
        [Route("api/QA/ClearCache")]
        public HttpResponseMessage ClearCache()
        {
            DS.ClearCache();
            return Request.CreateResponse(HttpStatusCode.OK, true);
        }

    }

    public class QA_Filter_Parameters
    {
        public string Lang { get; set; }
        public int BookId { get; set; }
        public int ChapterNumber { get; set; }
        public string Category { get; set; }
    }

    public class QA_VM
    {
        public QA_VM()
        {
            QARecords = new List<QARecord>();
        }

        public string BookTitle { get; set; }
        public string ChapterTitle { get; set; }
        public string Color { get; set; }

        public IList<QARecord> QARecords { get; set; }
    }

    public class QARecord
    {
        public int Id { get; set; }
        public int Sr { get; set; }
        public string Que { get; set; }
        public string Ans { get; set; }
        public string Chapter { get; set; }
        public string Exams { get; set; }

        //Properties for WWW
        public string Who { get; set; }
        public string Whom { get; set; }
        public string When { get; set; }
    }
}