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
        public Resume()
        {
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
                var contextCategories = HttpContext.Current.Session["Categories"];
                if (contextCategories == null)
                {
                    using (var context = new CareersContext())
                    {
                        var categories = context.Categories.Select(c => c).ToDictionary(c => c.Id, c => c.Name);
                        HttpContext.Current.Session["Categories"] = categories;
                        contextCategories = HttpContext.Current.Session["Categories"];
                    }
                }
                var castCategories = ((Dictionary<int, string>)contextCategories);
                if (castCategories.ContainsKey(Category) && Category != 0)
                {
                    return castCategories[Category];
                }
                else return string.Empty;
            }

        }
        public string ResumeText { get; set; }
        public virtual ResumeBinary ResumeBinary { get; set; }



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