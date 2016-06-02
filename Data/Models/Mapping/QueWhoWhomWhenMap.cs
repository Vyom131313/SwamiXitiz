using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SwamiXitiz.Data.Models.Mapping
{
    public class QueWhoWhomWhenMap : EntityTypeConfiguration<QueWhoWhomWhen>
    {
        public QueWhoWhomWhenMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.Who_Eng)
                .HasMaxLength(100);

            this.Property(t => t.Whom_Eng)
                .HasMaxLength(100);

            this.Property(t => t.Whom_Guj)
                .HasMaxLength(100);

            // Table & Column Mappings
            this.ToTable("QueWhoWhomWhen");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.BookId).HasColumnName("BookId");
            this.Property(t => t.ChapterNumber).HasColumnName("ChapterNumber");
            this.Property(t => t.Que_Eng).HasColumnName("Que_Eng");
            this.Property(t => t.Who_Eng).HasColumnName("Who_Eng");
            this.Property(t => t.Whom_Eng).HasColumnName("Whom_Eng");
            this.Property(t => t.WhenSpeaking_Eng).HasColumnName("WhenSpeaking_Eng");
            this.Property(t => t.Exams).HasColumnName("Exams");
            this.Property(t => t.Que_Guj).HasColumnName("Que_Guj");
            this.Property(t => t.Who_Guj).HasColumnName("Who_Guj");
            this.Property(t => t.Whom_Guj).HasColumnName("Whom_Guj");
            this.Property(t => t.WhenSpeaking_Guj).HasColumnName("WhenSpeaking_Guj");

            // Relationships
            this.HasRequired(t => t.Book)
                .WithMany(t => t.QueWhoWhomWhens)
                .HasForeignKey(d => d.BookId);

        }
    }
}
