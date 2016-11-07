using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApiService.Controllers
{
    public class user
    {
        public int id { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string username { get; set; }
        public string email { get; set; }
        public string age { get; set; }
    }

    public class QAController : ApiController
    {
        public QAController()
        {

        }

        // GET= api/QA
        public IEnumerable<user> Get()
        {
            return new List<user>
            {
                new user
                {
                    id = 10,
                    firstName = "Paresh",
                    lastName = "Sutariya",
                      username= "paresh.sutariya",
                      email= "paresh.sutariya@synechron.com",
                      age= "34"
                },

            new user
            {
                id= 1,
                firstName= "Mark",
                lastName= "Otto",
                username= "@mdo",
                email= "mdo@gmail.com",
                age= "28"
            },
          new user
          {
                    id= 2,
              firstName= "Jacob",
              lastName= "Thornton",
              username= "@fat",
              email= "fat@yandex.ru",
              age= "45"
          },
         new user
         {
                    id= 3,
              firstName= "Larry",
              lastName= "Bird",
              username= "@twitter",
              email= "twitter@outlook.com",
              age= "18"
          },
         new user
         {
                    id= 4,
              firstName= "John",
              lastName= "Snow",
              username= "@snow",
              email= "snow@gmail.com",
              age= "20"
          },
         new user
         {
                    id= 5,
              firstName= "Jack",
              lastName= "Sparrow",
              username= "@jack",
              email= "jack@yandex.ru",
              age= "30"
          },
      };
            //return new string[] { "value1", "value2" };
        }

        // GET= api/QA/5
        public string Get(int id)
        {
            return "value";
        }

        // POST= api/QA
        public void Post([FromBody]string value)
        {
        }

        // PUT= api/QA/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE= api/QA/5
        public void Delete(int id)
        {
        }
    }
}
