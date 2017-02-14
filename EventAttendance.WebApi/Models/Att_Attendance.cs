using System;
using System.Collections.Generic;

namespace EventAttendance.WebApi.Models
{
    public partial class Att_Attendance
    {
        public int Id { get; set; }
        public int EventScheduleId { get; set; }
        public int AttendeeId { get; set; }
        public bool IsAttended { get; set; }
        public System.DateTime AttendanceTime { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime ModifiedOn { get; set; }
        public virtual Att_Attendee Attendee { get; set; }
        public virtual Att_EventSchedule EventSchedule { get; set; }
    }
}
