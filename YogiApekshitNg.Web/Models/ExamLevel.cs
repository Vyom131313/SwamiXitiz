using System;
using System.Collections.Generic;

namespace SwamiXitiz.Data.Models
{
    public partial class ExamLevel
    {
        public ExamLevel()
        {
            this.Books = new List<Book>();
        }

        public int Id { get; set; }
        public string Name_Eng { get; set; }
        public string Name_Guj { get; set; }
        public virtual ICollection<Book> Books { get; set; }
    }
}
