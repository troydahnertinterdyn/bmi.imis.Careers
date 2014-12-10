using bmi.imis.MABanker.Careers.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Asi.Web.UI;
using System.Web.ModelBinding;
using System.Net.Mail;
using System.Configuration;
using Asi.Soa.ClientServices;
using Asi.Soa.Core.DataContracts;

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
        public int? PostingId { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!Page.IsPostBack)
            {
                int tempPostingId;
                if (int.TryParse(Request.QueryString["PostingId"], out tempPostingId)) PostingId = tempPostingId;
                else PostingId = null;
                if (PostingId == null)
                {
                    if (!IsAuthenticated ) RedirectToLogin();
                    else
                    {
                        fvJobPosting.ChangeMode(FormViewMode.Edit);
                        fvJobPosting.DefaultMode = FormViewMode.Edit;
                    }
                }
                else 
                {
                    if ( !IsStaffUser)
                    {
                        fvJobPosting.ChangeMode(FormViewMode.ReadOnly);
                        fvJobPosting.DefaultMode = FormViewMode.ReadOnly;
                    }
                    else
                    {
                        fvJobPosting.ChangeMode(FormViewMode.Edit);
                        fvJobPosting.DefaultMode = FormViewMode.Edit;
                    }
                }
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
                    if (rtn == null) return null;
                    if (rtn.Category == null)
                    {
                        rtn.Category = 0;
                    }
                    else
                    {
                        var currentCategory = rtn.Category;
                        if (context.Categories.Where(c => c.Id == currentCategory).Count() == 0)
                        {
                            rtn.Category = 0;
                        }
                    }
                }
            return rtn;            
	    }

        public void fvJobPosting_UpdateItem(Posting posting)
        {
            using (var context = new CareersContext())
            {
                if (posting.JobID == 0 && !IsStaffUser && PostingCredits <= 0) Response.Redirect(Request.Url.AbsoluteUri);
                bool decrementJobCredits = false;
                var postDateString = string.Empty;
                DateTime postDate;
                var postDateTextbox = (TextBox)fvJobPosting.FindControl("txtPostDate");
                if (postDateTextbox.Text != null && DateTime.TryParse(postDateTextbox.Text, out postDate)) posting.PostDate = postDate;
                else posting.PostDate = null;
                if (posting.JobID == 0 )
                {
                    context.Entry(posting).State = System.Data.Entity.EntityState.Added;
                    if (!IsStaffUser) decrementJobCredits = true;
                }
                else context.Entry(posting).State = System.Data.Entity.EntityState.Modified;
                if (posting.Approved == false) SendUnapprovedNotification(posting);
                context.SaveChanges();
                if (decrementJobCredits) PostingCredits = PostingCredits -1;

            }
            Response.Redirect(Request.Url.AbsolutePath + "?PostingId=" + posting.JobID.ToString());
        }

        private void SendUnapprovedNotification(Posting posting)
        {
            if (ConfigurationManager.AppSettings["SendCareersNotifications"] != null && bool.Parse(ConfigurationManager.AppSettings["SendCareersNotifications"]))
            {
                try
                {
                    //todo set up mail correctly
                    MailMessage mailMessage = new MailMessage();
                    mailMessage.To.Add("troy.dahnert@interdynbmi.com");
                    mailMessage.From = new MailAddress("TheCoolestGuyAtBMI@interdynbmi.com");
                    mailMessage.Subject = "Job Posting " + posting.JobID + " Needs to be approved";
                    mailMessage.Body = "Job Posting " + posting.JobID + " Needs to be approved <br /><br /> " + HttpContext.Current.Request.Url.AbsoluteUri;
                    mailMessage.IsBodyHtml = true;

                    SmtpClient smtpClient = new SmtpClient("mail.interdynbmi.com");
                    smtpClient.Send(mailMessage);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
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