using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SwamiXitiz.Data.Models.Mapping
{
    public class QueCorrectSequenceMap : EntityTypeConfiguration<QueCorrectSequence>
    {
        public QueCorrectSequenceMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            // Table & Column Mappings
            this.ToTable("QueCorrectSequence");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.BookId).HasColumnName("BookId");
            this.Property(t => t.ChapterNumber).HasColumnName("ChapterNumber");
            this.Property(t => t.Title_Eng).HasColumnName("Title_Eng");
            this.Property(t => t.Correct_Eng).HasColumnName("Correct_Eng");
            this.Property(t => t.Title_Guj).HasColumnName("Title_Guj");
            this.Property(t => t.Correct_Guj).HasColumnName("Correct_Guj");
            this.Property(t => t.Exams).HasColumnName("Exams");
        }
    }
}
