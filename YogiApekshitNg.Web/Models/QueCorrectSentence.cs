using System;
using System.Collections.Generic;

namespace SwamiXitiz.Data.Models
{
    public partial class QueCorrectSentence
    {
        public int Id { get; set; }
        public int BookId { get; set; }
        public int ChapterNumber { get; set; }
        public string Title_Eng { get; set; }
        public string Correct_Eng { get; set; }
        public string Title_Guj { get; set; }
        public string Correct_Guj { get; set; }
        public string Exams { get; set; }
        public virtual Book Book { get; set; }
    }
}
