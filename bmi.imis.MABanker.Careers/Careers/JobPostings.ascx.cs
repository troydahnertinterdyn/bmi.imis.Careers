using bmi.imis.MABanker.Careers.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bmi.imis.MABanker.Careers.Careers
{
    public partial class JobPostings : CareersBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                using (var context = new CareersContext())
                {
                    var postings = context.Postings.ToList();
                    gvJobPostings.DataSource = postings;
                    gvJobPostings.DataBind();
                }
            }
        }
    }
}