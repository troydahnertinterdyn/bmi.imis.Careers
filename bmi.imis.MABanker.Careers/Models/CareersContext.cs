using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Migrations;

namespace bmi.imis.MABanker.Careers.Models
{
    public class CareersContext : DbContext
    {
        public CareersContext() :base("CareersContext")
        { }
        public DbSet<Posting> Postings { get; set; }
        public DbSet<CareerCategory> Categories { get; set; }
        public DbSet<CareerState> States { get; set; }
        public DbSet<Resume> Resumes { get; set; }
        public DbSet<ResumeBinary> ResumeBinaries { get; set; }
        protected override void OnModelCreating(DbModelBuilder builder)
        {
            
            builder.Entity<ResumeBinary>().HasKey(c => c.ResumeID);
            builder.Entity<ResumeBinary>().Property(e => e.ResumeID).HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);
            //builder.Entity<ResumeBinary>().HasRequired(e => e.Resume).WithRequiredDependent(e=>e.ResumeBinary);
            builder.Entity<Resume>().HasOptional<ResumeBinary>(r => r.ResumeBinary).WithRequired(r=>r.Resume);
        }
    }

}