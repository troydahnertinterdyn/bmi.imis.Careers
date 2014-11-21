using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace bmi.imis.MABanker.Careers.Models
{
    [Table("Resumes")]
    public class Resume
    {
        public Resume() {
            PostDate = DateTime.Now.Date;
        }
        [Key]
        public int ResumeID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Telephone { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
        public DateTime? PostDate { get; set; }
        public bool Approved { get; set; }
        public int Category { get; set; }
        [NotMapped]
        public string CategoryName
        {
            get
            {
                if (Category == 0) return string.Empty;
                using (var context = new CareersContext())
                {
                    var category = context.Categories.Where(c => c.Id == Category).FirstOrDefault();
                    if (category == null) return string.Empty;
                    return category.Name;
                }
            }
        }
        public string ResumeText { get; set; }
        public virtual  ResumeBinary ResumeBinary { get; set; }



    }
    public class ResumeBinary
    {
        [Key, ForeignKey("Resume")]
        public int ResumeID { get; private set; }
        public byte[] ResumeBytes { get; set; }
        public string FileName { get; set; }
        public string ContentType { get; set; }
        public virtual Resume Resume { get; set; }
    }
}