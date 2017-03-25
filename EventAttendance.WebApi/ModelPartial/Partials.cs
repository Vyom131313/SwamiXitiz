using System;
using System.Linq;
using System.ComponentModel.DataAnnotations.Schema;
using System.Collections.Generic;

namespace EventAttendance.WebApi.Models
{
    public partial class Att_Attendee
    {
        public virtual string ZoneName { get { return this.Zone != null ? this.Zone.Name : string.Empty; } }
        public virtual string FullName
        {
            get
            {
                return string.Format("{0} {1} {2}",
                    this.FirstName,
                    !string.IsNullOrEmpty(this.MiddleName) ? this.MiddleName.Trim().FirstOrDefault().ToString() : string.Empty,
                    this.LastName);
            }
        }

        [NotMapped]
        public virtual string CityName
        {
            get { return this.City != null ? this.City.Name : string.Empty; }
        }
    }

    public partial class Att_EventSchedule
    {
        public virtual string EventName { get { return this.Event != null ? this.Event.Name : string.Empty; } }

        [NotMapped]
        public virtual string EventShortDate
        {
            get { return this.EventDate != null ? this.EventDate.ToString("MM/dd/yyyy") : DateTime.Now.ToString("MM/dd/yyyy"); }
            set { var dt = DateTime.Now; DateTime.TryParse(value, out dt); this.EventDate = dt; }
        }
    }

    public partial class Att_Attendance
    {
        [NotMapped]
        public virtual string EventShortDate
        {
            get { return this.EventSchedule != null ? this.EventSchedule.EventShortDate : string.Empty; }
        }

        [NotMapped]
        public virtual string AttendanceTimeOnly
        {
            get { return this.AttendanceTime != null ? this.AttendanceTime.ToString("hh:mm tt") : string.Empty; }
        }
    }

    public partial class Zone_VM
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public partial class Seva_VM
    {
        public int Id { get; set; }
        public string DepartmentName { get; set; }
        public string SevaName { get; set; }
        public string FullName
        {
            get;set;
        }
    }

    public partial class City_VM
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public partial class Event_VM
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public partial class EventSchedule_VM
    {
        public int Id { get; set; }
        public int EventId { get; set; }
        public DateTime EventDate { get; set; }
        public bool IsFreezed { get; set; }
        public string Notes { get; set; }

        public virtual string EventName { get; set; }
        public virtual string EventShortDate { get; set; }
    }

    public partial class Att_Attendee
    {
        [NotMapped]
        public virtual string SevaFullNames { get; set; }
    }

    public partial class Attendee_VM
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string Gender { get; set; }
        public Nullable<int> ZoneId { get; set; }
        public Nullable<int> CityId { get; set; }
        public Nullable<int> ImsId { get; set; }

        public bool IsKaryakar { get; set; }
        public bool IsDeleted { get; set; }

        public virtual string CityName { get; set; }
        public virtual string ZoneName { get; set; }
        public virtual string FullName { get; set; }

        public virtual string SevaFullNames { get; set; }
    }

    public partial class Attendance_VM
    {
        public int Id { get; set; }
        public int EventScheduleId { get; set; }
        public int AttendeeId { get; set; }
        public bool IsAttended { get; set; }
        public DateTime AttendanceTime { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime ModifiedOn { get; set; }

        public virtual string FirstName { get; set; }
        public virtual string MiddleName { get; set; }
        public virtual string LastName { get; set; }

        public virtual string AttendeeFullName { get; set; }

        public virtual string CityName { get; set; }

        public virtual string ZoneName { get; set; }

        public virtual string Gender { get; set; }

        public virtual string Address { get; set; }

        public virtual string EventShortDate { get; set; }

        public virtual bool IsKaryakar { get; set; }

        public virtual string AttendanceTimeOnly { get; set; }

        public string Slot { get; set; }
    }
}
