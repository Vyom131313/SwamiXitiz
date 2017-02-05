using System;
using System.Collections.Generic;

namespace EventAttendance.WebApi.Models
{
    public partial class Attendee
    {
        public virtual string ZoneName { get { return this.Zone != null ? this.Zone.Name : string.Empty; } }
    }

    public partial class EventSchedule
    {
        public virtual string EventName { get { return this.Event != null ? this.Event.Name : string.Empty; } }
        public virtual string EventShortDate { get { return this.EventDate != null ? this.EventDate.ToString("MM/dd/yyyy") : string.Empty; } }
    }
}
