using EventAttendance.WebApi.Models;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;

namespace EventAttendance.WebApi.Controllers
{
    public class EventsController : ApiController
    {
        private EventAttendanceContext db = new EventAttendanceContext();

        public EventsController()
        {
            db.Configuration.ProxyCreationEnabled = false;
        }

        [HttpGet]
        [Route("api/Events/Get")]
        [Route("api/Events/Get/{filter}")]
        public IQueryable<Event_VM> GetEvents(string filter = "")
        {
            return db.Events.Select(c => new Event_VM { Id = c.Id, Name = c.Name });
        }

        // GET: api/Events/5
        [ResponseType(typeof(Event_VM))]
        public async Task<IHttpActionResult> GetEvent(int id)
        {
            Event Event = await db.Events.FindAsync(id);
            if (Event == null)
            {
                return NotFound();
            }

            var eventVM = new Event_VM { Id = Event.Id, Name = Event.Name };

            return Ok(eventVM);
        }

        // PUT: api/Events/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutEvent(int id, Event Event)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != Event.Id)
            {
                return BadRequest();
            }

            db.Entry(Event).State = EntityState.Modified;

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

        // POST: api/Events
        [ResponseType(typeof(Event))]
        public async Task<IHttpActionResult> PostEvent(Event Event)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Events.Add(Event);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = Event.Id }, Event);
        }

        //// DELETE: api/Events/5
        //[ResponseType(typeof(Event))]
        //public async Task<IHttpActionResult> DeleteEvent(int id)
        //{
        //    Event Event = await db.Events.FindAsync(id);
        //    if (Event == null)
        //    {
        //        return NotFound();
        //    }

        //    db.Events.Remove(Event);
        //    await db.SaveChangesAsync();

        //    return Ok(Event);
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
            return db.Events.Count(e => e.Id == id) > 0;
        }
    }
}