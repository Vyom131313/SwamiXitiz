using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SwamiXitiz.Data.Models.Mapping
{
    public class QueOneSentenceMap : EntityTypeConfiguration<QueOneSentence>
    {
        public QueOneSentenceMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            // Table & Column Mappings
            this.ToTable("QueOneSentence");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.BookId).HasColumnName("BookId");
            this.Property(t => t.ChapterNumber).HasColumnName("ChapterNumber");
            this.Property(t => t.Que_Eng).HasColumnName("Que_Eng");
            this.Property(t => t.Ans_Eng).HasColumnName("Ans_Eng");
            this.Property(t => t.Que_Guj).HasColumnName("Que_Guj");
            this.Property(t => t.Ans_Guj).HasColumnName("Ans_Guj");
            this.Property(t => t.Exams).HasColumnName("Exams");

            // Relationships
            this.HasRequired(t => t.Book)
                .WithMany(t => t.QueOneSentences)
                .HasForeignKey(d => d.BookId);

        }
    }
}
