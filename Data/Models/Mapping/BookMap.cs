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
                .HasMaxLength(500);

            this.Property(t => t.Name_Guj)
                .HasMaxLength(500);

            // Table & Column Mappings
            this.ToTable("Book");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Name_Eng).HasColumnName("Name_Eng");
            this.Property(t => t.Name_Guj).HasColumnName("Name_Guj");
        }
    }
}
