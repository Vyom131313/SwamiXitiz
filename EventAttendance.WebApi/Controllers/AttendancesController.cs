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
        [Route("api/Attendances")]
        [Route("api/Attendances/{eventScheduleId}")]
        [Route("api/Attendances/{eventScheduleId}/{filter}")]
        public IQueryable<Attendance> GetAttendances(int eventScheduleId, string filter = "")
        {
            if (eventScheduleId == 0)
                return new List<Attendance>().AsQueryable();

            var query = (from attendee in db.Attendees.Where(c => string.IsNullOrEmpty(filter) || c.FirstName.StartsWith(filter) || c.LastName.StartsWith(filter))
                         join attendance in db.Attendances.Where(c => c.EventScheduleId == eventScheduleId) on attendee.Id equals attendance.AttendeeId into gj
                         from x in gj.DefaultIfEmpty()
                         select new { attendee = attendee, attendance = x }).ToList().
                        Select(c => new Attendance
                        {
                            AttendeeId = c.attendee.Id,
                            Attendee = c.attendee,

                            Id = c.attendance != null ? c.attendance.Id : 0,
                            EventScheduleId = c.attendance != null ? c.attendance.EventScheduleId : 0,
                            EventSchedule = c.attendance != null ? c.attendance.EventSchedule : null,
                            IsAttended = c.attendance != null ? c.attendance.IsAttended : default(bool),
                            AttendanceTime = c.attendance != null ? c.attendance.AttendanceTime : default(DateTime),
                        }).OrderBy(c => c.IsAttended).ThenBy(c => c.AttendeeFullName).ToList();

            return query.AsQueryable<Attendance>();
        }

        // GET: api/Attendances/5
        [ResponseType(typeof(Attendance))]
        public async Task<IHttpActionResult> GetAttendance(int id)
        {
            Attendance attendance = await db.Attendances.FindAsync(id);
            if (attendance == null)
            {
                return NotFound();
            }

            return Ok(attendance);
        }

        // PUT: api/Attendances/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutAttendance(int id, Attendance attendance)
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

        // POST: api/Attendances
        [ResponseType(typeof(Attendance))]
        public async Task<IHttpActionResult> PostAttendance(Attendance attendance)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Attendances.Add(attendance);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = attendance.Id }, attendance);
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