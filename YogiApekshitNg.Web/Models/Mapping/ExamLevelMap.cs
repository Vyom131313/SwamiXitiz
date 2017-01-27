using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace SwamiXitiz.Data.Models.Mapping
{
    public class ExamLevelMap : EntityTypeConfiguration<ExamLevel>
    {
        public ExamLevelMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.Name_Eng)
                .HasMaxLength(500);

            this.Property(t => t.Name_Guj)
                .HasMaxLength(500);

            // Table & Column Mappings
            this.ToTable("ExamLevel");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Name_Eng).HasColumnName("Name_Eng");
            this.Property(t => t.Name_Guj).HasColumnName("Name_Guj");
        }
    }
}
