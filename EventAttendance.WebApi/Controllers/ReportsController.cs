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
            var slot1 = new DateTime(eventSchedule.EventDate.Year, eventSchedule.EventDate.Month, eventSchedule.EventDate.Day,
                            16, 00, 00);

            var slot2 = new DateTime(eventSchedule.EventDate.Year, eventSchedule.EventDate.Month, eventSchedule.EventDate.Day,
                            16, 15, 00);

            var slot3 = new DateTime(eventSchedule.EventDate.Year, eventSchedule.EventDate.Month, eventSchedule.EventDate.Day,
                            16, 30, 00);

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
                            Gender = c.attendee.Gender,
                            CityName = c.attendee.CityName,
                            ZoneName = c.attendee.ZoneName,
                            IsKaryakar = c.attendee.IsKaryakar,
                            Address = c.attendee.Address,

                            Id = c.attendance != null ? c.attendance.Id : 0,
                            AttendanceTimeOnly = c.attendance != null ? c.attendance.AttendanceTimeOnly : string.Empty,
                            IsAttended = c.attendance != null ? c.attendance.IsAttended : default(bool),
                            AttendanceTime = c.attendance != null ? c.attendance.AttendanceTime : default(DateTime),

                            Slot = c.attendance != null
                                    ? GetSlotTextForSlotDate(c.attendance.AttendanceTime, slot1, slot2, slot3)
                                    : string.Empty,

                        }).OrderBy(c => c.IsAttended).ThenBy(c => c.AttendeeFullName).ToList();

            return query.AsQueryable<Attendance_VM>();
        }

        [HttpGet]
        [Route("api/Reports/GetByAttendee")]
        [Route("api/Reports/GetByAttendee/{attendeeId}")]
        public IQueryable<Attendance_VM> GetByAttendee(int attendeeId)
        {
            if (attendeeId == 0)
                return new List<Attendance_VM>().AsQueryable();

            var query = db.Attendances.Include(c => c.Attendee).Include(c => c.EventSchedule).Include(c => c.EventSchedule.Event).Include(c => c.Attendee.Zone)
                         .Where(c => c.AttendeeId == attendeeId)
                         .ToList();

            var query2 = query.Select(c => new Attendance_VM
            {
                EventScheduleId = c.EventScheduleId,
                EventShortDate = c.EventShortDate,

                AttendeeId = c.Attendee.Id,
                AttendeeFullName = c.Attendee.FullName,
                ZoneName = c.Attendee.ZoneName,
                Gender = c.Attendee.Gender,
                IsKaryakar = c.Attendee.IsKaryakar,
                Address = c.Attendee.Address,

                Id = c.Id,
                AttendanceTimeOnly = c.AttendanceTimeOnly,
                IsAttended = c.IsAttended,
                AttendanceTime = c.AttendanceTime,

                Slot = GetSlotTextForSlotDate(c.AttendanceTime, GetSlotDateTimeForSlotText(c.AttendanceTime, "Slot-1"),
                                                                GetSlotDateTimeForSlotText(c.AttendanceTime, "Slot-2"),
                                                                GetSlotDateTimeForSlotText(c.AttendanceTime, "Slot-3")),

            }).OrderBy(c => c.IsAttended).ThenBy(c => c.AttendeeFullName).ToList();

            return query2.AsQueryable<Attendance_VM>();
        }

        private string GetSlotTextForSlotDate(DateTime dt, DateTime slot1, DateTime slot2, DateTime slot3)
        {
            var slot = string.Empty;
            if (dt <= slot1)
                slot = "Slot-1";
            else if (dt <= slot2)
                slot = "Slot-2";
            else if (dt <= slot3)
                slot = "Slot-3";
            else if (dt > slot3)
                slot = "Slot-4";
            return slot;
        }

        private DateTime GetSlotDateTimeForSlotText(DateTime dt, string slotText)
        {
            switch (slotText)
            {
                case "Slot-1":
                    dt = new DateTime(dt.Year, dt.Month, dt.Day, 16, 00, 00);
                    break;
                case "Slot-2":
                    dt = new DateTime(dt.Year, dt.Month, dt.Day, 16, 15, 00);
                    break;
                case "Slot-3":
                    dt = new DateTime(dt.Year, dt.Month, dt.Day, 16, 30, 00);
                    break;
                case "Slot-4":
                    break;
            }

            return dt;
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