using System;
using System.Collections.Generic;

namespace SwamiXitiz.Data.Models
{
    public partial class BookChapter
    {
        public int Id { get; set; }
        public int BookId { get; set; }
        public Nullable<int> ChapterNumber { get; set; }
        public string Name_Eng { get; set; }
        public string Name_Guj { get; set; }
        public virtual Book Book { get; set; }
    }
}
