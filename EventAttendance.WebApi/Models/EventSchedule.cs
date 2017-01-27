using System;
using System.Collections.Generic;

namespace EventAttendance.WebApi.Models
{
    public partial class EventSchedule
    {
        public EventSchedule()
        {
            this.Attendances = new List<Attendance>();
        }

        public int Id { get; set; }
        public int EventId { get; set; }
        public System.DateTime EventDate { get; set; }
        public bool IsFreezed { get; set; }
        public virtual ICollection<Attendance> Attendances { get; set; }
        public virtual Event Event { get; set; }
    }
}
