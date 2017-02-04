using System;
using System.Collections.Generic;

namespace EventAttendance.WebApi.Models
{
    public partial class Attendee
    {
        public virtual string ZoneName { get { return this.Zone != null ? this.Zone.Name : string.Empty; } }
    }
}
