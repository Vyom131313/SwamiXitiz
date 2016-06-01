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
            this.QueOneSentences = new List<QueOneSentence>();
            this.QueWhoWhomWhens = new List<QueWhoWhomWhen>();
        }

        public int Id { get; set; }
        public string Name_Eng { get; set; }
        public string Name_Guj { get; set; }
        public virtual ICollection<BookChapter> BookChapters { get; set; }
        public virtual ICollection<QueCorrectSentence> QueCorrectSentences { get; set; }
        public virtual ICollection<QueOneSentence> QueOneSentences { get; set; }
        public virtual ICollection<QueWhoWhomWhen> QueWhoWhomWhens { get; set; }
    }
}
