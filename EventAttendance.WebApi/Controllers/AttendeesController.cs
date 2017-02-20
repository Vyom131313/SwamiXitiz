using EventAttendance.WebApi.Models;
using System;
using System.Data.SqlClient;
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
            var paramFilter = new SqlParameter { ParameterName = "filter", Value = DBNull.Value };

            if (!string.IsNullOrEmpty(filter))
            {
                paramFilter.Value = filter;
            }

            var data = db.Database
               .SqlQuery<Attendee_VM>("EXEC dbo.Att_GetAttendees @filter", paramFilter)
               .ToList();

            return data.AsQueryable();

            ////return db.Attendees;
            //var data = !string.IsNullOrEmpty(filter)
            //    ? db.Attendees.Include(c => c.Zone).Include(c => c.City).Where(c => c.FirstName.StartsWith(filter) || c.LastName.StartsWith(filter)).ToList()
            //    : db.Attendees.Include(c => c.Zone).Include(c => c.City).ToList();

            //return data.Select(c => new Attendee_VM
            //{
            //    Id = c.Id,
            //    FirstName = c.FirstName,
            //    MiddleName = c.MiddleName,
            //    LastName = c.LastName,
            //    Gender = c.Gender,
            //    Address = c.Address,
            //    ZoneId = c.ZoneId,
            //    CityId = c.CityId,

            //    //ZoneName = c.ZoneName,
            //    IsKaryakar = c.IsKaryakar,
            //    FullName = c.FullName,
            //    CityName = c.CityName,
            //    ZoneName = c.ZoneName,
            //}).AsQueryable();
        }

        [Route("api/Attendees/GetZones")]
        public IQueryable<Zone_VM> GetZones()
        {
            // return db.Zones.Select(c => new Zone_VM { Id = c.Id, Name = c.Name });

            var data = db.Database.SqlQuery<Zone_VM>("EXEC dbo.Att_GetZones").ToList();

            return data.AsQueryable();
        }

        [Route("api/Attendees/GetCities")]
        public IQueryable<City_VM> GetCities()
        {
            //return db.Cities.Select(c => new City_VM { Id = c.Id, Name = c.Name });

            var data = db.Database.SqlQuery<City_VM>("EXEC dbo.Att_GetCities").ToList();
            return data.AsQueryable();
        }

        // GET: api/Attendees/5
        [ResponseType(typeof(Attendee_VM))]
        public async Task<IHttpActionResult> GetAttendee(int id)
        {
            //Att_Attendee attendee = await db.Attendees.FindAsync(id);
            //var attendeeVM = new Attendee_VM
            //{
            //    Id = attendee.Id,
            //    Address = attendee.Address,
            //    FirstName = attendee.FirstName,
            //    MiddleName = attendee.MiddleName,
            //    LastName = attendee.LastName,
            //    Gender = attendee.Gender,
            //    FullName = attendee.FullName,
            //    IsKaryakar = attendee.IsKaryakar,
            //    CityId = attendee.CityId,
            //    CityName = attendee.CityName,
            //    ZoneId = attendee.ZoneId,
            //    ZoneName = attendee.ZoneName,
            //};

            var paramId = new SqlParameter { ParameterName = "Id", Value = id };

            var attendeeVM = db.Database
               .SqlQuery<Attendee_VM>("EXEC dbo.Att_GetAttendeeById @Id", paramId)
               .FirstOrDefault();

            if (attendeeVM == null)
            {
                return NotFound();
            }

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


            try
            {
                await db.Database
                    .ExecuteSqlCommandAsync("EXEC dbo.Att_SaveAttendee @Id, @FirstName, @MiddleName, @LastName, @Gender, @Address, @ZoneId, @CityId, @IsKaryakar",
                        new SqlParameter { ParameterName = "Id", Value = attendee.Id },
                        new SqlParameter { ParameterName = "FirstName", Value = attendee.FirstName },
                        new SqlParameter { ParameterName = "MiddleName", Value = attendee.MiddleName },
                        new SqlParameter { ParameterName = "LastName", Value = attendee.LastName },
                        new SqlParameter { ParameterName = "Gender", Value = attendee.Gender },
                        new SqlParameter { ParameterName = "Address", Value = attendee.Address },
                        new SqlParameter { ParameterName = "ZoneId", Value = attendee.ZoneId },
                        new SqlParameter { ParameterName = "CityId", Value = attendee.CityId },
                        new SqlParameter { ParameterName = "IsKaryakar", Value = attendee.IsKaryakar }
                    );
            }
            catch (Exception ex)
            {
                throw;
            }

            //db.Entry(attendee).State = EntityState.Modified;

            //try
            //{
            //    await db.SaveChangesAsync();
            //}
            //catch (DbUpdateConcurrencyException)
            //{
            //    if (!AttendeeExists(id))
            //    {
            //        return NotFound();
            //    }
            //    else
            //    {
            //        throw;
            //    }
            //}

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

            //db.Attendees.Add(attendee);
            //await db.SaveChangesAsync();

            try
            {
               await db.Database
                   .ExecuteSqlCommandAsync("EXEC dbo.Att_SaveAttendee @Id, @FirstName, @MiddleName, @LastName, @Gender, @Address, @ZoneId, @CityId, @IsKaryakar",
                       new SqlParameter { ParameterName = "Id", Value = attendee.Id },
                       new SqlParameter { ParameterName = "FirstName", Value = attendee.FirstName },
                       new SqlParameter { ParameterName = "MiddleName", Value = attendee.MiddleName },
                       new SqlParameter { ParameterName = "LastName", Value = attendee.LastName },
                       new SqlParameter { ParameterName = "Gender", Value = attendee.Gender },
                       new SqlParameter { ParameterName = "Address", Value = attendee.Address },
                       new SqlParameter { ParameterName = "ZoneId", Value = attendee.ZoneId },
                       new SqlParameter { ParameterName = "CityId", Value = attendee.CityId },
                       new SqlParameter { ParameterName = "IsKaryakar", Value = attendee.IsKaryakar }
                   );
            }
            catch (Exception ex)
            {
                throw;
            }

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