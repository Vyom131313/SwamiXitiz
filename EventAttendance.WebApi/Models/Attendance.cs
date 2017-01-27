using System;
using System.Collections.Generic;

namespace EventAttendance.WebApi.Models
{
    public partial class Attendance
    {
        public int Id { get; set; }
        public int EventScheduleId { get; set; }
        public int AttendeeId { get; set; }
        public bool IsAttended { get; set; }
        public System.DateTime AttendanceTime { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime ModifiedOn { get; set; }
        public virtual Attendee Attendee { get; set; }
        public virtual EventSchedule EventSchedule { get; set; }
    }
}
