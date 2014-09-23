using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace bmi.imis.MABanker.Careers.Models
{
    public class Posting
    {
        public Posting()
        {
            Category = 0;
            State = string.Empty;
            PostDate = DateTime.Now;
        }
        public Posting(string postingID)
        {
        }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Company { get; set; }
        public string WorkPhone { get; set; }
        public string Email { get; set; }
        public bool AnnonymousPost { get; set; }
        public string Title { get; set; }
        public int Category { get; set; }
        public string Description { get; set; }
        public string Requirements { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ContactInformation { get; set; }
        public string WebSiteURL { get; set; }
        public string Comments { get; set; }
        public DateTime PostDate { get; set; }
        [Key]
        public int JobID { get; set; }
    }
}