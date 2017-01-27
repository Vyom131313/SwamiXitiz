using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace EventAttendance.WebApi.Models.Mapping
{
    public class AttendanceMap : EntityTypeConfiguration<Attendance>
    {
        public AttendanceMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            // Table & Column Mappings
            this.ToTable("Attendance");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.EventScheduleId).HasColumnName("EventScheduleId");
            this.Property(t => t.AttendeeId).HasColumnName("AttendeeId");
            this.Property(t => t.IsAttended).HasColumnName("IsAttended");
            this.Property(t => t.AttendanceTime).HasColumnName("AttendanceTime");
            this.Property(t => t.CreatedOn).HasColumnName("CreatedOn");
            this.Property(t => t.ModifiedOn).HasColumnName("ModifiedOn");

            // Relationships
            this.HasRequired(t => t.Attendee)
                .WithMany(t => t.Attendances)
                .HasForeignKey(d => d.AttendeeId);
            this.HasRequired(t => t.EventSchedule)
                .WithMany(t => t.Attendances)
                .HasForeignKey(d => d.EventScheduleId);

        }
    }
}
