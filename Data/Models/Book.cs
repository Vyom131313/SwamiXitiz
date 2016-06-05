using System;
using System.Collections.Generic;

namespace SwamiXitiz.Data.Models
{
    public partial class Book
    {
        public Book()
        {
            this.BookChapters = new List<BookChapter>();
            this.QueCorrectSentences = new List<QueCorrectSentence>();
            this.QueKirtans = new List<QueKirtan>();
            this.QueOneSentences = new List<QueOneSentence>();
            this.QueShloks = new List<QueShlok>();
            this.QueSwaminiVats = new List<QueSwaminiVat>();
            this.QueWhoWhomWhens = new List<QueWhoWhomWhen>();
        }

        public int Id { get; set; }
        public string Name_Eng { get; set; }
        public string Name_Guj { get; set; }
        public virtual ICollection<BookChapter> BookChapters { get; set; }
        public virtual ICollection<QueCorrectSentence> QueCorrectSentences { get; set; }
        public virtual ICollection<QueKirtan> QueKirtans { get; set; }
        public virtual ICollection<QueOneSentence> QueOneSentences { get; set; }
        public virtual ICollection<QueShlok> QueShloks { get; set; }
        public virtual ICollection<QueSwaminiVat> QueSwaminiVats { get; set; }
        public virtual ICollection<QueWhoWhomWhen> QueWhoWhomWhens { get; set; }
    }
}
