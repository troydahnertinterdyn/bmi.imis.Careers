using bmi.imis.MABanker.Careers.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Asi.Web.UI;
using System.Web.ModelBinding;

namespace bmi.imis.MABanker.Careers.Careers
{
    public partial class JobPosting : CareersBase
    //public partial class JobPosting : ControlBase
    {
        public bool IsOwner { 
            get
            {
                return true;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!Page.IsPostBack)
            {
                if (IsStaffUser) fvJobPosting.DefaultMode = FormViewMode.Edit;
                else fvJobPosting.DefaultMode = FormViewMode.ReadOnly;
                if (Request.QueryString["PostingId"] == null && !IsAuthenticated) RedirectToLogin();
                //todo
                //If  (Request.QueryString["PostingId"] == null && IsAuthenticated && no credits prompt to purchase credits)
            }
        }
        public Posting GetPosting([QueryString("PostingId")]int? postingId)
        {
            Posting rtn;
            if (postingId == null) return new Posting();
                using (var context = new CareersContext())
                {
                    rtn = (from p in context.Postings
                          where p.JobID == postingId
                               select p).SingleOrDefault();
                    var currentCategory = rtn.Category;
                    if (context.Categories.Where(c=>c.Id == currentCategory).Count() == 0)
                    {
                        rtn.Category = 0;
                    }
                }
            return rtn;            
	    }

        public void fvJobPosting_UpdateItem(Posting posting)
        {
            using (var context = new CareersContext())
            {
                if (posting.JobID == 0) context.Entry(posting).State = System.Data.Entity.EntityState.Added;
                else context.Entry(posting).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
            Response.Redirect(Request.Url.AbsolutePath + "?PostingId=" + posting.JobID.ToString());
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            fvJobPosting.ChangeMode(FormViewMode.ReadOnly);
        }
            
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            fvJobPosting.ChangeMode(FormViewMode.Edit);
        }
    }
}