using bmi.imis.MABanker.Careers.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bmi.imis.MABanker.Careers.Careers
{
    public partial class ResumePostings : CareersBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<bmi.imis.MABanker.Careers.Models.Resume> gvResumes_GetData()
        {
            var context = new CareersContext();
            IQueryable<Resume> rtn = context.Resumes;
            var dateAfterWhichListingsExpire = DateTime.Now.AddDays(-int.Parse(ConfigurationManager.AppSettings["DaysAfterWhichListingsExpire"]));

                rtn = rtn.Where(p => p.PostDate >= dateAfterWhichListingsExpire || p.PostDate == null);
            

            if (ddlCategory.SelectedIndex != 0)
            {
                int category = int.Parse(ddlCategory.SelectedValue);
                rtn = rtn.Where(r => r.Category == category);
            }
            if (ddlState.SelectedIndex != 0) rtn = rtn.Where(r => r.State == ddlState.SelectedValue);
            if (tbKeyword.Text != string.Empty)
            {
                //TODO:  Not efficient.  Unable to find faster method
                rtn = rtn.Where(p => p.ResumeText.ToLower() == tbKeyword.Text.ToLower() ||
                    p.City.ToLower() == tbKeyword.Text.ToLower());
            }
            return rtn;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void gvResumes_DeleteItem(int resumeID)
        {
            using (var context = new CareersContext())
            {
                var resume = (from r in context.Resumes
                              where r.ResumeID == resumeID
                              select r).SingleOrDefault();
                var resumeBinary = (from r in context.ResumeBinaries
                                    where r.ResumeID == resumeID
                                    select r).SingleOrDefault();
                context.Entry(resumeBinary).State = System.Data.Entity.EntityState.Deleted;
                context.Entry(resume).State = System.Data.Entity.EntityState.Deleted;
                context.SaveChanges();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvResumes.Visible = true;
            gvResumes.DataBind();
        }
    }
}