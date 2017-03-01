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


            this.Property(t => t.MiddleName)
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
            this.Property(t => t.MiddleName).HasColumnName("MiddleName");
            this.Property(t => t.LastName).HasColumnName("LastName");
            this.Property(t => t.Gender).HasColumnName("Gender");
            this.Property(t => t.Address).HasColumnName("Address");
            this.Property(t => t.ZoneId).HasColumnName("ZoneId");
            this.Property(t => t.CityId).HasColumnName("CityId");
            this.Property(t => t.IsKaryakar).HasColumnName("IsKaryakar");
            this.Property(t => t.IsDeleted).HasColumnName("IsDeleted");

            // Relationships
            this.HasOptional(t => t.Zone)
                .WithMany(t => t.Attendees)
                .HasForeignKey(d => d.ZoneId);

            this.HasRequired(t => t.City)
                .WithMany(t => t.Attendees)
                .HasForeignKey(d => d.CityId);
        }
    }
}
