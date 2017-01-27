using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using EventAttendance.WebApi.Models.Mapping;

namespace EventAttendance.WebApi.Models
{
    public partial class EventAttendanceContext : DbContext
    {
        static EventAttendanceContext()
        {
            Database.SetInitializer<EventAttendanceContext>(null);
        }

        public EventAttendanceContext()
            : base("Name=EventAttendanceContext")
        {
        }

        public DbSet<Attendance> Attendances { get; set; }
        public DbSet<Attendee> Attendees { get; set; }
        public DbSet<Event> Events { get; set; }
        public DbSet<EventSchedule> EventSchedules { get; set; }
        public DbSet<Zone> Zones { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new AttendanceMap());
            modelBuilder.Configurations.Add(new AttendeeMap());
            modelBuilder.Configurations.Add(new EventMap());
            modelBuilder.Configurations.Add(new EventScheduleMap());
            modelBuilder.Configurations.Add(new ZoneMap());
        }
    }
}
