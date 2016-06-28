using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SwamiXitiz.Data.Models.Mapping
{
    public class BookMap : EntityTypeConfiguration<Book>
    {
        public BookMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.Name_Eng)
                .IsRequired()
                .HasMaxLength(500);

            this.Property(t => t.Name_Guj)
                .IsRequired()
                .HasMaxLength(500);

            this.Property(t => t.Code_Eng)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Code_Guj)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Book");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Name_Eng).HasColumnName("Name_Eng");
            this.Property(t => t.Name_Guj).HasColumnName("Name_Guj");
            this.Property(t => t.Code_Eng).HasColumnName("Code_Eng");
            this.Property(t => t.Code_Guj).HasColumnName("Code_Guj");
            this.Property(t => t.ExamLevelId).HasColumnName("ExamLevelId");

            // Relationships
            this.HasRequired(t => t.ExamLevel)
                .WithMany(t => t.Books)
                .HasForeignKey(d => d.ExamLevelId);

        }
    }
}
