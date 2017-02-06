using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace EventAttendance.WebApi.Models
{
    public partial class Attendee
    {
        public virtual string ZoneName { get { return this.Zone != null ? this.Zone.Name : string.Empty; } }
    }

    public partial class EventSchedule
    {
        public virtual string EventName { get { return this.Event != null ? this.Event.Name : string.Empty; } }

        private string tst;

        [NotMapped]
        public virtual string EventShortDate
        {
            get { return this.EventDate != null ? this.EventDate.ToString("MM/dd/yyyy") : DateTime.Now.ToString("MM/dd/yyyy"); }
            set { var dt = DateTime.Now; DateTime.TryParse(value, out dt); this.EventDate = dt; }
        }

        //public string GetEventShortDateAsString()
        //{
        //    return this.EventDate != null ? this.EventDate.ToString("MM/dd/yyyy") : DateTime.Now.ToString("MM/dd/yyyy");
        //}
    }
}
