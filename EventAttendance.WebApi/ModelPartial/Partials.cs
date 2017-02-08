using System;
using System.Collections.Generic;
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
    }
}
