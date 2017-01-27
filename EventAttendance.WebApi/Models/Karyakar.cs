using System;
using System.Collections.Generic;

namespace EventAttendance.WebApi.Models
{
    public partial class Karyakar
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string Zone { get; set; }
    }
}
