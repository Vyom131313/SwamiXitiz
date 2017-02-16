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

        public DbSet<Att_Attendance> Attendances { get; set; }
        public DbSet<Att_Attendee> Attendees { get; set; }
        public DbSet<Att_Event> Events { get; set; }
        public DbSet<Att_EventSchedule> EventSchedules { get; set; }
        public DbSet<Att_Zone> Zones { get; set; }
        public DbSet<Att_City> Cities { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new Att_AttendanceMap());
            modelBuilder.Configurations.Add(new Att_AttendeeMap());
            modelBuilder.Configurations.Add(new Att_EventMap());
            modelBuilder.Configurations.Add(new Att_EventScheduleMap());
            modelBuilder.Configurations.Add(new Att_ZoneMap());
            modelBuilder.Configurations.Add(new Att_CityMap());
        }
    }
}
