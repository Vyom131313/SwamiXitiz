using System;
using System.Collections.Generic;

namespace EventAttendance.WebApi.Models
{
    public partial class Att_Zone
    {
        public Att_Zone()
        {
            this.Attendees = new List<Att_Attendee>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public virtual ICollection<Att_Attendee> Attendees { get; set; }
    }
}
