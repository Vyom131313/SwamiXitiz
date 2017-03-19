using System;
using System.Collections.Generic;

namespace EventAttendance.WebApi.Models
{
    public partial class Att_Attendee
    {
        public Att_Attendee()
        {
            this.Attendances = new List<Att_Attendance>();
        }

        public int Id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string Gender { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public Nullable<int> ZoneId { get; set; }
        public int CityId { get; set; }
        public Nullable<int> ImsId { get; set; }

        public bool IsKaryakar { get; set; }
        public bool IsDeleted { get; set; }

        public virtual ICollection<Att_Attendance> Attendances { get; set; }
        public virtual Att_Zone Zone { get; set; }
        public virtual Att_City City { get; set; }
    }
}
