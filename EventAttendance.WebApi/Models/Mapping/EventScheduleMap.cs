using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace EventAttendance.WebApi.Models.Mapping
{
    public class EventScheduleMap : EntityTypeConfiguration<EventSchedule>
    {
        public EventScheduleMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            // Table & Column Mappings
            this.ToTable("EventSchedule");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.EventId).HasColumnName("EventId");
            this.Property(t => t.EventDate).HasColumnName("EventDate");
            this.Property(t => t.IsFreezed).HasColumnName("IsFreezed");

            // Relationships
            this.HasRequired(t => t.Event)
                .WithMany(t => t.EventSchedules)
                .HasForeignKey(d => d.EventId);

        }
    }
}
