using System;
using System.Collections.Generic;

namespace EventAttendance.WebApi.Models
{
    public partial class Zone
    {
        public Zone()
        {
            this.Attendees = new List<Att_Attendee>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public virtual ICollection<Att_Attendee> Attendees { get; set; }
    }
}
