﻿using SwamiXitiz.Data.Models;
using SwamiXitiz.Data.ModelsPartial;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApiService.Controllers
{
    public class QAController : ApiController
    {
        public QAController()
        {

        }

        [Route("api/QA/GetQA")]
        public HttpResponseMessage GetQA(string lang, string category, int bookId, int chapterNumber = 0)
        {
            //if(category == Constants.Que_Categories.Who_Whom_When.ToString())
            //{
            //    var data = QA_WhoWhomWhen(new QA_Filter_Parameters { Lang= lang, BookId = bookId, Category = category, ChapterNumber = chapterNumber });
            //    return Request.CreateResponse(HttpStatusCode.OK, data);
            //}
            //else
            {
                var data = QA_List(new QA_Filter_Parameters { Lang = lang, BookId = bookId, Category = category, ChapterNumber = chapterNumber });
                return Request.CreateResponse(HttpStatusCode.OK, data);
            }
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
                //case Constants.Que_Categories.All:
                //    var data = new List<QA_VM>();
                //    foreach(var cat in Enum.GetValues(typeof(Constants.Que_Categories)))
                //    {
                //        if (cat.ToString() == "All")
                //            continue;
                //        filter.Category = cat.ToString();
                //        data.AddRange(QA_List(filter));
                //    }

                //    return data;
                default:
                    return new List<QA_VM>();
            }
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
                        Que = filter.Lang == "Guj" ? c.Que_Guj : c.Que_Eng,
                        Ans = filter.Lang == "Guj" ? c.Ans_Guj : c.Ans_Eng,
                        Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),
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
                var data = context.QueWhoWhomWhens.Where(obj => obj.BookId == filter.BookId &&
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

                return data;
            }
        }
        #endregion
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