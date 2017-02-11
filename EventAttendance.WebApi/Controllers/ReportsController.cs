using EventAttendance.WebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using System.Data.Entity;

namespace EventAttendance.WebApi.Controllers
{
    public class ReportsController : ApiController
    {
        private EventAttendanceContext db = new EventAttendanceContext();

        //[HttpGet]
        [Route("api/Reports/GetByEventSchedule")]
        [Route("api/Reports/GetByEventSchedule/{eventScheduleId}")]
        [Route("api/Reports/GetByEventSchedule/{eventScheduleId}/{filter}")]
        public IQueryable<Attendance_VM> GetByEventSchedule(int eventScheduleId, string filter = "")
        {
            if (eventScheduleId == 0)
                return new List<Attendance_VM>().AsQueryable();

            var eventSchedule = db.EventSchedules.FirstOrDefault(c => c.Id == eventScheduleId);

            var query = (from attendee in db.Attendees.Include(c => c.Zone).Where(c => string.IsNullOrEmpty(filter) || c.FirstName.StartsWith(filter) || c.LastName.StartsWith(filter))
                         join attendance in db.Attendances.Where(c => c.EventScheduleId == eventScheduleId) on attendee.Id equals attendance.AttendeeId into gj
                         from x in gj.DefaultIfEmpty()
                         select new { attendee = attendee, attendance = x }).ToList().
                        Select(c => new Attendance_VM
                        {

                            //EventSchedule = c.attendance != null ? c.attendance.EventSchedule : eventSchedule,
                            EventScheduleId = c.attendance != null ? c.attendance.EventScheduleId : 0,
                            EventShortDate = eventSchedule.EventShortDate,

                            ////Attendee = c.attendee,
                            AttendeeId = c.attendee.Id,
                            AttendeeFullName = c.attendee.FullName,
                            ZoneName = c.attendee.ZoneName,
                            //IsKaryakar = c.attendee.IsKaryakar,
                            Address = c.attendee.Address,

                            Id = c.attendance != null ? c.attendance.Id : 0,
                            AttendanceTimeOnly = c.attendance != null ? c.attendance.AttendanceTimeOnly : string.Empty,
                            IsAttended = c.attendance != null ? c.attendance.IsAttended : default(bool),
                            AttendanceTime = c.attendance != null ? c.attendance.AttendanceTime : default(DateTime),
                        }).OrderBy(c => c.IsAttended).ThenBy(c => c.AttendeeFullName).ToList();

            return query.AsQueryable<Attendance_VM>();
        }

        [HttpGet]
        [Route("api/Reports/GetByAttendee/{attendeeId}")]
        public IQueryable<Attendance> GetByAttendee(int attendeeId)
        {
            if (attendeeId == 0)
                return new List<Attendance>().AsQueryable();

            var data = db.Attendances.Include(c => c.Attendee).Where(c => c.AttendeeId == attendeeId).ToList()
                    .Select(c => new Attendance
                    {
                        AttendeeId = c.Attendee.Id,
                        Attendee = c.Attendee,

                        Id = c.Id,
                        EventScheduleId = c.EventScheduleId,
                        EventSchedule = c.EventSchedule,
                        IsAttended = c.IsAttended,
                        AttendanceTime = c.AttendanceTime,
                    })
                    .OrderBy(c => c.IsAttended).ThenBy(c => c.AttendeeFullName)
                    .ToList().AsQueryable<Attendance>();

            return data;
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }

            base.Dispose(disposing);
        }
    }
}