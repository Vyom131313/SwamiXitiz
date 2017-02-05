using EventAttendance.WebApi.Models;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace EventAttendance.WebApi.Controllers
{
    public class EventSchedulesController : ApiController
    {
        private EventAttendanceContext db = new EventAttendanceContext();

        public EventSchedulesController()
        {
            db.Configuration.ProxyCreationEnabled = false;
        }

        public IQueryable<EventSchedule> GetEventSchedules()
        {
            return db.EventSchedules.Include(c => c.Event);
        }

        // GET: api/EventSchedules/5
        [ResponseType(typeof(EventSchedule))]
        public async Task<IHttpActionResult> GetEventSchedule(int id)
        {
            EventSchedule EventSchedule = await db.EventSchedules.FindAsync(id);
            if (EventSchedule == null)
            {
                return NotFound();
            }

            return Ok(EventSchedule);
        }

        // PUT: api/EventSchedules/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutEvent(int id, EventSchedule EventSchedule)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != EventSchedule.Id)
            {
                return BadRequest();
            }

            db.Entry(EventSchedule).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EventExists(id))
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

        // POST: api/EventSchedules
        [ResponseType(typeof(EventSchedule))]
        public async Task<IHttpActionResult> PostEvent(EventSchedule EventSchedule)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.EventSchedules.Add(EventSchedule);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = EventSchedule.Id }, EventSchedule);
        }

        //// DELETE: api/EventSchedules/5
        //[ResponseType(typeof(EventSchedule))]
        //public async Task<IHttpActionResult> DeleteEventSchedule(int id)
        //{
        //    EventSchedule EventSchedule = await db.EventSchedules.FindAsync(id);
        //    if (EventSchedule == null)
        //    {
        //        return NotFound();
        //    }

        //    db.EventSchedules.Remove(EventSchedule);
        //    await db.SaveChangesAsync();

        //    return Ok(EventSchedule);
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool EventExists(int id)
        {
            return db.EventSchedules.Count(e => e.Id == id) > 0;
        }
    }
}