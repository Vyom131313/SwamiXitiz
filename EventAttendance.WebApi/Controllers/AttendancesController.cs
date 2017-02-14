using EventAttendance.WebApi.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace EventAttendance.WebApi.Controllers
{
    public class AttendancesController : ApiController
    {
        private EventAttendanceContext db = new EventAttendanceContext();

        // GET: api/Attendances
        public IQueryable<Attendance_VM> GetAttendances(int eventScheduleId, string gender = "", string filter = "")
        {
            if (eventScheduleId == 0)
                return new List<Attendance_VM>().AsQueryable();

            var eventSchedule = db.EventSchedules.FirstOrDefault(c => c.Id == eventScheduleId);

            var query = (from attendee in db.Attendees
                            .Where(c => string.IsNullOrEmpty(filter) || c.FirstName.StartsWith(filter) || c.LastName.StartsWith(filter))
                            .Where(c => string.IsNullOrEmpty(gender) || c.Gender.Equals(gender))
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

        // GET: api/Attendances/5
        [ResponseType(typeof(Att_Attendance))]
        public async Task<IHttpActionResult> GetAttendance(int id)
        {
            Att_Attendance attendance = await db.Attendances.FindAsync(id);
            if (attendance == null)
            {
                return NotFound();
            }

            return Ok(attendance);
        }

        // PUT: api/Attendances/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PostAttendance(int id, Attendance_VM attendance)
        {
            try
            {
                if (db.Attendances
                    .Count(c => c.EventScheduleId == attendance.EventScheduleId && c.AttendeeId == attendance.AttendeeId) == 0)
                {
                    db.Attendances.Add(new Att_Attendance
                    {
                        EventScheduleId = attendance.EventScheduleId,
                        AttendeeId = attendance.AttendeeId,
                        AttendanceTime = attendance.AttendanceTime,
                        IsAttended = true,
                        CreatedOn = DateTime.Now,
                        ModifiedOn = DateTime.Now
                    });

                    //db.SaveChanges();
                    await db.SaveChangesAsync();
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                //if (!AttendanceExists(id))
                //{
                //    return NotFound();
                //}
                //else
                //{
                //    throw;
                //}
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // PUT: api/Attendances/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutAttendance(int id, Att_Attendance attendance)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != attendance.Id)
            {
                return BadRequest();
            }

            db.Entry(attendance).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AttendanceExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        //// DELETE: api/Attendances/5
        //[ResponseType(typeof(Attendance))]
        //public async Task<IHttpActionResult> DeleteAttendance(int id)
        //{
        //    Attendance attendance = await db.Attendances.FindAsync(id);
        //    if (attendance == null)
        //    {
        //        return NotFound();
        //    }

        //    db.Attendances.Remove(attendance);
        //    await db.SaveChangesAsync();

        //    return Ok(attendance);
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AttendanceExists(int id)
        {
            return db.Attendances.Count(e => e.Id == id) > 0;
        }
    }
}