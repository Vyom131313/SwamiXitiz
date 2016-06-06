using System;
using System.Collections.Generic;

namespace SwamiXitiz.Data.Models
{
    public partial class Book
    {
        public Book()
        {
            this.BookChapters = new List<BookChapter>();
            this.QueCorrectOptions = new List<QueCorrectOption>();
            this.QueCorrectSentences = new List<QueCorrectSentence>();
            this.QueCorrectSequences = new List<QueCorrectSequence>();
            this.QueFillInBlanks = new List<QueFillInBlank>();
            this.QueKirtans = new List<QueKirtan>();
            this.QueOneSentences = new List<QueOneSentence>();
            this.QueReasons = new List<QueReason>();
            this.QueShloks = new List<QueShlok>();
            this.QueShortNotes = new List<QueShortNote>();
            this.QueSwaminiVats = new List<QueSwaminiVat>();
            this.QueWhoWhomWhens = new List<QueWhoWhomWhen>();
        }

        public int Id { get; set; }
        public string Name_Eng { get; set; }
        public string Name_Guj { get; set; }
        public string Code_Eng { get; set; }
        public string Code_Guj { get; set; }
        public virtual ICollection<BookChapter> BookChapters { get; set; }
        public virtual ICollection<QueCorrectOption> QueCorrectOptions { get; set; }
        public virtual ICollection<QueCorrectSentence> QueCorrectSentences { get; set; }
        public virtual ICollection<QueCorrectSequence> QueCorrectSequences { get; set; }
        public virtual ICollection<QueFillInBlank> QueFillInBlanks { get; set; }
        public virtual ICollection<QueKirtan> QueKirtans { get; set; }
        public virtual ICollection<QueOneSentence> QueOneSentences { get; set; }
        public virtual ICollection<QueReason> QueReasons { get; set; }
        public virtual ICollection<QueShlok> QueShloks { get; set; }
        public virtual ICollection<QueShortNote> QueShortNotes { get; set; }
        public virtual ICollection<QueSwaminiVat> QueSwaminiVats { get; set; }
        public virtual ICollection<QueWhoWhomWhen> QueWhoWhomWhens { get; set; }
    }
}
