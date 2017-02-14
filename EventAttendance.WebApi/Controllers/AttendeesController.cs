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
    public class AttendeesController : ApiController
    {
        private EventAttendanceContext db = new EventAttendanceContext();
        public AttendeesController()
        {
            //db.Configuration.LazyLoadingEnabled = false;
            db.Configuration.ProxyCreationEnabled = false;
        }

        // GET: api/Attendees
        public IQueryable<Attendee_VM> GetAttendees(string filter)
        {
            //return db.Attendees;
            var data = !string.IsNullOrEmpty(filter)
                ? db.Attendees.Include(c => c.Zone).Where(c => c.FirstName.StartsWith(filter) || c.LastName.StartsWith(filter)).ToList()
                : db.Attendees.Include(c => c.Zone).ToList();

            return data.Select(c => new Attendee_VM
            {
                Id = c.Id,
                FirstName = c.FirstName,
                LastName = c.LastName,
                Gender = c.Gender,
                Address = c.Address,
                ZoneId = c.ZoneId,
                //ZoneName = c.ZoneName,
                IsKaryakar = c.IsKaryakar,
                FullName = c.FullName,
                ZoneName = c.ZoneName,
            }).AsQueryable();
        }

        [Route("api/Attendees/GetZones")]
        public IQueryable<Zone_VM> GetZones()
        {
            return db.Zones.Select(c => new Zone_VM { Id = c.Id, Name = c.Name });
        }

        // GET: api/Attendees/5
        [ResponseType(typeof(Attendee_VM))]
        public async Task<IHttpActionResult> GetAttendee(int id)
        {
            Att_Attendee attendee = await db.Attendees.FindAsync(id);
            if (attendee == null)
            {
                return NotFound();
            }

            var attendeeVM = new Attendee_VM
            {
                Id = attendee.Id,
                Address = attendee.Address,
                FirstName = attendee.FirstName,
                LastName = attendee.LastName,
                Gender = attendee.Gender,
                FullName = attendee.FullName,
                IsKaryakar = attendee.IsKaryakar,
                ZoneId = attendee.ZoneId,
                ZoneName = attendee.ZoneName,
            };

            return Ok(attendeeVM);
        }

        // PUT: api/Attendees/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutAttendee(int id, Att_Attendee attendee)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != attendee.Id)
            {
                return BadRequest();
            }

            db.Entry(attendee).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AttendeeExists(id))
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

        // POST: api/Attendees
        [ResponseType(typeof(Att_Attendee))]
        public async Task<IHttpActionResult> PostAttendee(Att_Attendee attendee)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Attendees.Add(attendee);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = attendee.Id }, attendee);
        }

        //// DELETE: api/Attendees/5
        //[ResponseType(typeof(Attendee))]
        //public async Task<IHttpActionResult> DeleteAttendee(int id)
        //{
        //    Attendee attendee = await db.Attendees.FindAsync(id);
        //    if (attendee == null)
        //    {
        //        return NotFound();
        //    }

        //    db.Attendees.Remove(attendee);
        //    await db.SaveChangesAsync();

        //    return Ok(attendee);
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AttendeeExists(int id)
        {
            return db.Attendees.Count(e => e.Id == id) > 0;
        }
    }
}