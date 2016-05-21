using System;
using System.Collections.Generic;

namespace SwamiXitiz.Data.Models
{
    public partial class BookChapter
    {
        public BookChapter()
        {
            this.QueOneSentences = new List<QueOneSentence>();
        }

        public int Id { get; set; }
        public int BookId { get; set; }
        public int ChapterNumber { get; set; }
        public string Name_Eng { get; set; }
        public string Name_Guj { get; set; }
        public virtual Book Book { get; set; }
        public virtual ICollection<QueOneSentence> QueOneSentences { get; set; }
    }
}
