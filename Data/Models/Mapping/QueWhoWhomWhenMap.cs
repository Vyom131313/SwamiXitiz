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
            this.Property(t => t.Who)
                .HasMaxLength(100);

            this.Property(t => t.Whom)
                .HasMaxLength(100);

            // Table & Column Mappings
            this.ToTable("QueWhoWhomWhen");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.ChapterId).HasColumnName("ChapterId");
            this.Property(t => t.Que_Eng).HasColumnName("Que_Eng");
            this.Property(t => t.Que_Guj).HasColumnName("Que_Guj");
            this.Property(t => t.Who).HasColumnName("Who");
            this.Property(t => t.Whom).HasColumnName("Whom");
            this.Property(t => t.WhenSpeaking).HasColumnName("WhenSpeaking");
            this.Property(t => t.Exams).HasColumnName("Exams");
        }
    }
}
