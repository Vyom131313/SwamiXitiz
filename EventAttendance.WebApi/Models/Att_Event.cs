using System;
using System.Collections.Generic;

namespace EventAttendance.WebApi.Models
{
    public partial class Att_Event
    {
        public Att_Event()
        {
            this.EventSchedules = new List<Att_EventSchedule>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public virtual ICollection<Att_EventSchedule> EventSchedules { get; set; }
    }
}
