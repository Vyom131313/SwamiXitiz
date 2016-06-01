using System;
using System.Collections.Generic;

namespace SwamiXitiz.Data.Models
{
    public partial class QueWhoWhomWhen
    {
        public int Id { get; set; }
        public int BookId { get; set; }
        public int ChapterNumber { get; set; }
        public string Que_Eng { get; set; }
        public string Who { get; set; }
        public string Whom { get; set; }
        public string WhenSpeaking { get; set; }
        public string Exams { get; set; }
        public string Que_Guj { get; set; }
        public virtual Book Book { get; set; }
    }
}
