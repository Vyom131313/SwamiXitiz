using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace EventAttendance.WebApi.Models.Mapping
{
    public class Att_AttendeeMap : EntityTypeConfiguration<Att_Attendee>
    {
        public Att_AttendeeMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.FirstName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.LastName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.Gender)
                .IsRequired()
                .HasMaxLength(1);

            this.Property(t => t.Address)
                .HasMaxLength(500);

            // Table & Column Mappings
            this.ToTable("Att_Attendee");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.FirstName).HasColumnName("FirstName");
            this.Property(t => t.LastName).HasColumnName("LastName");
            this.Property(t => t.Gender).HasColumnName("Gender");
            this.Property(t => t.Address).HasColumnName("Address");
            this.Property(t => t.ZoneId).HasColumnName("ZoneId");
            this.Property(t => t.IsKaryakar).HasColumnName("IsKaryakar");

            // Relationships
            this.HasOptional(t => t.Zone)
                .WithMany(t => t.Attendees)
                .HasForeignKey(d => d.ZoneId);

        }
    }
}
