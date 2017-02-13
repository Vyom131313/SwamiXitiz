using System;
using System.Collections.Generic;

namespace EventAttendance.WebApi.Models
{
    public partial class Attendee
    {
        public Attendee()
        {
            this.Attendances = new List<Attendance>();
        }

        public int Id { get; set; }
        public string FirstName { get; set; }
        public string Gender { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public Nullable<int> ZoneId { get; set; }
        public bool IsKaryakar { get; set; }
        public virtual ICollection<Attendance> Attendances { get; set; }
        public virtual Zone Zone { get; set; }
    }
}
