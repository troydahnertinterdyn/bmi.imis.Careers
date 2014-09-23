using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace bmi.imis.MABanker.Careers.Models
{
    public class CareerCategory
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public static List<CareerCategory> GetCategories (HttpSessionStateBase session)
        {
            if (session["CareerCategories"] != null)
            {
                return (List<CareerCategory>)session["CareerCategories"];
            }
            else
            {
                using (var context = new CareersContext())
                {
                    var rtn = context.Categories.ToList();
                    session["CareerCategories"] = rtn;
                    return rtn;
                }
            }
        }
    }
}