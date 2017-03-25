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
        }

        [Route("api/Attendees/GetAttendeesActive")]
        public IQueryable<Attendee_VM> GetAttendeesActive(string filter)
        {
            var paramFilter = new SqlParameter { ParameterName = "filter", Value = DBNull.Value };

            if (!string.IsNullOrEmpty(filter))
            {
                paramFilter.Value = filter;
            }

            var data = db.Database
               .SqlQuery<Attendee_VM>("EXEC dbo.Att_GetAttendeesForActive @filter", paramFilter)
               .ToList();

            return data.AsQueryable();
        }

        [Route("api/Attendees/GetZones")]
        public IQueryable<Zone_VM> GetZones()
        {
            var data = db.Database.SqlQuery<Zone_VM>("EXEC dbo.Att_GetZones").ToList();

            return data.AsQueryable();
        }

        [Route("api/Attendees/GetSevas")]
        public IQueryable<Seva_VM> GetSevas()
        {
            var data = db.Database.SqlQuery<Seva_VM>("EXEC dbo.Att_GetSevas").ToList();

            return data.AsQueryable();
        }

        [Route("api/Attendees/GetCities")]
        public IQueryable<City_VM> GetCities()
        {
            var data = db.Database.SqlQuery<City_VM>("EXEC dbo.Att_GetCities").ToList();
            return data.AsQueryable();
        }

        // GET: api/Attendees/5
        [ResponseType(typeof(Attendee_VM))]
        public async Task<IHttpActionResult> GetAttendee(int id)
        {
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
                    .ExecuteSqlCommandAsync("EXEC dbo.Att_SaveAttendee @Id, @FirstName, @MiddleName, @LastName, @Gender, @Address, @ZoneId, @CityId, @ImsId, @IsKaryakar, @SevaFullNames, @IsDeleted",
                        new SqlParameter { ParameterName = "Id", Value = attendee.Id },
                        new SqlParameter { ParameterName = "FirstName", Value = attendee.FirstName },
                        new SqlParameter { ParameterName = "MiddleName", Value = string.IsNullOrEmpty(attendee.MiddleName) ? " " : string.Empty },
                        new SqlParameter { ParameterName = "LastName", Value = attendee.LastName },
                        new SqlParameter { ParameterName = "Gender", Value = attendee.Gender },
                        new SqlParameter { ParameterName = "Address", Value = attendee.Address },
                        new SqlParameter { ParameterName = "ZoneId", Value = attendee.ZoneId },
                        new SqlParameter { ParameterName = "CityId", Value = attendee.CityId },
                        new SqlParameter { ParameterName = "ImsId", Value = attendee.ImsId },
                        new SqlParameter { ParameterName = "IsKaryakar", Value = attendee.IsKaryakar },
                        new SqlParameter { ParameterName = "SevaFullNames", Value = string.IsNullOrEmpty(attendee.SevaFullNames) ? "-->" : attendee.SevaFullNames },
                        new SqlParameter { ParameterName = "IsDeleted", Value = attendee.IsDeleted }
                    );
            }
            catch (Exception ex)
            {
                throw;
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

            try
            {
                await db.Database
                    .ExecuteSqlCommandAsync("EXEC dbo.Att_SaveAttendee @Id, @FirstName, @MiddleName, @LastName, @Gender, @Address, @ZoneId, @CityId, @ImsId, @IsKaryakar, @IsDeleted",
                        new SqlParameter { ParameterName = "Id", Value = attendee.Id },
                        new SqlParameter { ParameterName = "FirstName", Value = attendee.FirstName },
                        new SqlParameter { ParameterName = "MiddleName", Value = attendee.MiddleName },
                        new SqlParameter { ParameterName = "LastName", Value = attendee.LastName },
                        new SqlParameter { ParameterName = "Gender", Value = attendee.Gender },
                        new SqlParameter { ParameterName = "Address", Value = attendee.Address },
                        new SqlParameter { ParameterName = "ZoneId", Value = attendee.ZoneId },
                        new SqlParameter { ParameterName = "CityId", Value = attendee.CityId },
                        new SqlParameter { ParameterName = "ImsId", Value = attendee.ImsId },
                        new SqlParameter { ParameterName = "IsKaryakar", Value = attendee.IsKaryakar },
                        new SqlParameter { ParameterName = "IsDeleted", Value = attendee.IsDeleted }
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