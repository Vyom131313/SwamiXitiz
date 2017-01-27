using System;
using System.Collections.Generic;

namespace SwamiXitiz.Data.Models
{
    public partial class QueWhoWhomWhen
    {
        public int Id { get; set; }
        public int BookId { get; set; }
        public int ChapterNumber { get; set; }
        public string Que_Guj { get; set; }
        public string Who_Guj { get; set; }
        public string Whom_Guj { get; set; }
        public string WhenSpeaking_Guj { get; set; }
        public string Que_Eng { get; set; }
        public string Who_Eng { get; set; }
        public string Whom_Eng { get; set; }
        public string WhenSpeaking_Eng { get; set; }
        public string Exams { get; set; }
        public virtual Book Book { get; set; }
    }
}
