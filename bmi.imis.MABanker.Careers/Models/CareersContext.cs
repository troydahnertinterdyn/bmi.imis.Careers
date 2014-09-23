using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace bmi.imis.MABanker.Careers.Models
{
    public class CareersContext : DbContext
    {
        public CareersContext() :base("CareerContext")
        { }
        public DbSet<Posting> Postings { get; set; }
        public DbSet<CareerCategory> Categories { get; set; }
        public DbSet<CareerState> States { get; set; }
    }
}