using System;
using System.Collections.Generic;

namespace SwamiXitiz.Data.Models
{
    public partial class Book
    {
        public Book()
        {
            this.BookChapters = new List<BookChapter>();
        }

        public int Id { get; set; }
        public string Name_Eng { get; set; }
        public string Name_Guj { get; set; }
        public virtual ICollection<BookChapter> BookChapters { get; set; }
    }
}
