using System;
using System.Collections.Generic;

namespace EventAttendance.WebApi.Models
{
    public partial class Att_EventSchedule
    {
        public Att_EventSchedule()
        {
            this.Attendances = new List<Att_Attendance>();
        }

        public int Id { get; set; }
        public int EventId { get; set; }
        public System.DateTime EventDate { get; set; }
        public bool IsFreezed { get; set; }
        public virtual ICollection<Att_Attendance> Attendances { get; set; }
        public virtual Att_Event Event { get; set; }
    }
}
