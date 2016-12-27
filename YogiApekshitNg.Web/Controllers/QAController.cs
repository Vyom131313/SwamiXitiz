﻿using SwamiXitiz.Data.Models;
using SwamiXitiz.Data.ModelsPartial;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace YogiApekshitNg.Web.Controllers
{
    public class QAController : ApiController
    {
        public QAController()
        {

        }

        [Route("api/QA/GetQA")]
        public HttpResponseMessage GetQA(string lang, string category, int bookId, int chapterNumber = 0)
        {
            var data = QA_List(new QA_Filter_Parameters { Lang = lang, BookId = bookId, Category = category, ChapterNumber = chapterNumber });
            return Request.CreateResponse(HttpStatusCode.OK, data);
        }

        public QA_VM QA_List(QA_Filter_Parameters filter)
        {
            var qa_vm = new QA_VM();
            var qaRecords = new List<QARecord>();

            using (var context = new YogiApekshitContext())
            {
                if (filter.BookId > 0)
                {
                    var book = context.Books.Where(c => c.Id == filter.BookId).FirstOrDefault();
                    qa_vm.BookTitle = book != null
                                        ? filter.Lang == "Guj" ? book.Name_Guj : book.Name_Eng
                                        : string.Empty;
                }

                if (filter.ChapterNumber > 0)
                {
                    var chapter = context.BookChapters.Where(c => c.Id == filter.ChapterNumber).FirstOrDefault();
                    qa_vm.ChapterTitle = chapter != null
                                        ? filter.Lang == "Guj" ? chapter.Name_Guj : chapter.Name_Eng
                                        : string.Empty;
                }
            }

            var category = (Constants.Que_Categories)Enum.Parse(typeof(Constants.Que_Categories), filter.Category);
            switch (category)
            {
                case Constants.Que_Categories.One_Sentence:
                    qa_vm.Color = "#16a085";
                    qaRecords = QA_OneSentence(filter); break;
                case Constants.Que_Categories.Correct_Option:
                    qa_vm.Color = "#e05d6f";
                    qaRecords = QA_CorrectOption(filter); break;
                case Constants.Que_Categories.Correct_Sentence:
                    qa_vm.Color = "#418bca";
                    qaRecords = QA_CorrectSentence(filter); break;
                case Constants.Que_Categories.Correct_Sequence:
                    qa_vm.Color = "#56b1bf";
                    qaRecords = QA_CorrectSequence(filter); break;
                case Constants.Que_Categories.Fill_In_Blank:
                    qa_vm.Color = "#5cb85c";
                    qaRecords = QA_FillInBlank(filter); break;
                case Constants.Que_Categories.Kirtan:
                    qa_vm.Color = "#f0ad4e";
                    qaRecords = QA_Kirtan(filter); break;
                case Constants.Que_Categories.Reason:
                    qa_vm.Color = "#d9534f";
                    qaRecords = QA_Reason(filter); break;
                case Constants.Que_Categories.Short_Note:
                    qa_vm.Color = "#afae8b";
                    qaRecords = QA_ShortNote(filter); break;
                case Constants.Que_Categories.Swamini_Vaato:
                    qa_vm.Color = "#116f7d";
                    qaRecords = QA_SwaminiVat(filter); break;
                case Constants.Que_Categories.Who_Whom_When:
                    qa_vm.Color = "#d0aa90";
                    qaRecords = QA_WhoWhomWhen(filter); break;                
                default:
                    qaRecords = new List<QARecord>(); break;
            }

            qa_vm.QARecords = qaRecords;
            return qa_vm;
        }

        #region Private Methods
        private List<QARecord> QA_CorrectSentence(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueCorrectSentences.Where(obj =>
                    (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Title_Guj)
                                    : !string.IsNullOrEmpty(obj.Title_Eng)
                                    ) &&
                    obj.BookId == filter.BookId &&
                  (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                    .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                    .Select(c => new QARecord
                    {
                        Sr = seq++,
                        //Que = c.Title_Eng,
                        //Ans = c.Correct_Eng,
                        //Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                        Que = filter.Lang == "Guj" ? c.Title_Guj : c.Title_Eng,
                        Ans = filter.Lang == "Guj" ? c.Correct_Guj : c.Correct_Eng,
                        Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),

                        Exams = c.Exams,
                    }).ToList();
            }
        }

        private List<QARecord> QA_CorrectSequence(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueCorrectSequences.Where(obj =>
                (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Title_Guj)
                                    : !string.IsNullOrEmpty(obj.Title_Eng)
                                    ) &&
                obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QARecord
                {
                    Sr = seq++,
                    //Que = c.Title_Eng,
                    //Ans = c.Correct_Eng,
                    //Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Que = filter.Lang == "Guj" ? c.Title_Guj : c.Title_Eng,
                    Ans = filter.Lang == "Guj" ? c.Correct_Guj : c.Correct_Eng,
                    Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),

                    Exams = c.Exams,
                }).ToList();
            }
        }

        private List<QARecord> QA_CorrectOption(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueCorrectOptions.Where(obj =>
                (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Title_Guj)
                                    : !string.IsNullOrEmpty(obj.Title_Eng)
                                    ) && 
                obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QARecord
                {
                    Sr = seq++,
                    Que = filter.Lang == "Guj" ? c.Title_Guj : c.Title_Eng,
                    Ans = filter.Lang == "Guj" ? c.Correct_Guj : c.Correct_Eng,
                    Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),

                    Exams = c.Exams,
                }).ToList();
            }
        }

        private List<QARecord> QA_FillInBlank(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueFillInBlanks.Where(obj =>
                (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Que_Guj)
                                    : !string.IsNullOrEmpty(obj.Que_Eng)
                                    ) &&
                obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QARecord
                {
                    Sr = seq++,
                    //Que = c.Que_Eng,
                    //Ans = c.Ans_Eng,
                    //Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Que = filter.Lang == "Guj" ? c.Que_Guj : c.Que_Eng,
                    Ans = filter.Lang == "Guj" ? c.Ans_Guj : c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),

                    Exams = c.Exams,
                }).ToList();
            }
        }

        private List<QARecord> QA_Kirtan(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueKirtans.Where(obj =>
                (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Que_Guj)
                                    : !string.IsNullOrEmpty(obj.Que_Eng)
                                    ) && 
                obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QARecord
                {
                    Sr = seq++,
                    //Que = c.Que_Eng,
                    //Ans = c.Ans_Eng,
                    //Chapter = string.Format("{0}/{1}", c.Book.Code_Eng, c.ChapterNumber),
                    Que = filter.Lang == "Guj" ? c.Que_Guj : c.Que_Eng,
                    Ans = filter.Lang == "Guj" ? c.Ans_Guj : c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),

                    Exams = c.Exams,
                }).ToList();
            }
        }

        private List<QARecord> QA_OneSentence(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueOneSentences.Where(obj =>

                    (filter.Lang == "Guj" 
                                    ? !string.IsNullOrEmpty(obj.Que_Guj)
                                    : !string.IsNullOrEmpty(obj.Que_Eng) 
                                    ) &&
                    obj.BookId == filter.BookId &&
                   (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                    .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                    .Select(c => new QARecord
                    {
                        Sr = seq++,
                        Que = filter.Lang == "Guj" ? c.Que_Guj : c.Que_Eng,
                        Ans = filter.Lang == "Guj" ? c.Ans_Guj : c.Ans_Eng,
                        Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),
                        Exams = c.Exams,
                    }).ToList();
            }
        }

        private List<QARecord> QA_Reason(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueReasons.Where(obj =>
                (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Que_Guj)
                                    : !string.IsNullOrEmpty(obj.Que_Eng)
                                    ) && 
                obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QARecord
                {
                    Sr = seq++,
                    Que = filter.Lang == "Guj" ? c.Que_Guj : c.Que_Eng,
                    Ans = filter.Lang == "Guj" ? c.Ans_Guj : c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                }).ToList();
            }
        }
             
        private List<QARecord> QA_ShortNote(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueShortNotes.Where(obj =>
                (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Que_Guj)
                                    : !string.IsNullOrEmpty(obj.Que_Eng)
                                    ) && 
                obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QARecord
                {
                    Sr = seq++,
                    Que = filter.Lang == "Guj" ? c.Que_Guj : c.Que_Eng,
                    Ans = filter.Lang == "Guj" ? c.Ans_Guj : c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                }).ToList();
            }
        }

        private List<QARecord> QA_SwaminiVat(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                return context.QueSwaminiVats.Where(obj =>
                (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Que_Guj)
                                    : !string.IsNullOrEmpty(obj.Que_Eng)
                                    ) && 
                obj.BookId == filter.BookId &&
               (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                .Select(c => new QARecord
                {
                    Sr = seq++,
                    Que = filter.Lang == "Guj" ? c.Que_Guj : c.Que_Eng,
                    Ans = filter.Lang == "Guj" ? c.Ans_Guj : c.Ans_Eng,
                    Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),
                    Exams = c.Exams,
                }).ToList();
            }
        }

        private List<QARecord> QA_WhoWhomWhen(QA_Filter_Parameters filter)
        {
            var seq = 1;
            using (var context = new YogiApekshitContext())
            {
                var data = context.QueWhoWhomWhens.Where(obj =>
                            (filter.Lang == "Guj"
                                    ? !string.IsNullOrEmpty(obj.Que_Guj)
                                    : !string.IsNullOrEmpty(obj.Que_Eng)
                                    ) && 
                            obj.BookId == filter.BookId &&
                            (filter.ChapterNumber == 0 || obj.ChapterNumber == filter.ChapterNumber))
                            .OrderBy(obj => obj.BookId).ThenBy(obj => obj.ChapterNumber).ToList()
                            .Select(c => new QARecord
                            {
                                Sr = seq++,
                                Que = filter.Lang == "Guj" ? c.Que_Guj : c.Que_Eng,
                                Who = filter.Lang == "Guj"
                                        ? "કોણ: " + c.Who_Guj
                                        : "Who: " + c.Who_Eng,

                                Whom = filter.Lang == "Guj"
                                        ? "કોને: " + c.Whom_Guj
                                        : "Whom: " + c.Whom_Eng,
                                When = filter.Lang == "Guj"
                                        ? "ક્યારે: " + c.WhenSpeaking_Guj
                                        : "When: " + c.WhenSpeaking_Eng,

                                Chapter = string.Format("{0}/{1}", filter.Lang == "Guj" ? c.Book.Code_Guj : c.Book.Code_Eng, c.ChapterNumber),
                                Exams = c.Exams,
                            }).ToList();

                data.ForEach(c =>
                {
                    c.Ans = c.Who + "<br/>" + c.Whom + "<br/>" + c.When + "<br/>";
                });

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