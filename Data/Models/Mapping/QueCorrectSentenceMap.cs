using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SwamiXitiz.Data.Models.Mapping
{
    public class QueCorrectSentenceMap : EntityTypeConfiguration<QueCorrectSentence>
    {
        public QueCorrectSentenceMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            // Table & Column Mappings
            this.ToTable("QueCorrectSentence");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.BookId).HasColumnName("BookId");
            this.Property(t => t.ChapterNumber).HasColumnName("ChapterNumber");
            this.Property(t => t.Title_Eng).HasColumnName("Title_Eng");
            this.Property(t => t.Ans_Eng).HasColumnName("Ans_Eng");
            this.Property(t => t.Title_Guj).HasColumnName("Title_Guj");
            this.Property(t => t.Ans_Guj).HasColumnName("Ans_Guj");
            this.Property(t => t.Exams).HasColumnName("Exams");

            // Relationships
            this.HasRequired(t => t.Book)
                .WithMany(t => t.QueCorrectSentences)
                .HasForeignKey(d => d.BookId);

        }
    }
}
