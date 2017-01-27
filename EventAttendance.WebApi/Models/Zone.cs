using System;
using System.Collections.Generic;

namespace EventAttendance.WebApi.Models
{
    public partial class Zone
    {
        public Zone()
        {
            this.Attendees = new List<Attendee>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public virtual ICollection<Attendee> Attendees { get; set; }
    }
}
