using System;
using System.Collections.Generic;

namespace EventAttendance.WebApi.Models
{
    public partial class Event
    {
        public Event()
        {
            this.EventSchedules = new List<EventSchedule>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public virtual ICollection<EventSchedule> EventSchedules { get; set; }
    }
}
