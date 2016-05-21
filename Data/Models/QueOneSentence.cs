using System;
using System.Collections.Generic;

namespace SwamiXitiz.Data.Models
{
    public partial class QueOneSentence
    {
        public int Id { get; set; }
        public Nullable<int> ChapterId { get; set; }
        public string Que_Eng { get; set; }
        public string Ans_Eng { get; set; }
        public string Que_Guj { get; set; }
        public string Ans_Guj { get; set; }
        public string Exams { get; set; }
        public virtual BookChapter BookChapter { get; set; }
    }
}
