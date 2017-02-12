using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace EventAttendance.WebApi.Models
{
    public partial class Attendee
    {
        public virtual string ZoneName { get { return this.Zone != null ? this.Zone.Name : string.Empty; } }
        public virtual string FullName { get { return string.Format("{0} {1}", this.FirstName, this.LastName); } }
    }

    public partial class EventSchedule
    {
        public virtual string EventName { get { return this.Event != null ? this.Event.Name : string.Empty; } }

        [NotMapped]
        public virtual string EventShortDate
        {
            get { return this.EventDate != null ? this.EventDate.ToString("MM/dd/yyyy") : DateTime.Now.ToString("MM/dd/yyyy"); }
            set { var dt = DateTime.Now; DateTime.TryParse(value, out dt); this.EventDate = dt; }
        }
    }

    public partial class Attendance
    {
        [NotMapped]
        public virtual string AttendeeFullName
        {
            get { return this.Attendee != null ? this.Attendee.FullName : string.Empty; }
        }

        [NotMapped]
        public virtual string ZoneName
        {
            get { return this.Attendee != null ? this.Attendee.ZoneName : string.Empty; }
        }

        [NotMapped]
        public virtual string Address
        {
            get { return this.Attendee != null ? this.Attendee.Address : string.Empty; }
        }

        [NotMapped]
        public virtual string EventShortDate
        {
            get { return this.EventSchedule != null ? this.EventSchedule.EventShortDate : string.Empty; }
        }

        [NotMapped]
        public virtual bool IsKaryakar
        {
            get { return this.Attendee != null ? this.Attendee.IsKaryakar : false; }
        }

        [NotMapped]
        public virtual string AttendanceTimeOnly
        {
            get { return this.AttendanceTime != null ? this.AttendanceTime.ToString("hh:mm tt") : string.Empty; }
        }
    }

    public partial class Zone_VM
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public partial class Event_VM
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public partial class EventSchedule_VM
    {
        public int Id { get; set; }
        public int EventId { get; set; }
        public DateTime EventDate { get; set; }
        public bool IsFreezed { get; set; }

        public virtual string EventName { get; set; }
        public virtual string EventShortDate { get; set; }
    }

    public partial class Attendee_VM
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public Nullable<int> ZoneId { get; set; }
        public bool IsKaryakar { get; set; }

        public virtual string ZoneName { get; set; }
        public virtual string FullName { get; set; }

    }

    public partial class Attendance_VM
    {
        public int Id { get; set; }
        public int EventScheduleId { get; set; }
        public int AttendeeId { get; set; }
        public bool IsAttended { get; set; }
        public DateTime AttendanceTime { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime ModifiedOn { get; set; }

        public virtual string AttendeeFullName { get; set; }

        public virtual string ZoneName { get; set; }

        public virtual string Address { get; set; }

        public virtual string EventShortDate { get; set; }

        public virtual bool IsKaryakar { get; set; }

        public virtual string AttendanceTimeOnly { get; set; }

        public string Slot { get; set; }
    }
}
